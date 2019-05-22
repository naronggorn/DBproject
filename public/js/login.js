if(sessionStorage.getItem("Token") !== null) {
    window.location.replace("/home");
}

function loading() {
    $('#signin').empty();
    $('#signin').attr('disabled');
    $('#signin').append(
        `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>\nLoading`
        );
}

function signin() {
    $.post("/login", {
            sid: $("#inputSID").val(),
            pass: $("#inputPassword").val()
        },
        function (data, status) {
            if (status === "success") {
                sessionStorage.setItem("Token", data);

                
            }
            else alert("Data: " + data + "\nStatus: " + status);
        });
}

$('#signin').on('click', async function () {
    if ($('#inputSID').val() !== '' && $('#inputPassword').val() !== '') {
        await loading();
        await signin();
    }
});

$('#signinForm').keypress(async function (event) {
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode == '13' && $('#inputSID').val() !== '' && $('#inputPassword').val() !== '') {
        await loading();
        await signin();
    }
});