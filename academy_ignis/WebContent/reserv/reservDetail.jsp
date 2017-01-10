
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
    
<%
	// @page include대신에 아래에 풀었음.
	//요부분은 게시판 전체 내용 가져오는걸로 대체
	//MemberDAO memDao = MemberDAO.getInstance();
	//List<User> userList = memDao.getUserAll(MemberLoginAction.MEMBERLEVEL);
	
	//게시판으로 넘어올때 pageNo(페이지번호)를 get방식으로 넣어줘서 이동해야함
	String tempNo = request.getParameter("pageNo");

	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(tempNo);
	} catch (Exception e) {
	}

	final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
	int begin = (pageNo - 1) * ROW_PER_PAGE + 1;
	int end = pageNo * ROW_PER_PAGE;
	
	//요부분도 적당한 DAO로 수정해서 쓸것

	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 10; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
	//요청된 pageNo의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (totalRanges == 0) {
		endPage = 1;
	} else if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우

	int prevPage = 0;
	if (currentRange != 1)
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
	int nextPage = 0;
	if (currentRange != totalRanges) 
		nextPage = currentRange * PAGE_PER_PAGE + 1;
	if (totalRanges == 0)
		nextPage = 0;
%>
<% List<ig_reserv> reservList = reservDao.getReservAll(id, begin, end);  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
	$(function() {
		$('#reservSubmit').click(function () {
			
			$.ajax({
				type : "post",
	 			url : "./reserv/welcome.jsp",
			  	data : {reservSearch : $('#reservSearch').val().trim()},
				success : function(data) { $('#reservContent').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>



<div id="reservContent">
<% pageContext.include("../ignisCompany_info/header_noTop.jsp"); %>
<% pageContext.include("../header/header.jsp"); %>
<% pageContext.include("../ignisCompany_info/leftList2.jsp"); %>

  	<div class="container-fluid main-container">
  		<div class="col-md-10 content" >
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
				</div>
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>예약번호</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>예약 신청일</th><th>상세 보기</th></tr>
					</thead>
					<tbody>
					
					<%
						if (reservList != null) {
							for (int i = 0; i < reservList.size(); i++) {
								ig_reserv reserv = reservList.get(i);
							
					%>
					<tr >
						<td><%=reserv.getR_num() %></td>
						<td><%=reserv.getR_guide() %></td>
						<td><%=reserv.getR_day() %></td>
						<td><%=reserv.getR_time() %></td>
						<td><%=reserv.getR_regdate() %></td>
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
				
				
				
				
				<div class="panel-end">
					<form class="form-inline" action="reservDetail">
					  <label for="sel1">검색 범위</label>
					  <select id="reservType" id="sel1" name="reservType">
					    <option>전체</option>
					    <option value="t_guide">진료 항목</option>
					    <option>내용</option>
					  </select>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" id="reservSearch" name =" reservSearch">
					  </div>
					  <button type="submit" class="btn btn-default"  id="reservSubmit">검색</button>
					</form>
					<ul class="pager">
					  <li><a href="/academy_ignis/reservDetail?pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/reservDetail?pageNo=<%=prevPage %>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/reservDetail?pageNo=<%=i %>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="/academy_ignis/reservDetail?pageNo=<%=nextPage%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/reservDetail?pageNo=<%=totalPages %>">마지막 페이지</a></li>
					</ul>
				</div>
			</div>
  		</div>
</div>
<%@include file="../footer/footer.jsp" %>

  	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
 
 
 
</div>
</body>
</html>
