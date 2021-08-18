
$(document).ready(function() {
    $("#new_user").validate ({
        rules: {
           firstname: {
               required: true,
               maxlength: 25
           },
           lastname: {
               required: true,
               maxlength: 25
           }, 
           password: {
               required: true,
               maxlength: 64
           },
           repassword: {
               required: true,
               maxlength: 64,
               equalTo: "#password"
           },
           email: {
               required: true,
               email: true
           }
        },
        messages: {
            firstname: {
                required: "Please enter your firstname",
                maxlength: "Your firstname must consist of at most 25 characters"
            },
            lastname: {
                required: "Please enter your lastname",
                maxlength: "Your last must consist of at most 25 characters"
            }, 
            password: {
                required: "Please provide a password",
                maxlength: "Your password must be at most 64 characters long"
            },
            repassword: {
                required: "Please provide a password",
                maxlength: "Your password must be at least 64 characters long",
                equalTo: "Please enter the same password as above"
            },
            email: "Please enter a valid email address"
        },
    });
});