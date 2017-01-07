<%@page import="ignis.action.MemberLoginAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
<% 
	String id = null;
	if (session.getAttribute("m_id") != null) {
		id = (String) session.getAttribute("m_id");
	}
	else
		response.sendRedirect("./ad_Login.jsp");

	ReservDAO reservDao = ReservDAO.getInstance();
	int totalRows = reservDao.getListcount(); // 전체 게시물 갯수
	
%>
<%@include file="../paging/getPageNum.jsp" %>
<% List<ig_reserv> reservList = reservDao.getReservAll(id, begin, end);  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>
<%
pageContext.include("../ignisCompany_info/header_noTop.jsp"); 
%>

<%
	pageContext.include("../header/header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("../ignisCompany_info/leftList2.jsp");
%>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
				</div>
				<div class="panel-body">
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>예약번호</th><th>아이디</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>상세 보기</th></tr>
					</thead>
					<tbody>
					<% 
						if (reservList != null) {
							for (int i = 0; i < reservList.size(); i++) {
								ig_reserv reserv = reservList.get(i);
							
					%>
					<tr>
						<td><%=reserv.getR_num() %></td>
						<td><%=reserv.getM_id() %></td>
						<td><%=reserv.getR_guide() %></td>
						<td><%=reserv.getR_day() %></td>
						<td><%=reserv.getR_time() %></td>
						<td><a href="/academy_ignis/adMyPage?userId=<%=reserv.getM_id()%>">보기</a>
					</tr>
					<%
					
							}
						} else {
					%>
					<tr><td colspan="7">예약 정보가 없습니다.</td></tr>
					<%	} %>
					</tbody>
				</table>
				</div>
				<div class="panel-end">
					<form class="form-inline" >
					  <label for="sel1">검색 범위</label>
					  <select class="form-control" id="sel1">
					    <option>전체</option>
					    <option>제목</option>
					    <option>내용</option>
					  </select>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" class=form-control id="search">
					  </div>
					  <button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
			</div>
  		</div>

<%@include file="../footer/footer.jsp" %>

  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>