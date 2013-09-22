<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			$("#markerX").val(position.pb);
			$("#markerY").val(position.ob);
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
	<div id = "uploadWrapper">
		<div id="northDiv">
			<div id="westDiv">
				어디서 찍었나요?<br/><br/>
				<div id="map-canvas"></div>
			</div>
			
			<div id="eastDiv">
				<br/><br/>
				<form:form method="post" action="/Cheese/upload.do" id="uploadForm"
						modelAttribute="MultiPartFileBean" enctype="multipart/form-data">
					<input type="text" name="markerX" id="markerX" />
					<input type="text" name="markerY" id="markerY" />
					
					제목 :
					<input type="text" name="title" id="title" class="span5"/> <br/>
					
					내용 : 
					<textarea name="content" id="content" class="span5" rows="5" ></textarea> <br/>
					
					<input type="file" name="files" id="files" accept="image/*" multiple />
				</form:form>				
				<a class="button" href="#">
					<img src="/Cheese/img/uploadBtn1.jpg" alt="upload"/>
				</a>
			</div>
		</div>
		
		<div id= "southDiv">
			<output id="list"></output>
		</div>
		
		<script>
			function handleFileSelect(evt) {
				var files = evt.target.files; // FileList object	
			    for (var i = 0, file; file = files[i]; i++) {
			
					if (!file.type.match('image.*')) {
						alert("Select image file");
						continue;
					}
					else {
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
					}
				}
			}
		
			document.getElementById('files').addEventListener('change', handleFileSelect, false);
		</script>

	</div>
</body>
</html>
