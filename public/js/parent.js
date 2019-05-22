function loadData() {
    $.get("/get-parent", function (data, statusTxt) {
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

$( document ).ready(function() {
    loadData();
});

$('#editModal').on('show.bs.modal', function (e) {
    $.get("/get-parent/" + $(e.relatedTarget).data('id'), function (data, status) {
        var obj = JSON.parse(data);
        document.getElementById("modal_parent_id").value = obj.parentID;
        document.getElementById("modal_f_name").value = obj.father_name;
        document.getElementById("modal_m_name").value = obj.mother_name;
        document.getElementById("modal_p_name").value = obj.parent_name;
        document.getElementById("modal_p_addr").value = obj.parent_address;
        document.getElementById("modal_p_tel").value = obj.parent_tel;
        document.getElementById("modal_p_rel").value = obj.parent_relation;
        document.getElementById("modal_password").value = "";
    });
});

function saveEdit() {
    $.post("/edit-parent",
        {
            id: document.getElementById("modal_parent_id").value,
            f_name: document.getElementById("modal_f_name").value,
            m_name: document.getElementById("modal_m_name").value,
            p_name: document.getElementById("modal_p_name").value,
            p_addr: document.getElementById("modal_p_addr").value,
            p_tel: document.getElementById("modal_p_tel").value,
            p_rel: document.getElementById("modal_p_rel").value,
            p_pass: document.getElementById("modal_password").value
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
    document.getElementById("confirm").innerHTML = "Are you want to delete user id " + $(e.relatedTarget).data('id') + "?";
});

$('#deleteModal').on('hide.bs.modal', function (e) {
    document.getElementById("confirm").innerHTML = "";
});

function deleteParent() {
    $.post("/delete-parent",
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