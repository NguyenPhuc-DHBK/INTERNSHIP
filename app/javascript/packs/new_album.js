$(document).ready(function(event) {
    $('div.body-img i').mouseenter(function() {
        $(this).css("cursor", "pointer")
    })
    $('div.body-img i').click(function() {
         $('#fileid').click();
         $('#fileid').change(function(event) {
             var path_img = URL.createObjectURL(event.target.files[0]);
             $('div.body-img img').attr("src", path_img).css("display", "block");
             $('div.body-img').css("border", "none");
         });
    });
    $('#formAdd').validate({
        rules: {
            title: {
                required: true,
                maxlength: 140,
            },
            mode: {
                required: true
            },
            decription: {
                required: true,
                maxlength: 300
            }
        },
        messages: {
            title: {
                required: "Please enter title",
                maxlength: "Title must be most 140 characters",
            },
            mode: {
                required: "Please choose sharing mode"
            },
            decription: {
                required: "Please enter your decription",
                maxlength: "Decription must be most 300 characters"
            }
        }
    });
 });