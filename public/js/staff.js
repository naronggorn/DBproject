function loadData() {
    $.get("/get-staff", function (data, statusTxt) {
        if (statusTxt == "success") {
            var obj = JSON.parse(data);
            for (i = 0; i < obj.length; i++) {
                var row = `<tr><th scope="row">${(parseInt(i, 10) + 1)}</th>\n`;
                for (j = 0; j < obj[i].length - 1; j++) {
                    row += `<td>${obj[i][j]}</td>\n`;
                }
                row += `
                    <td><button type="button" class="btn btn-primary" id="edit" data-toggle="modal" data-target="#editModal" data-id="${obj[i][0]}">แก้ไข</button></td>\n
                    <td><button type="button" class="btn btn-danger" id="del" data-toggle="modal" data-target="#deleteModal" data-id="${obj[i][0]}">ลบ</button></td>\n
                    </tr>
                `;

                $('tbody').append(row);
            }
        }
    });
}

$(document).ready(function () {
    loadData();
});

$('#editModal').on('show.bs.modal', function (e) {
    $.get("/get-staff/" + $(e.relatedTarget).data('id'), function (data, status) {
        var obj = JSON.parse(data);
        $("#modal_staff_id").val(obj.staffID);
        $("#modal_name").val(obj.staff_name);
        $("#modal_surname").val(obj.staff_surname);
        $("#modal_password").val("");
    });
});

function saveEdit() {
    $.post("/edit-staff",
        {
            id: $("#modal_staff_id").val(),
            name: $("#modal_name").val(),
            surname: $("#modal_surname").val(),
            pass: $("#modal_password").val()
        },
        function (data, status) {
            if (status === "success") {
                $('#editModal').modal('toggle');
                $('div.modal-backdrop.fade').remove();
                $('body').removeAttr('class');
                $('tbody').empty();
                loadData();
            }
            else alert("Data: " + data + "\nStatus: " + status);
        });
}

var deleteID;

$('#deleteModal').on('show.bs.modal', function (e) {
    deleteID = $(e.relatedTarget).data('id');
    $("#confirm").text("Are you want to delete user id " + $(e.relatedTarget).data('id') + "?");
});

$('#deleteModal').on('hide.bs.modal', function (e) {
    document.getElementById("confirm").innerHTML = "";
});

function deleteParent() {
    $.post("/delete-staff",
        {
            id: deleteID
        },
        function (data, status) {
            if (status === "success") {
                $('#deleteModal').modal('toggle');
                $('div.modal-backdrop.fade').remove();
                $('body').removeAttr('class');
                $('tbody').empty();
                loadData();
            }
            else alert("Data: " + data + "\nStatus: " + status);
        });
}