
$(document).ready(function() {

  // =========================================================================

  if ($("#new_location").length > 0 ) {

    navigator.geolocation.getCurrentPosition(function(position) {
      $("#location_longitude").val(position.coords.longitude);
      $("#location_latitude").val(position.coords.latitude);
      $("#new_location [type=submit]")
        .val("Save Location")
        .removeClass("btn btn-info")
        .addClass("btn btn-success")
        .attr("disabled", false);
    });
  }

  // =========================================================================

  if ($(".map-container").length > 0) {

    mapboxgl.accessToken = 'pk.eyJ1Ijoid2VzdG1kMjMiLCJhIjoiY2lvMHNhZ3gyMTl6aXRxa2pnbDM0ajBzOCJ9.f-skllhdyAEgwGO_UZhk8Q';
    var map = new mapboxgl.Map({
      container: 'mapIndex',
      style: 'mapbox://styles/mapbox/streets-v8',
      center: [-77.06274032592773,
        38.896109869098964
      ],
      zoom: 13
    });

    map.on('load', function() {
        map.addSource("markers", {
            "type": "geojson",
            "data": {
              "type": "FeatureCollection",
              "features": latlongArray
          }
        });

      map.addLayer({
        "id": "markers",
        "type": "symbol",
        "source": "markers",
        "layout": {
          "icon-image": "{marker-symbol}-15",
          "text-field": "{title}",
          "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
          "text-offset": [0, 0.6],
          "text-anchor": "top"
        }
      });
    });

    var popup = new mapboxgl.Popup({
        closeButton: false,
        closeOnClick: false
      });

    map.on("mousemove", function (e) {
       var features = map.queryRenderedFeatures(e.point, { layers: ["markers"] });

       map.getCanvas().style.cursor = (features.length) ? 'pointer' : '';

       if (!features.length) {
            popup.remove();
            return;
       }

       var feature = features[0];

       popup.setLngLat(feature.geometry.coordinates)
         .setHTML("<p class='map-activity-title'><a href='"+feature.properties.url+"'>"+ feature.properties.truck_title + "</a></p>" + feature.properties.address)
         .addTo(map)

   });

    navigator.geolocation.getCurrentPosition(function(position) {
      var current_location = [position.coords.longitude, position.coords.latitude]
      map.panTo(current_location);
    });



}
});
