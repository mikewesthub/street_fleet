
$(document).ready(function() {

  if ($(".map-container-truck").length > 0) {

    mapboxgl.accessToken = 'pk.eyJ1Ijoid2VzdG1kMjMiLCJhIjoiY2lvMHNhZ3gyMTl6aXRxa2pnbDM0ajBzOCJ9.f-skllhdyAEgwGO_UZhk8Q';
    var mapTruck = new mapboxgl.Map({
      container: 'mapTruck',
      style: 'mapbox://styles/mapbox/streets-v8',
      center: centerCoordinates,
      zoom: 15
    });

    mapTruck.on('load', function() {
        mapTruck.addSource("markers", {
            "type": "geojson",
            "data": {
              "type": "FeatureCollection",
              "features": latlongTruckArray
          }
        });

      mapTruck.addLayer({
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
