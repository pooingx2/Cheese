<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/Cheese/css/gallery.css" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
		
	</script>
</head>
<body>
<body>
	<div id = "galleryWrapper">
			
		<div id= "northDiv">
			<div id="miniGallery">
				<div id="myCarousel" class="carousel slide">
					<div class="carousel-inner">
						<div class="active item">
							<c:set var="first" value="${photoList[0].path}"/>
							<img src="${photoList[0].path}" class="photoBox">
						</div>
						<c:forEach var="i" begin="1" end="${photoList.size()-1}" step="1">
							<div class="item">
								<img src="${photoList[i].path}" class="photoBox">
							</div>
						</c:forEach>
					</div>
					<div id="carouselBtn">
						<a class="carousel-control left" href="#myCarousel" data-slide="prev"><h1><i class="icon-chevron-left icon-white"></i></h1></a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next"><h1><i class="icon-chevron-right icon-white"></i></h1></a>
					</div>
				</div>
			</div>
		</div>
		<div id="southDiv">
			<div id="westDiv">
				<div id="map-canvas"></div>
			</div>
			<div id="eastDiv">
				<br/><br/>
				gid : ${gallery.gid} <br/>
				title : ${gallery.title} <br/>
				content : ${gallery.content} <br/>
				mapx : ${gallery.mapx} <br/>
				mapy : ${gallery.mapy} <br/>
				count : ${gallery.count} <br/>
				master : ${gallery.master} <br/><br/>
	    		
	    		photoList<br/>
	    		length : ${photoList.size()}
				<c:forEach items="${photoList}" var="item">
		    		pid : ${item.pid}<br/>
		    		path : ${item.path}<br/>
				</c:forEach> 
			</div>
		</div>
	</div>
</body>
</html>
