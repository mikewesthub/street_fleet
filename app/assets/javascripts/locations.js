
$(document).ready(function() {

  if ($(".map-container").length > 0) {

    mapboxgl.accessToken = 'pk.eyJ1Ijoid2VzdG1kMjMiLCJhIjoiY2lvMHNhZ3gyMTl6aXRxa2pnbDM0ajBzOCJ9.f-skllhdyAEgwGO_UZhk8Q';
    var map = new mapboxgl.Map({
      container: 'mapIndex',
      style: 'mapbox://styles/mapbox/streets-v8',
      center: [-77.03716278076172,
        38.90198809660059
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

}
});
