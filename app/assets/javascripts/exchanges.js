
$(document).ready(function () {
    Screen.ajustReverseBox();

    $('form').submit(function () {
       if($('form').attr('action') == '/convert'){
           console.log("hello");
           convert()
           return false
       }
   })
    $("#amount").focusout(function() {
        console.log();
        convert()
    });
});

var Screen = {
    ajustReverseBox : function () {
        let button_reverse = $(".button-reverse");
        let card_block_width = $(".card-block").width();
        let button_reverse_width = button_reverse.outerWidth();

        let margin_left = ( card_block_width/2 ) - (button_reverse_width/2);
        button_reverse.css("margin-left", margin_left+"px");

        button_reverse.click(function () {
            Screen.buttonReverseClick()
        })
    },
    buttonReverseClick : function () {
        let source_value = $("#amount").val();
        let source_currency = $("#source_currency").val();

        let target_value = $("#result").val()
        target_value = (target_value == "") ? 0 : target_value;
        let target_currency = $("#target_currency").val();

        $("#result").val(source_value);
        $("#amount").val(target_value);
        $("#source_currency").val(target_currency).change();
        $("#target_currency").val(source_currency).change();

    }
}


function convert() {
    $.ajax({
        url: '/convert',
        type: 'GET',
        dataType: 'json',
        data: {
            source_currency: $("#source_currency").val(),
            target_currency: $("#target_currency").val(),
            amount: $("#amount").val()
        },
        success: function (data, text, jqXHR) {
            $("#result").val(data.value);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("error");
        }
    });
}