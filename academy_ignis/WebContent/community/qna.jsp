<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
<%
int pagenum=1;//현재 페이지
int pagelimit=10;//한 페이지 리스트수
int pageCount=10;//마지막 페이지
int startpage=1;//페이지 범위
int endpage=10;//페이지 범위
pagelimit=(Integer)request.getAttribute("pagelimit");
pageCount=(Integer)request.getAttribute("pageCount");
startpage=(Integer)request.getAttribute("startpage");
endpage=(Integer)request.getAttribute("endpage");
if(request.getParameter("pagenum")!=null){
	pagenum=Integer.parseInt(request.getParameter("pagenum"));
}else{pagenum=1;}
if(endpage>pageCount){endpage=pageCount;}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%pageContext.include("leftList.jsp"); %>
 <div class="col-xs-12 col-sm-9 col-md-10 ">
<h4>궁굼한 점</h4><hr>
 <table class="table">
    <thead>
      <tr class="info">
        <th>말머리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
       <th>조회수</th>
      </tr>
    </thead>
    <tbody>
     <%List<ig_qna> list=null;
     System.out.println("22222222222");
    if(request.getAttribute("qnalist")!=null){
    	list = (List)request.getAttribute("qnalist");
    	System.out.println(list.get(0).getQb_mal());
    for(int i=0;i<list.size();i++){
    	
    	%>
      <tr>
        <td><%=list.get(i).getQb_mal() %></td>
        <td><a href="qnaDetail?nb_num=<%=list.get(i).getQb_num()%>&pagenum=<%=pagenum%>"><%=list.get(i).getQb_title() %></a></td>
        <td><%=list.get(i).getM_id() %></td>
        <td><%=list.get(i).getDate()%></td>
        <td><%=list.get(i).getQb_readcount()%></td>
      </tr>
      <%}
    } %>
    </tbody>
  </table>
  
  <ul class="pager">
  <li><a href="qna?pagenum=1">첫 페이지</a></li>
  <li><a href="qna?pagenum=<%=pagenum-1%>">◁</a></li>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
  <li><a href="qna?pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%} %>
  <li><a href="qna?pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="qna?pagenum=<%=pageCount%>">마지막 페이지</a></li>
</ul>
  
 </div>
 
 </div>
</body>
</html>