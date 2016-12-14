// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
// var slideIndex = 1;
// showDivs(slideIndex);

// function plusDivs(n) {
//     showDivs(slideIndex += n);
// }

// function showDivs(n) {
//     var i;
//     var x = document.getElementsByClassName("slide-landing");
//     if (n > x.length) {slideIndex = 1} 
//     if (n < 1) {slideIndex = x.length} ;
//     for (i = 0; i < x.length; i++) {
//         x[i].style.display = "none"; 
//     }
//     x[slideIndex-1].style.display = "block"; 
// }

$(document).ready(function(){
    $('.slider').slider({height: 770, indicators: false, full_width: true});
});
