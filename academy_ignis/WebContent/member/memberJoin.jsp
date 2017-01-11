<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/daterangepicker.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">
    <h1 class="well">회원 가입</h1>
	<div class="col-lg-12 well">
	
	<div class="row">
		<form id="joinForm" class="form-horizontal" method="post" action="/academy_ignis/joinProcess?page=home">
			<fieldset>
				
				<!-- Form Name -->
				<legend class="sr-only">회원가입</legend>
				
				<div class="form-group">
				  <label class="col-md-8 control-label" for="textinput">(*는 필수입력란입니다.)</label> 
				  <div class="col-md-3">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">아이디*</label>  
				  <div class="col-md-4">
					  <div class="input-group">
						  <input id="m_id" name="m_id" type="text" readonly="readonly" placeholder="아이디" required="required" class="form-control input-md">
						  <div class="input-group-btn">
						  <a class="btn btn-default" id="idChk"><i class="glyphicon glyphicon-search"></i></a>
						  </div>
					  </div>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">이름*</label>  
				  <div class="col-md-4">
				  <input name="m_name" type="text" placeholder="이름" required="required" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">패스워드*</label>  
				  <div class="col-md-4">
				  <input id="m_pass" name="m_pass" type="password" required="required" placeholder="패스워드" class="form-control input-md">
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">패스워드확인*</label>  
				  <div class="col-md-4">
				  <input id="m_passchk" name="m_passchk" type="password"  required="required" placeholder="패스워드 확인" class="form-control input-md">
				  </div>
				  <div class="col-md-4" id="passmsg">
				  </div>
				</div>
				
				<!-- File Button --> 
				<!--  <div class="form-group">
				  <label class="col-md-4 control-label" for="filebutton">photo</label>
				  <div class="col-md-4">
				    <input id="filebutton" name="filebutton" class="input-file" type="file">
				  </div>
				</div> -->
				
				<!-- 우편번호 API 이용 -->
				<div class="form-group">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
					  <div class="input-group">
						  <input type="text" id="m_postcode" readonly="readonly" placeholder="우편번호" class="form-control input-md">
						  <div class="input-group-btn">
						  <a class="btn btn-default" id="postSearch"><i class="glyphicon glyphicon-search"></i></a>
						  </div>
					  </div>
				  </div>
				</div>
				
				<div class="form-group">
					<div class="col-md-4">
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
				<div class="col-md-6">
					<input type="text" id="m_addr" name="m_addr" placeholder="주소" class="form-control input-md">
				</div>
				</div>
				
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?v=1"></script>
				<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberJoin_post.js?v=10"></script>

				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label"  for="textinput">휴대폰 번호*</label>  
				  <div class="col-md-4">
				  <input name="m_phone" maxlength="12" type="tel" required="required" placeholder="숫자만 입력해주세요" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">Email 주소*</label>  
				  <div class="col-md-4">
				  <input name="m_email" type="email" required="required" placeholder="exam@example.com" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">생년월일</label>  
				  <div class="col-md-4">
				  <input name="m_birth" type="text" placeholder="생년월일" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Select Basic -->
				<!-- <div class="form-group">
				  <label class="col-md-4 control-label" for="selectbasic">gender</label>
				  <div class="col-md-4">
				    <select id="selectbasic" name="selectbasic" class="form-control">
				      <option value="1">Male</option>
				      <option value="2">Female</option>
				    </select>
				  </div>
				</div> -->
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-xs-4 control-label"></label>
				  <div class="col-xs-8">
				  	<br><br>
				    <input id="joinBtn" name="singlebutton" class="btn btn-success" value="회원가입">
				  </div>
				</div>
				
			</fieldset>
		</form> 
	</div>
	</div>
	</div>
<%
	pageContext.include("../footer/footer.jsp");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
<script type="text/javascript"src="/academy_ignis/script/moment.js"></script>
<script type="text/javascript"src="/academy_ignis/script/daterangepicker.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberJoin.js?v=3"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>