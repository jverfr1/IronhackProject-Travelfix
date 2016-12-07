var apiKey = "AIzaSyBTonLZT2cEOII-Tqc1GpTgUA-zDT_a1mg";

$(document).on('ready', function() {
    $('.js-embassy-search').on('click',handleRequest);
});
function ajaxRequest(callbackSuccess, method) {
	method = method || "GET";
	var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+coords+"&radius=5000&types=embassy&name="+$(".js-embassy-name").val()+"&key="+apiKey;
	console.log(url);
	$.ajax({
		type: method,
        url: url,
        contentType: "application/json; charset=utf-8",
        crossDomain: true,
        headers: { "Access-Control-Allow-Origin":  '*'
        },
		success: callbackSuccess,
		error: handleError
	});	
}
function detailsRequest(result) {
	// var prueba = "adsflkjasd";
	// debugger;
	console.log(result);
	// var url = "https://maps.googleapis.com/maps/api/place/details/json?reference=";
}
function handleRequest(event) {
	event.preventDefault();
	ajaxRequest(detailsRequest);
}

function handleError(error) {
	console.log(error);
}

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.4167754,-3.7037902&radius=5000&types=embassy&name=thailand&key=
// https://maps.googleapis.com/maps/api/place/details/json?reference=CmRSAAAA_6l4l0Rj_-L6yiHMdC7ARJtcjy1YRs9SqI6EWaTLur12kryDrL8Ib9WRz1aGUguoRgddPv0C52X8DpfNDiWBYMpC5VaFvNk75f6VcfwonuML-YRL4FPBSYtj2_5O9X3iEhArTk1gshWhrRPYudXdwLGIGhTgRDSQ2IAaANxF5OBoPgtzsJzTqw&key=AIzaSyBTonLZT2cEOII-Tqc1GpTgUA-zDT_a1mg