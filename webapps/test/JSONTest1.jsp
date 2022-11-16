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
<title>JSON Test1</title>
<jsp:include page="/head.jsp" />
</head>
<body>
	<h2 class="title">JSON(JavaScript Object Notation)</h2>
	<p>자바스크립트의 객체 형태로 데이터를 교환하는 방식</p>
	<div id="js">
	
	
	</div>
	<script>
	$(document).ready(function(){
		//JSON = java MAP
		var obj = {name : "강병수", age:30 };
		$("#js").html("<p>이름:"+obj.name+"</p>");
		$("#js").append("<p>나이:"+obj.age+"</p>");
	});
	</script>
	<div id="con2">
	
	
	</div>
	<script>
	$(document).ready(function(){
		var params = { name : "강병수" } //전송되어질 데이터
		$.ajax({
			url:"${path1 }/JSONTest2.do", //#가 전송되어는 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(data){
				console.log(data);
				var user = data;
				$("#con2").html("이름 :"+user.name+", 점수 : "+user.point);	//?? 왜 데이터가 안오지
			}
		});
	});
	</script>
	<h2 class="title"></h2>
	<div id="con3">
	
	</div>
	<script>
	$(document).readt(function(){
		$.ajax({
			url : "${path1 }JSONTest3.do",
			type:"post",
			dataType:"json",
			data:params,
			success:function(){
			
			}
		});
	});
	</script>
</body>
</html>