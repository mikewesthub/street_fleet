console.log('HI');
$( document ).ready( function() {

  if ($(".map-container").length > 0 ) {

  mapboxgl.accessToken = 'pk.eyJ1Ijoid2VzdG1kMjMiLCJhIjoiY2lvMHNhZ3gyMTl6aXRxa2pnbDM0ajBzOCJ9.f-skllhdyAEgwGO_UZhk8Q';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v8',
        center: [
          -77.03716278076172,
          38.90198809660059
         ],
        zoom: 12
    });
  }
});
