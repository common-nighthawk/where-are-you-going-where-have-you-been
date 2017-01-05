function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.8282, lng: -98.5795},
    zoom: 5,
    mapTypeId: 'terrain'
  });

  var lineSymbol = {
    path: google.maps.SymbolPath.CIRCLE,
    scale: 5,
    strokeColor: '#b20000' };

  var line = new google.maps.Polyline({
    path: points,
    icons: [{
      icon: lineSymbol,
      offset: '100%'
    }],
    map: map,
    strokeColor: '#2F4F4F' });

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



































var points = [{lat: 40.6796041, lng: -73.9648636}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.7167352, lng: -73.9901653}, {lat: 40.7167023, lng: -73.9902100}, {lat: 39.0129030, lng: -77.0936553}, {lat: 34.2294658, lng: -77.9433010}, {lat: 34.2294658, lng: -77.9433010}, {lat: 34.2287808, lng: -77.9445123}, {lat: 34.2261260, lng: -77.9423854}, {lat: 34.2294658, lng: -77.9433010}, {lat: 35.1123573, lng: -78.1845528}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.6830251, lng: -73.9793758}, {lat: 40.6979179, lng: -73.9713406}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.7166901, lng: -73.9901193}, {lat: 40.7165226, lng: -73.9900275}, {lat: 40.7165998, lng: -73.9900275}, {lat: 40.7286332, lng: -73.9281035}, {lat: 40.6792126, lng: -73.9664042}, {lat: 40.7165226, lng: -73.9900275}, {lat: 40.7165998, lng: -73.9900275}, {lat: 40.7165998, lng: -73.9900275}, {lat: 40.7166128, lng: -73.9901193}, {lat: 40.7165226, lng: -73.9900275}, {lat: 40.6803264, lng: -73.9618222}, {lat: 40.6795997, lng: -73.9650500}, {lat: 40.7165226, lng: -73.9900275}, {lat: 40.7165226, lng: -73.9900275}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.6738018, lng: -73.9791921}, {lat: 40.6795997, lng: -73.9650500}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.6976861, lng: -73.9678051}, {lat: 40.6800439, lng: -73.9645446}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7167030, lng: -73.9902112}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.7168055, lng: -73.9898439}, {lat: 40.6794569, lng: -73.9716620}, {lat: 40.6894585, lng: -73.9996687}, {lat: 40.6796770, lng: -73.9650500}, {lat: 40.7153491, lng: -73.9898022}, {lat: 40.7166128, lng: -73.9901193}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.6880666, lng: -74.0166350}, {lat: 40.6796770, lng: -73.9650500}, {lat: 40.7169339, lng: -73.9896602}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.7182748, lng: -73.9909457}, {lat: 40.7166128, lng: -73.9901193}, {lat: 40.6796770, lng: -73.9650500}, {lat: 40.6609183, lng: -73.9673639}, {lat: 40.7166258, lng: -73.9902112}, {lat: 40.7190445, lng: -73.9892929}, {lat: 40.7153658, lng: -73.9898008}, {lat: 40.7187824, lng: -73.9896818}, {lat: 40.7165356, lng: -73.9901193}, {lat: 40.6796770, lng: -73.9650500}, {lat: 40.6943232, lng: -73.9669153}, {lat: 40.7166128, lng: -73.9901193}, {lat: 40.7183279, lng: -73.9918640}, {lat: 40.7168696, lng: -73.9897521}, {lat: 40.7192110, lng: -73.9888338}, {lat: 40.7203798, lng: -73.9872728}, {lat: 40.8770562, lng: -73.8189914}, {lat: 40.6795185, lng: -73.9667523}, {lat: 40.7210323, lng: -73.9893754}, {lat: 40.6721859, lng: -73.9626420}, {lat: 40.7165488, lng: -73.9898396}, {lat: 39.8859710, lng: -75.0026439}, {lat: 34.2295933, lng: -77.9480312}, {lat: 34.2295933, lng: -77.9480312}, {lat: 34.2295907, lng: -77.9479244}, {lat: 34.2295933, lng: -77.9480312}, {lat: 34.2281880, lng: -77.9437918}, {lat: 34.2337539, lng: -77.9485666}, {lat: 34.1927231, lng: -77.8742883}, {lat: 34.1927231, lng: -77.8742883}, {lat: 36.4611529, lng: -80.5597436}, {lat: 39.9659495, lng: -83.2994563}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9121192, lng: -87.6788777}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9033010, lng: -87.6720214}, {lat: 41.8870594, lng: -87.6244611}, {lat: 41.9217670, lng: -87.6962835}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9040063, lng: -87.6724066}, {lat: 41.9064225, lng: -87.6692477}, {lat: 41.9032235, lng: -87.6720214}, {lat: 41.9040063, lng: -87.6724066}, {lat: 41.8898034, lng: -87.6372618}, {lat: 41.9039683, lng: -87.6724451}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9065000, lng: -87.6692477}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9039625, lng: -87.6725393}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9280988, lng: -87.7029821}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9068630, lng: -87.6718673}, {lat: 41.9039699, lng: -87.6725222}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9030513, lng: -87.6711739}, {lat: 41.9121965, lng: -87.6280346}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9039303, lng: -87.6724836}, {lat: 41.9040079, lng: -87.6724836}, {lat: 42.6362320, lng: -86.1982811}, {lat: 42.6365521, lng: -86.2117612}, {lat: 42.5910667, lng: -86.2243788}, {lat: 41.9039789, lng: -87.6727014}, {lat: 41.9040079, lng: -87.6724836}, {lat: 41.9288635, lng: -87.7063696}, {lat: 41.5881086, lng: -90.5714733}, {lat: 40.8212049, lng: -98.2494007}, {lat: 39.7595303, lng: -105.0113170}, {lat: 39.5406958, lng: -105.2992035}, {lat: 39.7489607, lng: -104.9776758}, {lat: 39.7411901, lng: -104.9648967}, {lat: 39.7320927, lng: -105.0816353}, {lat: 39.7523158, lng: -104.9934685}, {lat: 39.7373868, lng: -104.9881280}, {lat: 39.7411901, lng: -104.9648967}, {lat: 39.7351538, lng: -104.9751656}, {lat: 39.7182439, lng: -104.9598352}, {lat: 39.7419779, lng: -105.0414038}, {lat: 39.7411995, lng: -104.9651249}, {lat: 39.7411995, lng: -104.9651249}, {lat: 39.8348810, lng: -105.2288713}, {lat: 39.7604607, lng: -104.9731574}, {lat: 39.4799879, lng: -106.0472141}, {lat: 39.7349401, lng: -104.9654115}, {lat: 41.1203603, lng: -101.6658483}, {lat: 41.2536826, lng: -95.9359349}, {lat: 40.7749686, lng: -73.8744337}, {lat: 40.9863025, lng: -73.8103386}, {lat: 40.7183871, lng: -73.9966387}, {lat: 40.7468343, lng: -73.9582541}, {lat: 40.6703627, lng: -73.9718457}, {lat: 40.7745343, lng: -73.8670833}, {lat: 41.2538675, lng: -95.9361413}, {lat: 41.2501847, lng: -95.9355221}, {lat: 41.2491391, lng: -95.9497231}, {lat: 41.2640661, lng: -95.9332106}, {lat: 41.2533201, lng: -95.9361413}, {lat: 41.2537153, lng: -95.9360587}, {lat: 39.0472782, lng: -94.5729613}, {lat: 39.0472782, lng: -94.5729613}, {lat: 39.0472127, lng: -94.5725582}, {lat: 39.0900443, lng: -94.5897379}, {lat: 39.0471409, lng: -94.5723164}, {lat: 38.6225559, lng: -90.3494642}, {lat: 38.6225559, lng: -90.3494642}, {lat: 38.6225559, lng: -90.3494642}, {lat: 38.6225559, lng: -90.3494642}, {lat: 38.6225574, lng: -90.3495213}, {lat: 38.6225035, lng: -90.3495294}, {lat: 38.6225559, lng: -90.3494642}, {lat: 35.1273933, lng: -89.9902361}, {lat: 35.1300203, lng: -89.9905500}, {lat: 35.1229700, lng: -89.9877475}, {lat: 35.1232250, lng: -89.9878820}, {lat: 35.1300149, lng: -89.9909284}, {lat: 35.1337932, lng: -90.0299917}, {lat: 35.1335469, lng: -90.0298828}, {lat: 35.1336997, lng: -90.0303690}, {lat: 34.8189694, lng: -91.5399617}, {lat: 30.4416285, lng: -97.7658641}, {lat: 30.4416285, lng: -97.7658641}, {lat: 30.4416280, lng: -97.7659595}, {lat: 30.4391070, lng: -97.7680271}, {lat: 30.1406641, lng: -97.6309096}, {lat: 30.3545895, lng: -97.7329710}, {lat: 30.4417783, lng: -97.7657800}, {lat: 30.2831958, lng: -97.7697273}, {lat: 30.2834829, lng: -97.7694085}, {lat: 30.2834846, lng: -97.7693877}, {lat: 30.2836235, lng: -97.7693787}, {lat: 30.2643553, lng: -97.7705864}, {lat: 30.2795963, lng: -97.7594540}, {lat: 30.2834001, lng: -97.7693028}, {lat: 30.2832844, lng: -97.7694091}, {lat: 30.2834001, lng: -97.7693028}, {lat: 30.2614487, lng: -97.7210060}, {lat: 30.2833354, lng: -97.7693541}, {lat: 30.2834910, lng: -97.7697168}, {lat: 30.2956707, lng: -97.7843333}, {lat: 30.2835540, lng: -97.7697273}, {lat: 30.2834001, lng: -97.7693028}, {lat: 30.2834791, lng: -97.7697012}, {lat: 30.2833055, lng: -97.7693877}, {lat: 30.2647425, lng: -97.7440893}, {lat: 30.2834466, lng: -97.7697139}, {lat: 30.2835168, lng: -97.7696000}, {lat: 30.2835857, lng: -97.7697776}, {lat: 30.2955149, lng: -97.7417126}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2834001, lng: -97.7693028}, {lat: 30.2834542, lng: -97.7694346}, {lat: 30.2833951, lng: -97.7693877}, {lat: 30.2835540, lng: -97.7697273}, {lat: 30.2834371, lng: -97.7694304}, {lat: 30.2836468, lng: -97.7697192}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2835540, lng: -97.7697273}, {lat: 30.2835591, lng: -97.7696424}, {lat: 30.2763177, lng: -97.7686659}, {lat: 30.2835591, lng: -97.7696424}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2833911, lng: -97.7696833}, {lat: 30.2835660, lng: -97.7697019}, {lat: 30.2833465, lng: -97.7693774}, {lat: 30.2879631, lng: -97.7656093}, {lat: 30.2835591, lng: -97.7696424}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2604380, lng: -97.7282611}, {lat: 30.2836746, lng: -97.7697557}, {lat: 30.2833900, lng: -97.7694726}, {lat: 30.2834275, lng: -97.7694722}, {lat: 30.2644681, lng: -97.7509262}, {lat: 30.2679293, lng: -97.7492671}, {lat: 30.2833900, lng: -97.7694726}, {lat: 30.2834167, lng: -97.7696775}, {lat: 30.2769479, lng: -97.7738880}, {lat: 30.2830268, lng: -97.7695575}, {lat: 30.2834357, lng: -97.7693484}, {lat: 30.2834001, lng: -97.7693028}, {lat: 30.2685951, lng: -97.7585978}, {lat: 30.2659474, lng: -97.7539670}, {lat: 30.2831236, lng: -97.7695650}, {lat: 30.2835540, lng: -97.7697273}, {lat: 30.2833015, lng: -97.7699787}, {lat: 30.2669303, lng: -97.7214726}, {lat: 30.2834458, lng: -97.7695519}, {lat: 30.2833579, lng: -97.7692603}, {lat: 30.2605884, lng: -97.7416278}, {lat: 32.0269220, lng: -100.0988916}, {lat: 35.0962328, lng: -106.6038496}, {lat: 35.2093289, lng: -106.4495520}, {lat: 35.0872234, lng: -106.6000119}, {lat: 35.0873970, lng: -106.6002649}, {lat: 35.1983175, lng: -111.6474875}, {lat: 35.1995103, lng: -111.6522202}, {lat: 35.1939460, lng: -111.6514265}]
