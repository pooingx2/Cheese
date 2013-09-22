<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cheese</title>
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>-->
	
	<script type="text/javascript" src="/Cheese/js/jquery-2.0.2.js"></script> 
	<script type="text/javascript" src="/Cheese/js/bootstrap.js"></script> 
	<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/Cheese/css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="/Cheese/css/decorator.css" media="all" />
	<link rel="shortcut icon" href="/Cheese/img/logo.jpg" />

	<script type="text/javascript">
		$(function() {	

			if(location.pathname == "/Cheese/main.do")
				$(".navbar-inner>ul>li:eq(0)").addClass("active");
			
			else if(location.pathname == "/Cheese/upload.do")
				$(".navbar-inner>ul>li:eq(1)").addClass("active");
			

			$(".navbar-inner>.linkList>li").mouseover(function(e){
				$(this).addClass("selected");
			});
			
			$(".navbar-inner>.linkList>li").mouseout(function() { 
				$(this).removeClass("selected");
			});
	

			FB.init({
				appId : '406259369474422',	// App ID
				channelUrl : 'http://211.189.127.145:8080/Cheese',	// Channel File
				//channelUrl : 'http://192.168.0.5:8080/Cheese',	// Channel File
				status : true,	// check login status
				cookie : true,	// enable cookies to allow the server to access the session
				xfbml : true	// parse XFBML
			});
			
			$("img[alt=login]").click(function(e){

				FB.getLoginStatus(function(response) {
					// 이미 로그인 한 상태
					if (response.status === 'connected') {
						alert("Already login");
					}

					FB.login(function(response) {
						if (response.authResponse) {
							var uid;
							var name;
							var accessToken;
							var email;
							
							uid = response.authResponse.userID;
							accessToken = response.authResponse.accessToken;
							//100003020043827
							FB.api('/me', function(response) {
								name = response.name;
								email = response.email;
								// id와 이름을 전송
								$.ajax({
									type:"POST", //"POST"
									url:"login.do",
									data:"uid="+uid+"&accessToken="+accessToken+"&name="+name+"&email="+email,
									success: function(data){
										alert(name+"님 환영합니다.");
										location.replace("main.do");
										//location.reload();
									},
									error:function(xhr, status, error) {
										alert("Error");
									}
								});
							});
						}
					},{'scope':'email'});
				});
			});

			$("img[alt=logout]").click(function(e){
				FB.logout(function(response) {
					$.ajax({
						type:"POST", //"POST"
						url:"logout.do",
						data:"",
						success: function(data){
							//location.reload();
							location.replace("main.do");
						},
						error:function(xhr, status, error) {
							alert("Error");
						}
					});
				});
			});
		});
	</script>
	<decorator:head />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="navbar">
				<div class="navbar-inner">
					<a class="brand" href="/Cheese/main.do">
						<img src="/Cheese/img/logo.jpg" alt="logo"/>
						Cheese
					</a>
					<ul class="nav linkList">
						<li><a href="/Cheese/main.do"><i class="icon-home"></i> Home</a></li>
						<c:choose>
							<c:when test="${!(empty user)}">
								<li><a href="/Cheese/upload.do"><i class="icon-upload"></i> Upload</a></li>
							</c:when>
						</c:choose>
					</ul>
					<ul class="nav pull-right header-right">
						<li>
							<c:choose>
								<c:when test="${empty user}">
									<a class="button">
										<img src="/Cheese/img/facebookLogin.png" alt="login"/>
									</a>
								</c:when>
								<c:otherwise>
									<a class="button">
										<img src="/Cheese/img/logoutBtn2.jpg" alt="logout"/>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<hr />

		<div id="contents">
			<decorator:body />
		</div>
	
		<hr />
		
		<div id="footer">
			<div> &copy; Samsung Sofeware Membership & Samsung Design Membership</div>
		</div>
	</div>

	<div id=fb-root></div>
	<script type="text/javascript">
		
	</script>
</body>
</html>

