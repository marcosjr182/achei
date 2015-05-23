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
//= require underscore-min
//= require gmaps/google
//= require_tree .


var ready = function(){
 

  
}

$(document).ready(ready);
$(document).on('page:load', ready);

function create_map(place){
  
  handler = Gmaps.build('Google');
  
  handler.buildMap(
    { provider: {
      disableDefaultUI: true,
      scrollwheel: false,
      zoom: 8
    }, internal: {id: 'map'}}, function(){
    var markers = handler.addMarkers([
      {
        "lat": place.latitude,
        "lng": place.longitude,
        "infowindow": place.name
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(18);
  }); 
};
