<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/Cheese/css/main.css" />
    <!-- <link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" /> -->
    
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
	    var markers = [];
	    var map;
	   	var list = new Array();		
	   	var selectedGallery;
	    var infowindow;
	    
	    <c:forEach items="${galleryList}" var="item">
	    	var gallery = {
	    		gid : "${item.gid}",
	    		title : "${item.title}",
	    		content : "${item.content}",
	    		mapx : "${item.mapx}",
	    		mapy : "${item.mapy}",
	    		master : "${item.master}"
	    	};
			list.push(gallery);
	    	var myLatLng = new google.maps.LatLng(gallery.mapy, gallery.mapx);
	    	addMarker(myLatLng, gallery);
		</c:forEach> 
	    
		function initialize() {
			var mapOptions = {
			    zoom: 2,
			    //center: new google.maps.LatLng(-25.363882,131.044922),
			    center: new google.maps.LatLng(37.5635,126.9753),
			    mapTypeId: google.maps.MapTypeId.ROADMAP
		 	};
			map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);

			showMarkers();
		};
		
		function addMarker(location, gallery) {
			var marker = new google.maps.Marker({
				position: location,
				title: 'Click'
			});
			
			markers.push(marker);

			google.maps.event.addListener(marker, 'click', function() {
				selectedGallery = gallery.gid;
				//map.setZoom(5);
				map.setCenter(marker.getPosition());

				showMinGallery(marker);
			});
		}
		
		function showMarkers() {
			if (markers) {
				for (i in markers) {
					markers[i].setMap(map);
				}
			}
		}
		
		function showMinGallery(marker) {
			$.ajax({
				type:"POST",
				url:"showMinGallery.do",
				data:"gallery="+selectedGallery,
				success: function(data){
					console.log(data);
					//console.log(data.photoList[0]);
	
					var obj = jQuery.parseJSON(data);
					var contentString = 
					'<div id="miniGallery">'+
						'<div id="myCarousel" class="carousel slide">'+
							'<div class="carousel-inner">'+
								'<div class="active item">'+
									'<img src='+obj.photoList[0].path+' class="photoBox">'+
								'</div>';
					for ( var i = 1; i < obj.photoList.length; i++) {
						contentString += 
								'<div class="item">'+
									'<img src='+obj.photoList[i].path+' class="photoBox">'+
								'</div>';
					}
					
					contentString += 
							'</div>'+
							'<div id="carouselBtn">' +
								'<a class="carousel-control left" href="#myCarousel" data-slide="prev"><i class="icon-chevron-left icon-white"></i></a>'+
								'<a class="carousel-control right" href="#myCarousel" data-slide="next"><i class="icon-chevron-right icon-white"></i></a>'+
								'<a class="carousel-control" id="show" href="/Cheese/gallery.do?gid='+selectedGallery+'"><i class="icon-zoom-in icon-white"></i></a>'+
							'</div>'+	
						'</div>'+
					'</div>';
					
				    if (infowindow) {
				        infowindow.close();
				    }
				    
				    infowindow = new google.maps.InfoWindow({
					      content: contentString
					});
				    
					infowindow.open(map,marker);
				},
				error: function(xhr, status, error) {
					alert("Error");
				}
			});
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
		
	</script>
</head>
<body>
	<div id="mainWrapper">
		<img id="mainImg" src="/Cheese/img/main.jpg" alt="main" >
		<div id="map-canvas"></div>
	</div>
</body>
</html>