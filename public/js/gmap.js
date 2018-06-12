$(function(){
	'use strick';
	var map, marker, infowindow, infowindow2;
	var mapDiv = document.getElementById('map');
	var myLatlng = new google.maps.LatLng(10.7626171,106.6790911)
	function initMap() {
        map = new google.maps.Map(mapDiv, {
          center: myLatlng,
          zoom: 16,
          zoomControl: true ,
          streetViewControl: true,
          scrollwheel: true,
        });

     //    marker = new google.maps.Marker({
     //      position: myLatlng,
     //      map: map,
     //      title: 'Hello World!',
     //      icon:'/static/images/position.png',
     //      draggable: true
    	// });

    	// var contentString = '<div id = "container"> '+'<h1>test infowindow</h1>' + '</div>';
    	// infowindow = new google.maps.InfoWindow({
    	// 	content: contentString, 
    	// 	maxwidth:200,
    	// })

    	// //Click vao marker
    	// marker.addListener('click', function(){
    	// 	infowindow.open(map,marker);
    	// })

    	// map.addListener('click',function(){
    	// 	infowindow.close();
    	// })

     //    google.maps.event.addDomListener(marker, 'dragstart', function(event){
     //    	// console.log('bat dau di chuyen marker',event);
     //    });

     //    google.maps.event.addDomListener(marker, 'dragend', function(event){
     //    	console.log('da dat marker o vi tri moi',event.latLng.lat(), event.latLng.lng());
     //    	getNewMarker();
     //    	map.setZoom(15);
     //    });

    	var customMapType = new google.maps.StyledMapType([
    		{ stylers: [{hue:'#D2E4C8'}]},
    		{
    			featureType: 'water',
    			stylers:[{color: '#599459'}]
    		}
    		])
  		
  		var customMapTypeId ='custom_style';
  		map.mapTypes.set(customMapTypeId, customMapType);
  		map.setMapTypeId(customMapTypeId);
  		// Geolocation(); //VI tri hien tai
    }; //end initMap

    function ZoomControl(){
    	var zoomInButton = document.getElementById('zoom-in');
    	var zoomOutButton = document.getElementById('zoom-out');
    	google.maps.event.addDomListener(zoomInButton,'click', function(){
    		map.setZoom(map.getZoom()+1);
    	});
    	google.maps.event.addDomListener(zoomOutButton,'click', function(){
    		map.setZoom(map.getZoom()-1);
    	});
    }

    //get current location when click
    function GeolocationControl(){
    	var geoButton = document.getElementById('current-location');
    	google.maps.event.addDomListener(geoButton, 'click', Geolocation);
    }

    //getcurrent location
    function Geolocation(){
    	if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            // infoWindow.setPosition(pos);
            // infoWindow.setContent('Location found.');
            // infoWindow.open(map);
            map.setCenter(pos);
            marker.setPosition(pos);
          });
        }else{
        	alert('Vui lòng cho phép sử dụng location');
        }
    };
   
   	//markerList
    //Chi nhanh
    var id1="";id2="";id3="";ten1="";ten2="";ten3="";tt1="";tt2="";tt3="";ha1="";ha2="";ha3="";
    id1 = document.getElementById("gmap-id-0").value;
    id2 = document.getElementById("gmap-id-1").value;
    id3 = document.getElementById("gmap-id-2").value;
    ten1 = document.getElementById("gmap-ten-0").value;
    ten2 = document.getElementById('gmap-ten-1').value;
    ten3 = document.getElementById('gmap-ten-2').value;
    tt1 = document.getElementById("gmap-thongtin-0").value;
    tt2 = document.getElementById('gmap-thongtin-1').value;
    tt3 = document.getElementById('gmap-thongtin-2').value;
    ha1 = document.getElementById('gmap-hinhanh-0').value;
    ha2 = document.getElementById('gmap-hinhanh-1').value;
    ha3 = document.getElementById('gmap-hinhanh-2').value;
   	var markers = [
   		[10.7626101, 106.6795884, ten1,ha1,tt1],
   		[10.7628545, 106.6804241, ten2,ha2,tt2],
   		[10.7637068, 106.6809446, ten3,ha3,tt3]
   	];
    console.log(ha3);
   	var infowindow1 = new google.maps.InfoWindow();
    var markArr =[];
   	function getNewMarker(){
   		for(var i =0; i < markers.length; i++){
   			
   			// infoWindow2 = new google.maps.InfoWindow({
   			// 	content: contentString,
   			// 	maxwidth:150,
   			// });
   			var newMarker = new google.maps.Marker({
   				position: new google.maps.LatLng(markers[i][0], markers[i][1]),
   				map:map,
   			});
        var src = `${markers[i][3]}`;
        var contentString = `<div id = "container"> `+`<h5>${markers[i][2]}<h5><p>${markers[i][4]}<p></div>`
                  + `<img src=${src} width="150px" height="125px">`;
        infowindow1.setContent(contentString);
                
        markArr.push(newMarker);

   			
   			google.maps.event.addListener(newMarker, 'click', (function(newMarker, i) {
        		return function() {
        		    newMarker.setIcon('/static/images/position.png');
          			infowindow1.open(map, newMarker);
                map.addListener('click',function(){
                    newMarker.setIcon("");
                    infowindow1.close();
                })
       			 }
      		})(newMarker, i));
   			
   		}
   	};

    var nut1 = document.getElementById("nut1");
    var nut2 = document.getElementById("nut2");
    var nut3 = document.getElementById("nut3");
    nut1.addEventListener('click', function(){
          markArr[0].setIcon('/static/images/position.png');
          infowindow1.open(map, markArr[0]);
          map.addListener('click',function(){
                    newMarker.setIcon("");
                    infowindow1.close();
          })
    });
     nut2.addEventListener('click', function(){
          markArr[1].setIcon('/static/images/position.png');
          infowindow1.open(map, markArr[1]);
          map.addListener('click',function(){
                    newMarker.setIcon("");
                    infowindow1.close();
          })
    });
     nut3.addEventListener('click', function(){
          markArr[2].setIcon('/static/images/position.png');
          infowindow1.open(map, markArr[2]);
          map.addListener('click',function(){
                    newMarker.setIcon("");
                    infowindow1.close();
          })
    });
   




   	function calculateAndDisplayRoute(){
   		directionsDisplay.setMap(map);
   		directionsService.route({
   			origin: document.getElementById('start').value,
   			destination: document.getElementById('end').value,
   			travelMode: google.maps.TravelMode.DRIVING
   		}, function(response, status){
   			if(status === google.maps.DirectionsStatus.OK){
   				directionsDisplay.setDirections(respone);
   			}else{
   				window.alert('Directions request failed due to '+ status);
   			}
   		});
   	}



    initMap();
    // ZoomControl();
    // GeolocationControl();
    getNewMarker();

});