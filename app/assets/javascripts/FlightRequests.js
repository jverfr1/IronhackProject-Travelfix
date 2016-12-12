// var apiKey = "jo287334731819450488945779175902"
// var urlPostPlace = "http://partners.api.skyscanner.net/apiservices/pricing/v1.0" 
// $(document).on('ready', function(){
// 	$('.js-search-flight').on('click',handleFlightRequest)
// });

// function handleFlightRequest(event) {
// 	event.preventDefault();
 
// 	// var coord       = navigator.geolocation.getCurrentPosition(onLocation, error, options);
// 	var flightParams = {
// 		currency: "EUR",
// 		country: "es",
// 		apiKey: apiKey,
// 		locale: "es-es",
// 		originplace: "Madrid",
// 		destinationplace: "Paris",
// 		outbounddate: 2016-12-18,
// 		inbounddate: 2017-01-05,
// 		adults: 1
// 	}
// 	ajaxRequest(urlPostPlace, getEmbassyReference,"POST");
// }
// function ajaxRequest(uri, callbackSuccess, method) {
// 	method = method || "GET";
// 	$.ajax({
// 		type: method,
//         url: $('#js.flight-data').attr('action'),
//         data:  $('#js.flight-data').serialize()
//         dataType: 'json',
//         contentType: "application/json; charset=utf-8",
//         crossDomain: true,
//         headers: { 'Accept':  'application/json', 'Content-Type': 'application/x-www-form-urlencoded', 'Access-Control-Request-Methods': 'POST,GET,OPTIONS'
//         },

// 		success: callbackSuccess,
// 		error: handleError
// 	});	
// }

// function showResponse(response) {
// 	console.log(response)
// }

