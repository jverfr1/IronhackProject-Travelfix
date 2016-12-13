var apiKey     = "AIzaSyBTonLZT2cEOII-Tqc1GpTgUA-zDT_a1mg";
var urlPlace   = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
var urlDetails = "https://maps.googleapis.com/maps/api/place/details/json?";
var reference;
$(document).on('ready', function() {
    $('.js-embassy-search').on('click',handleRequest);
});
function handleRequest(event) {
	event.preventDefault();
 
	var coord       = navigator.geolocation.getCurrentPosition(onLocation, error, options);
	var placeParams = {
		name: $('.js-embassy-name').val(),
		location: coords,
		type: "embassy",
		radius: "5000",
		key: apiKey
	}
	ajaxRequest(urlPlace, getEmbassyReference, placeParams);
}
function ajaxRequest(uri, callbackSuccess,parameters, method) {
	method = method || "GET";
	$.ajax({
		type: method,
        url: uri,
        data:  parameters,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        },

		success: callbackSuccess,
		error: handleError
	});	
}
function getEmbassyReference(response) {

	reference = response.results[0].reference;	
	var params = {
		reference: reference,
		key: apiKey
	}
	ajaxRequest(urlDetails,printEmbassyDetails,params);
}
function printEmbassyDetails(embassy) {
	console.log(embassy);
}


function handleError(error) {
		console.log(url)
	console.log("error");

}
