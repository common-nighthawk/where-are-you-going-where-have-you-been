function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.8282, lng: -98.5795},
    zoom: 5,
    mapTypeId: 'terrain'
  });

  var lineSymbol = {
    path: google.maps.SymbolPath.CIRCLE,
    scale: 5,
    strokeColor: '#b20000'
  };

  var line = new google.maps.Polyline({
    path: points,
    icons: [{
      icon: lineSymbol,
      offset: '100%'
    }],
    strokeColor: '#2F4F4F',
    map: map
  });

  animateCircle(line);
}

function animateCircle(line) {
    var count = 0;
    window.setInterval(function() {
      count = (count + 1) % 200;

      var icons = line.get('icons');
      icons[0].offset = (count / 2) + '%';
      line.set('icons', icons);
  }, 200);
}
