var apiKey = "AIzaSyBTonLZT2cEOII-Tqc1GpTgUA-zDT_a1mg";
var urlPlace = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
var urlDetails = "https://maps.googleapis.com/maps/api/place/details/json?";
var reference;
$(document).on('ready', function() {
    $('.js-embassy-search').on('click',handleRequest);
});

function ajaxRequest(uri, callbackSuccess,parameters, method) {
	method = method || "GET";
	console.log(parameters);
	$.ajax({
		type: method,
        url: uri,
        data:  parameters,
        dataType: 'json',
        // crossOrigin: true,
        // context: {},
        contentType: "application/json; charset=utf-8",
        crossDomain: true,
        headers: { "Access-Control-Allow-Origin":  '*', 'Access-Control-Allow-Methods': 'GET',
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
	// var url = "https://maps.googleapis.com/maps/api/place/details/json?reference=";
}
function handleRequest(event) {
	event.preventDefault();
 
	var coord = navigator.geolocation.getCurrentPosition(onLocation, error, options);
	var placeParams = {
		name: $('.js-embassy-name').val(),
		location: coords,
		type: "embassy",
		radius: "5000",
		key: apiKey
	}
	ajaxRequest(urlPlace, getEmbassyReference, placeParams);
}

function handleError(error) {
		console.log(url)
	console.log("error");

}
function printEmbassyDetails(embassy) {
	console.log(embassy);
}

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.4167754,-3.7037902&radius=5000&types=embassy&name=thailand&key=
// https://maps.googleapis.com/maps/api/place/details/json?reference=CmRSAAAA_6l4l0Rj_-L6yiHMdC7ARJtcjy1YRs9SqI6EWaTLur12kryDrL8Ib9WRz1aGUguoRgddPv0C52X8DpfNDiWBYMpC5VaFvNk75f6VcfwonuML-YRL4FPBSYtj2_5O9X3iEhArTk1gshWhrRPYudXdwLGIGhTgRDSQ2IAaANxF5OBoPgtzsJzTqw&key=AIzaSyBTonLZT2cEOII-Tqc1GpTgUA-zDT_a1mg