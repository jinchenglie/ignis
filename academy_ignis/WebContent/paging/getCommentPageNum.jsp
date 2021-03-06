<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요부분은 게시판 전체 내용 가져오는걸로 대체
	//MemberDAO memDao = MemberDAO.getInstance();
	//List<User> userList = memDao.getUserAll(MemberLoginAction.MEMBERLEVEL);
	
	//게시판으로 넘어올때 pageNo(페이지번호)를 get방식으로 넣어줘서 이동해야함
	String tempNo = request.getParameter("commPageNo");

	int commPageNo = 1;
	
	try {
		commPageNo = Integer.parseInt(tempNo);
	} catch (Exception e) {
	}

	final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
	int begin = (commPageNo - 1) * ROW_PER_PAGE + 1;
	int end = commPageNo * ROW_PER_PAGE;
	
	//요부분도 적당한 DAO로 수정해서 쓸것

	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 10; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) commPageNo / PAGE_PER_PAGE);
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