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
		$(function() {
			$("img[alt=login]").click(function(e){

					FB.init({
						appId : '406259369474422',	// App ID
						channelUrl : 'http://211.189.127.145:8080/Cheese',	// Channel File
						//channelUrl : 'http://192.168.38.247:8080/Cheese',	// Channel File
						status : true,	// check login status
						cookie : true,	// enable cookies to allow the server to access the session
						xfbml : true	// parse XFBML
					});
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
											$("img[alt=login]").hide();
											$("img[alt=logout]").show();
										},
										error:function(jqXHR,textStatus,errorThrown){
											alert("Error");
										}
									});
								});
							}
						},{'scope':'email'});
					});

				
			});
		});
		$(function(){
			$("img[alt=logout]").click(function(e){
				FB.logout(function(response) {
					alert("Bye");
					$("img[alt=logout]").hide();
					$("img[alt=login]").show();
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
					<a class="brand" href="/Cheese/main.do">Cheese</a>
					<ul class="nav">
						<li class="active"><a href="/Cheese/main.do">Home</a></li>
						<li><a href="/Cheese/upload.do">Upload</a></li>
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

			
		</script>
	<!--
		  <script>
  // Additional JS functions here
  window.fbAsyncInit = function() {
	console.log('test');
    FB.init({
    	appId : '406259369474422',	// App ID
		channelUrl : 'http://211.189.127.145:8080/Cheese',	// Channel File
		//channelUrl : 'http://192.168.38.247:8080/Cheese',	// Channel File
		status : true,	// check login status
		cookie : true,	// enable cookies to allow the server to access the session
		xfbml : true	// parse XFBML
    });
    FB.getLoginStatus(function(response) {
    if (response.status === 'connected') {
        // connected
    	console.log('connected');
        alert("connected");
    } else if (response.status === 'not_authorized') {
        // not_authorized
        alert("login");
      login();
    } else {
        // not_logged_in
           alert("login");
      login();
    }
    });

    // Additional init code here

  };

  function login() {
    FB.login(function(response) {
        if (response.authResponse) {
            // connected
          testAPI();
        } else {
            // cancelled
        }
    });
    }

  function testAPI() {

    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {

        console.log('Good to see you, ' + response.name + '.');
    });
  }

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
</script>
	  -->
</body>
</html>

