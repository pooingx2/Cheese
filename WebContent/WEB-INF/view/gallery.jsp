<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
		
			$('#addFile').click(function() {
				var fileIndex = $('#fileTable tr').children().length;
				$('#fileTable').append('<tr><td>'
						+'<input type="file" name="files['+ fileIndex +']" />'+'</td></tr>');
			});
		});
	</script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
		window.onload = function initialize() {
			var mapOptions = {
			    zoom: 3,
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
<body>
	<div id = "galleryWrapper">
		<h1>Spring Multiple File Upload example</h1>
		
		<form:form method="post" action="/Cheese/upload.do"
				modelAttribute="uploadForm" enctype="multipart/form-data">
		
			<p>Select files to upload. Press Add button to add more file inputs.</p>
		
			<input id="addFile" type="button" value="Add File" />
			<table id="fileTable">
				<tr>
					<td><input name="files[0]" type="file" /></td>
				</tr>
				<tr>
					<td><input name="files[1]" type="file" /></td>
				</tr>
			</table>
			<br/>
			<input type="submit" value="Upload" />
		</form:form>
		
		<div id="map-canvas" style="width:300px;height:300px;"></div>
	</div>
</body>
</html>
