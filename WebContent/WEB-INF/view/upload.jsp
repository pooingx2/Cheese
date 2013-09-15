<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Cheese/css/upload.css" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
    
		var marker;
	
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
			if(marker != null) {
				marker.setMap(null);
			}
			marker = new google.maps.Marker({
			  position: position,
			  map: map
			});
			$("#markerX").val(position.qb);
			$("#markerY").val(position.pb);
			map.panTo(position);
		}
		
		$(function() {
			$("#markerX").hide();
			$("#markerY").hide();
			$("img[alt=upload]").click(function(e){

				var fileList = $("#files").val();
				
				if(marker == null )	
					alert("Select nation");
				
				else if(fileList.length == 0)
					alert("Select upload files");
				else {
					var form = document.getElementById('uploadForm'); 
					form.action = '/Cheese/upload.do';
					form.submit(); 
				}
			});
		});
		//google.maps.event.addDomListener(window, 'load', initialize);
		
	</script>
</head>
<body>
<body>
	<div id = "galleryWrapper">
		<h1>Spring Multiple File Upload example</h1>
		
		<form:form method="post" action="/Cheese/upload.do" id="uploadForm"
				modelAttribute="MultiPartFileBean" enctype="multipart/form-data">
		
			<p>Select files to upload. Press Add button to add more file inputs.</p>

			<br/>
			<input id="markerX" type="text" name="markerX" />
			<input id="markerY" type="text" name="markerY" />
			<input id="files" type="file" name="files" multiple />
			<output id="list"></output>
		</form:form>


		<a class="button" href="#">
			<img src="/Cheese/img/uploadBtn1.jpg" alt="upload"/>
		</a>


		<div id="map-canvas" style="width:300px;height:300px;"></div>
		
		<script>
			function handleFileSelect(evt) {
			    var files = evt.target.files; // FileList object	
			    // Loop through the FileList and render image files as thumbnails.
			    for (var i = 0, file; file = files[i]; i++) {
			
			      // Only process image files.
					if (!file.type.match('image.*')) {
						continue;
					}
			
					var reader = new FileReader();
					// Closure to capture the file information.
					reader.onload = (function(theFile) {
						return function(e) {
				          // Render thumbnail.
							var span = document.createElement('span');
							span.innerHTML = ['<img class="miniphoto" src="', e.target.result,
				                            '" title="', escape(theFile.name), '"/>'].join('');
							document.getElementById('list').insertBefore(span, null);
						};
					})(file);
		
					// Read in the image file as a data URL.
					reader.readAsDataURL(file);

					//console.log(files);
				}
			}
		
			document.getElementById('files').addEventListener('change', handleFileSelect, false);
		</script>

	</div>
</body>
</html>
