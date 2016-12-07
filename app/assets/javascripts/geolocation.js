navigator.geolocation.getCurrentPosition(onLocation, error, options);


function onLocation(position) {
	coords =position.coords.latitude+","+position.coords.longitude;
}

function error(error) {
	console.log("error");
	return true;
}
var options = {
	enableHighAccuracy:true,
};