var coords;
navigator.geolocation.getCurrentPosition(onLocation, error, options);
var options = {
	enableHighAccuracy:true,
};

function onLocation(position) {
	coords = position.coords.latitude+","+position.coords.longitude;
}

function error(error) {
	console.log("error");
	return true;
}