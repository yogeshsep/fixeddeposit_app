$(document).ready(function(){
  $(".input-mini").click(function(){
    $.ajax({
        url      : "calculate_rateofinterest.js.erb",
        dataType : 'json',
        type     : "GET",
        data     : {"rate": $(this).val() },
        success  : function(data){
           $("#interestrate_rate").val = data;
        },
        error    : function(data){
            alert("Please select the correct value");
        }
    });
  });
});