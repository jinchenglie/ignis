<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if (session.getAttribute("m_id") != null)
		response.sendRedirect("./ad_Manage.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel = "stylesheet" type = "text/css" href="../css/ad_Login.css">
</head>
<body>
<div class="login">
    <h1>Admin Level</h1>
    <form method="post" action="../loginProcess?page=admin">
    	<input type="text" name="m_id" placeholder="Username" required="required" />
        <input type="password" name="m_pass" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">로그인</button>
    </form>
</div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>