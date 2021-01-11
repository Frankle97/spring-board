<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>J CAR</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="http://tieotdsf1324.cafe24.com/port/images/로고T.png" rel="shortcut icon" type="image/x-icon">
  <link href="http://tieotdsf1324.cafe24.com/port/images/로고T.png" rel="icon" type="image/x-icon"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style>
 form{display:inline;}
a {    color: inherit;

}
a:hover, a:focus, a:active {
	color:#999999;
    text-decoration: none;
}
th{
text-align:center;
color:#bbb;
font-size:16px;
}

  body {
font-family: 'Roboto', 'notokr','NanumGothic','나눔고딕','맑은 고딕','Myriad Pro',Arial,'돋움','굴림','Gulim';
    font-weight: normal;
    letter-spacing: -0.5px;
    font-size: 14px;
    color: #555;
    line-height: 1.4em;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #f4511e;
    color: #fff;
    padding: 100px 25px;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #f4511e;
    font-size: 50px;
  }
  .logo {
    color: #f4511e;
    font-size: 200px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #f4511e;
  }
  .carousel-indicators li {
    border-color: #f4511e;
  }
  .carousel-indicators li.active {
    background-color: #f4511e;
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid black; 
  }
  .navbar {
    margin-bottom: 0;
    background-color: white;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;

  }
  .navbar li a, .navbar .navbar-brand {
	 display: block;
    font-size: 18px;
    color: #111;
    font-weight: bold;
    height: 30px;
    line-height: 30px;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f4511e !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #f4511e;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  
 td {
    text-align: center;
    font-size: 16px;
 }
  .btn {
    padding: 10px 20px;
    background-color: #dc232d;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;	
}
.drop .btn {
	background-color:#BBBBBB;
}
.nav>li>a>img {
    max-width: none;
    margin-left:20%;
}
.detail_bg {
    padding: 10px 0;
    border-top: 10px solid #efefef;
}
 </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<div class="header_bg" style="padding-bottom:30px;
border-bottom:1px solid #ddd;">
<nav class="navbar navbar-default navbar-top" style="margin-top:15px;">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
      <!-- href="#myPage" -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" style="width:103%;">
      <ul class="nav navbar-nav navbar-left" style="margin-left:3%">
   	
        <li><a href="http://tieotdsf1324.cafe24.com/port/carList.do" style="color:black">내차사기</a></li>
        <%
        String id = "";
        String cookie = request.getHeader("Cookie");
        if (cookie != null){
        	Cookie[] cookies = request.getCookies();
        	for (int i=0; i<cookies.length; i++){
        		if (cookies[i].getName().equals("id")){
        			id = cookies[i].getValue();
        			break; 
        		}
        	}
          }
        out.println("<li><a href='http://tieotdsf1324.cafe24.com/port/requestSellCar.do?id="+id+"' style='color:black'>내차팔기</a></li>");
        %>
        <li><a href="http://tieotdsf1324.cafe24.com/port/AdminLogin" style="color:#de1515" id="adLogin">관리자로그인</a></li>
    	<li><a href="http://tieotdsf1324.cafe24.com/port/car.do" style="margin-top:-15px; margin-left:15%;"><img src="http://tieotdsf1324.cafe24.com/port/images/logo.png" alt="메인페이지로 이동"></a>
      </ul>
       <ul class="nav navbar-nav navbar-right">
       <li><a href="http://tieotdsf1324.cafe24.com/port/showNotice.do" style="color:black">공지사항</a></li>
       <li><a href="http://tieotdsf1324.cafe24.com/port/showReview.do" style="color:black">고객후기</a></li>
      <%
      session.setAttribute("kakao", false);
     
      if (cookie != null){
    	Cookie[] cookies = request.getCookies();
    	for (int i=0; i<cookies.length; i++){
    		if (cookies[i].getName().equals("id")){
    			out.println("<li><a href='http://tieotdsf1324.cafe24.com/port/myPageView.do?id="+cookies[i].getValue()+"' style='color:black'>마이페이지</a></li>");
    			out.println("<li><a href='http://tieotdsf1324.cafe24.com/port/logout.do' style='color:black'>로그아웃</a></li>");
    			id=cookies[i].getValue();
    			break; 
    		} else if (i==cookies.length-1){
    			out.println("<li><a href='http://tieotdsf1324.cafe24.com/port/loginView.do' style='color:black'>로그인</a></li>");
    			out.println("<li><a href='http://tieotdsf1324.cafe24.com/port/joinSelect.do' style='color:black'>회원가입</a></li>");
    		}
    	}
      }
      
      %>
   
        
      </ul>
    </div>
  </div>

     
</nav>

</div>
