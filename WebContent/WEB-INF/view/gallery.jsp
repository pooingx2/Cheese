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
		<div id="northDiv">
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
				<c:forEach items="${photoList}" var="item">
		    		pid : "${item.pid}"<br/>
		    		path : "${item.path}"<br/>
				</c:forEach> 
	
			</div>
		</div>
		
		<div id= "southDiv">
		</div>
	</div>
</body>
</html>
