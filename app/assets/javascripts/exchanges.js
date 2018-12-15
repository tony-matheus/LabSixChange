
$(document).ready(function () {
    Screen.ajustReverseBox();

    $('form').submit(function () {
       if($('form').attr('action') == '/convert'){
           convert();
           return false
       }
   })
    $("#amount").focusout(function() {
        console.log();
        convert()
    });
});

$(window).resize(function(){
    Screen.ajustReverseBox();
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
    let source = $("#source_currency").val();
    let target = $("#target_currency").val();
    if(source == "BTC" || target == "BTC" ){
        bitcoin(source, target)
        return
    }
    $.ajax({
        url: '/convert',
        type: 'GET',
        dataType: 'json',
        data: {
            source_currency: source,
            target_currency: target,
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

function bitcoin(source, target, exchange = "") {
    if(source == "BTC" ) {
        exchange = "from"
    }else if(target == "BTC"){
        exchange = "to"
    }

    $.ajax({
        url: '/bitcoin',
        type: 'GET',
        dataType: 'json',
        data: {
            source_currency: source,
            target_currency: target,
            exchange: exchange,
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