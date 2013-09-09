<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/Cheese/css/main.css" />
</head>
<body>
<div>

</div>
	<div id="mainWrapper">
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