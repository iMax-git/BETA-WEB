  
$(function () {
    function display(bool) {
        if (bool) {
            $("body").show();
        } else {
            $("body").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://beta_rules/exit', JSON.stringify({}));
            return
        }
    };
})