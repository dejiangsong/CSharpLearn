/* Login start */
//js-添加表单颜色、√×图标
var user = $("#user>div>input");
var user_span = $("#user>div>span");
var password = $("#password>div>input");
var password_span = $("#password>div>span");

user.change(function () {
    if (user.val() != "") {
        user.parent().parent().removeClass("has-error");
        //√ - "glyphicon glyphicon-ok form-control-feedback"
        user_span.removeClass("glyphicon glyphicon-remove form-control-feedback");
        user_span.addClass("glyphicon glyphicon-ok form-control-feedback");
    }
    else {
        user.parent().parent().addClass("has-error");
        user_span.removeClass("glyphicon glyphicon-ok form-control-feedback");
        user_span.addClass("glyphicon glyphicon-remove form-control-feedback");
    }
});

password.change(function () {
    if (password.val() != "") {
        password.parent().parent().removeClass("has-error");
        password_span.removeClass("glyphicon glyphicon-remove form-control-feedback");
        password_span.addClass("glyphicon glyphicon-ok form-control-feedback");
    }
    else {
        password.parent().parent().addClass("has-error");
        password_span.removeClass("glyphicon glyphicon-ok form-control-feedback");
        password_span.addClass("glyphicon glyphicon-remove form-control-feedback");
    }
});
/* Login end */


/* CuttersInfoDetail start */
$(document).ready(function () {
    val = 0;
    if (($("#wearProgress .progress-bar span").html()) != "")
        result = parseFloat($("#wearProgress .progress-bar span").html()) * 100;
    else
        result = 0;
    speed = 3;
    progress_bar = $("#wearProgress .progress-bar");

    p_timer = setInterval(function () {
        val += speed;
        progress_bar.html(val + "%").css({ "width": val + "%" });
        if (val >= result) {
            progress_bar.html(result + "%").css({ "width": result + "%" });
            clearInterval(p_timer);
        }

        if (val <= 30) {
            progress_bar.addClass("progress-bar-success");
        }
        else if (val > 30 && val <= 60) {
            progress_bar.removeClass("progress-bar-success");
            progress_bar.addClass("progress-bar-info");
        }
        else if (val > 60 && val <= 90) {
            progress_bar.removeClass("progress-bar-info");
            progress_bar.addClass("progress-bar-warning");
        }
        else if (val > 90) {
            progress_bar.removeClass("progress-bar-warning");
            progress_bar.addClass("progress-bar-danger");
        }

    }, 100);
});
/* lineChart start */
//include page - CuttersInfoDetail
/* lineChart end */
/* CuttersInfoDetail end */

/* AddCutter start */
//include page - AddCutter
/* AddCutter end */

/* input-file start */
function readURL_3dImge(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#Cutter3DImages_Image').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#Cutter3DImages_FileUpload").change(function () {
    readURL_3dImge(this);
});

function readURL_image(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#Image_Image').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#Image_Fileupload").change(function () {
    readURL_image(this);
});
/* input-file end */