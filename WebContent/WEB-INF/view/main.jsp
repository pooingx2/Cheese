<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/Cheese/css/main.css" />
	
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
		window.onload = function initialize() {
			var mapOptions = {
			    zoom: 2,
			    //center: new google.maps.LatLng(-25.363882,131.044922),
			    center: new google.maps.LatLng(37.5635,126.9753),
			    mapTypeId: google.maps.MapTypeId.ROADMAP
		 	};
			var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
			google.maps.event.addListener(map, 'click', function(e) {
			  placeMarker(e.latLng, map);
			});
		}
		function placeMarker(position, map) {
			var marker = new google.maps.Marker({
			  position: position,
			  map: map
			});
			console.log(position.jb);
			console.log(position.kb);
			map.panTo(position);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	
</head>
<body>
<div>

</div>
	<div id="mainWrapper">
	
		<div id="map-canvas" style="width:900px;height:500px;"></div>
		<img id="mainImg" src="/Cheese/img/main.png" alt="main" >
		
		<div id="search">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Recently</a></li>
				<li><a href="#">Hot</a></li>
				<li id="searchBar" class="pull-right">
				  	<form method="POST">
					  <div class="input-prepend input-append">
						<input type="text" name="searchText" class="span5 typeahead2" placeholder="Input Title">
						<input type="submit" class="btn" value="Search">
					  </div>
					</form>
				</li>
			</ul>
		</div>
		
		<div id="gallery">
			<ul>
				<li>aa</li>
				<li>aa</li>
				<li>aa</li>
				<li>
					<div id=title>
						<span class="pull-right">(123 <i class="icon-thumbs-up"></i>)</span>
						<b><a href="#">박주영 하하하가나다라마바사아</a></b>
					</div>
					<div id="myCarousel" class="carousel slide">
						<div class="carousel-inner">
							<div class="active item">
								<img src="/Cheese/img/Cheese4.jpg" style="vertical-align:middle;" class="photo">
							</div>
						    <div class="item photo">
						    	<img src="/Cheese/img/Cheese2.jpg" class="photo">
						    </div>
						    <div class="item photo">
						    	<img src="/Cheese/img/Cheese3.jpg" class="photo">
						    </div>
						</div>
						<div id="carouselBtn">
							<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
							<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<hr/>

		<div class="pagination pagination-centered">
				<ul>
				    <li class="disabled"><a href="#">&laquo;</a></li>
				    <li class="active"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">&raquo;</a></li>
				</ul>
			</div>
	</div>
</body>
</html>