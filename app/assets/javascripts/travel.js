$(document).on('turbolinks:load', function(){
    $('.slider').slider({ indicators: false, full_width: true});

	$('.datepicker').pickadate({
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15 // Creates a dropdown of 15 years to control year
	 });
});