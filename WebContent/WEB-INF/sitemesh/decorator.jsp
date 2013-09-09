<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cheese</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="/Cheese/js/bootstrap.min.js"></script>
	<script src="http://connect.facebook.net/en_US/all.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/Cheese/css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="/Cheese/css/decorator.css" media="all" />
	<link rel="shortcut icon" href="/Cheese/img/Cheese-logo.png" />
	<script type="text/javascript">
		$(function() {
			$("img[alt=logout]").hide();
		});
	</script>
	
	<decorator:head />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="navbar">
				<div class="navbar-inner">
					<a class="brand" href="/Cheese/main.do">Cheese</a>
					<ul class="nav">
						<li class="active"><a href="/Cheese/main.do">Home</a></li>
						<li><a href="/Cheese/gallery.do">My Gallery</a></li>
						<li><a href="#">B</a></li>
					</ul>
					<ul class="nav pull-right header-right">
						<li>

							<!-- <a href="/Cheese/login.do"> -->
							<a class="button" href="#">
								<img src="/Cheese/img/facebook-logo.png" alt="login"/>
							</a>
							
							<a class="button" href="#">
								<img src="/Cheese/img/logoutBtn2.jpg" alt="logout"/>
							</a>
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
		window.fbAsyncInit = function() {
			FB.init({
				appId : '406259369474422',	// App ID
				channelUrl : 'http://211.189.127.145:8080/Cheese',	// Channel File
				//channelUrl : 'http://192.168.38.247:8080/Cheese',	// Channel File
				status : true,	// check login status
				cookie : true,	// enable cookies to allow the server to access the session
				xfbml : true	// parse XFBML
			});

			// 로그인 
			$(function(){
				$("img[alt=login]").click(function(e){
					
					FB.getLoginStatus(function(response) {
						// 이미 로그인 한 상태
						if (response.status === 'connected') {
							alert("connected");
						}
						// 로그인 안한 상태
						else {
							alert("login");
							FB.login(function(response) {
								if (response.authResponse) {
									var id;
									var name;
									
									name = response.name;
									id = response.authResponse.userID;
									//100003020043827
									
									FB.api('/me', function(response) {
										msg.innerHTML = response.name + ' HI!!';
										name = response.name;
										// id와 이름을 전송
										$.ajax({
											type:"POST", //"POST"
											url:"login.do",
											data:"id="+id+"&name="+name,
											success: function(data){
												alert(name+"님 환영합니다.");
												$("img[alt=login]").hide();
												$("img[alt=logout]").show();
											},
											error:function(jqXHR,textStatus,errorThrown){
												alert("에러");
											}
										});
									});
								}
							});
						}
					});
				});
			});
			
			$(function(){
				$("img[alt=logout]").click(function(e){
					FB.logout(function(response) {
						msg.innerHTML = "logout";
						alert("Bye");
						$("img[alt=logout]").hide();
						$("img[alt=login]").show();
					});
				});
			});
		};
	</script>
</body>
</html>

