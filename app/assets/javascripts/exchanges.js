
$(document).ready(function () {
   $('form').submit(function () {
       if($('form').attr('action') == '/convert'){
           $.ajax({
               url: 'http://localhost:3000/convert',
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
           return false;
       }
   })
});