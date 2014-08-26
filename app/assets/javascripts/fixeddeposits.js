
  $(document ).ready(function() {
    $("#fixeddeposit_periods").click(function(){

    });
  });
  function fetchInterest(){
    var openingDate = $("#openingDate").val();
    $.ajax({
        type: "GET",
        url: "/fixed_deposits/get_interest_on_date.json",
        data: { opening_date: openingDate }
    })
    .done(function( data ) {
    $("#calculated_interest").val(data["interest"])
    })
    .fail(function() {
    alert( "error" );
    })
  }
