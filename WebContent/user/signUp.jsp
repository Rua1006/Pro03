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
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<style>
.content {padding: 24px; width: 1000px; margin:50px auto;}
.page_title { padding-top: 1em; font-weight:bolder; font-size: 50px;  text-align: center; margin-top: 30px;}
.form_fr {padding: 24px; width: 50%; margin:50px auto;}
.title { padding-top:36px; padding-bottom:20px;}
.btn-group { margin:10px auto; padding: 24px; display:block; float:right; }
.table {width: 100%;}
</style>
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="field">
<h2 class="page_title">회원가입</h2>
<div class="form_fr">
	<form action="${path1 }/AddUserCtrl.do" method="post" name="frm1" id="frm1" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
				<th>아이디</th>
				<td>
					<div class="form-row">
					<input type="text" id="id" name="id" class="input" placeholder="아이디입력" autofocus required/>
					<input type="button" class="button is-link" value="아이디 중복 확인" onclick="idCheck()">
					<input type="hidden" name="idck" id="idck" value="no">
					</div>
					<div>
						<c:if test="${empty qid }">
						<p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
						</c:if>
						<c:if test="${not empty qid }">
						<p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
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
				<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pw2" name="pw2" class="input" placeholder="비밀번호확인" required/>
				</td>
				</tr>
				<tr>
				<th>이름</th>
				<td>
					<input type="text" id="name" name="name" class="input" placeholder="이름입력" required/>
				</td>
				</tr>
				<tr>
				<th>이메일</th>
					<td><input type="email" name="email" id="email" placeholder="이메일 입력" class="input" required></td>
				</tr>
				<tr>
				<th>생년월일</th>
					<td><input type="date" name="birth" id="birth" placeholder="생년월일 입력" class="input" required></td>
				</tr>
				<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="tel" name="tel" class="input" placeholder="000-0000-0000" required>
				</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="input" required /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" required /><br>
					<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="input">
					<button id="post_btn" onclick="findAddr()" class="button is-link">우편번호 검색</button>
					</td>
				</tr>
			</tbody>		
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" value="가입" class="button is-link">
			<input type="reset" name="reset-btn" value="취소" class="button is-warning" >
		</div>	
	</form>
	<script>
	$(document).ready(function(){
		$("#id").keyup(function(){
			$("#idck").val("no");
			if($(this).val()!=""){
				$("#msg").html("<strong>아이디 입력중입니다.</strong>");
			} else {
				$("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
			}
		});
	});
	</script>
	<script>
	function idCheck(){
		if($("#id").val()==""){
			alert("아이디를 입력하지 않으셨습니다.");
			$("#id").focus();
			return;
		} 
		var params = {	id : $("#id").val()	} //전송되어질 데이터를 객체로 묶음
		$.ajax({
			url:"${path1 }/IdCheckCtrl.do",	//아이디가 전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(result){
				console.log(result.result);
				var idChk = result.result;	//true 또는 false를 받음
				if(idChk==false){	//사용할 수 없는 아이디
					$("#idck").val("no");
					$("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
					$("#id").focus();
				} else if(idChk==true){	//사용 가능한 아이디
					$("#idck").val("yes");
					$("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
				} else if(idck==""){
					$("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
				}
			}
		});
	}
	function joinCheck(f){
		if(f.pw.value!=f.pw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.pw.focus();
			return false;
		}
		if(f.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>