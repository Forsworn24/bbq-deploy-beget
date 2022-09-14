ymaps.ready(init);

function init() {
  let myMap = new ymaps.Map("map", {
      center: [59, 30],
      zoom: 9
  });

  let address = document.getElementById('map').getAttribute('data-address');

  myGeocoder = ymaps.geocode(address);

  myGeocoder.then(
    function (res) {
      coordinates = res.geoObjects.get(0).geometry.getCoordinates();

      myMap.geoObjects.add(
          new ymaps.Placemark(
            coordinates,
            {iconContent: address},
            {preset: 'islands#blueStretchyIcon'}
          )
      );

      myMap.setCenter(coordinates);
      myMap.setZoom(15);
    }, function (err) {
      alert('Ошибка при определении местоположения');
    }
  );
}
