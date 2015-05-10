// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require_tree .


var ready = function(){
 
handler = Gmaps.build('Google');
var lat = $('#map').data('lat');
var longitude = $('#map').data('long');
var name = $('#map').data('name');

console.log(name);
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  var markers = handler.addMarkers([
      {
        "lat": lat,
        "lng": longitude,
        "infowindow": name
      }
    ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}); 
  
}

$(document).ready(ready);
$(document).on('page:load', ready);