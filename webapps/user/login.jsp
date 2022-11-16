<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<title>로그인 페이지</title>
<jsp:include page="/head.jsp" />
<style>
.field {width:50%; margin:0 auto; height: 100vh;}
.page_title { padding-top: 1em; font-weight:bolder; font-size: 50px;  text-align: center; margin-top: 30px;}
.form_fr {padding: 12px; width: 50%; margin: 0 auto;}
.btn-group {display:block; float:right; margin-right: 20%;}
.table {width: 100%;}
</style>
</head>
<body>
<div class="wrap">
<jsp:include page="/header.jsp" />
	<div class="field">
		<h2 class="page_title">로그인</h2>
		<div class="form_fr">
			<form name="frm1" id="frm1" action="${path1 }/UserLoginCtrl.do" method="post" onsubmit="return joinCheck(this)">
			 	<table class="table">
					<tbody>
						<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="id" name="id" class="input" placeholder="아이디입력" autofocus required/>
							<div>
								<c:if test="${empty msg }">
									<p></p>
								</c:if>
								<c:if test="${not empty msg }">
									<p>${msg }</p>
								</c:if>
							</div>
						</td>
						</tr>
						<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" id="pw" name="pw" class="input" placeholder="비밀번호입력" required/>
						</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="submit" name="submit-btn" class="button is-link" value="로그인">
					<input type="reset" name="reset-btn" class="button is-warning" value="취소">
					<a href="<%=request.getContextPath() %>/user/membership.jsp" class="button button-danger">회원가입</a>
				</div>
			</form>
		</div>	
	</div>	
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
