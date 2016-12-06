navigator.geolocation.getCurrentPosition(onLocation, error, options);
var options = {
	enableHighAccuracy:true,
};

function onLocation(position) {
	coords = position.coords.latitud+","+position.coords.longitude;
	return coords;
}

function error(error) {
	console.log("error");
	return true;
}