<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map_to_the_ignis</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<%
	pageContext.include("../header/header.jsp"); 
%>
<div class="container">
<%
	pageContext.include("leftList.jsp");
%>
	<div class="col-xs-12 col-sm-9 col-md-10">
		<div></div>
		<div id="map" style="width:750px;height:400px;margin-left:80px;"></div>
		<h2 class="text-center">교통수단 안내</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">지하철</a></li>
			<li><a href="#menu1" data-toggle="tab">버스</a></li>
			<li><a href="#menu2" data-toggle="tab">자가용</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<p>토글링 가능한 동적 Tabs</p>
			</div>
			<div class="tab-pane fade" id="menu1">
				<p>탭을 토글링하려면 각 링크에 data-toggle="tab"속성을 추가한다.</p>
			</div>
			<div class="tab-pane fade" id="menu2">
				<p>.tab-content 클래스를 갖는 DIV요소 내부에 각 탭에 대한 고유 ID로 .tab-pane 클래스를 추가한다.</p>
			</div>
		</div>
	</div>
</div>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=60028587da6bdcb31d41cbd67222999d"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/map_to_the_ignis.js?v=6"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>