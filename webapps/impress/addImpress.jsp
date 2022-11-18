<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%-- <c:set var="path1" value="${pageContext.request.contextPath }" />   --%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이용후기 작성</title>
    <jsp:include page="../head.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
   	<style>
	/* .star input[type=radio]{display: none;} */
	</style>
  </head>
  <body>
  <jsp:include page="../header.jsp" />
  <section class="section">
    <div class="container">
      <h1 class="title">이용후기 작성</h1>
      	<form action="${path1 }/AddImpressCtrl.do" method="post" id="frm1" name="frm1">
			<div class="field">
			  	<label class="label">분류</label>
			  	<div class="select">
				  <select name="cate" id="cate" class="select" onchange="changeTourNo()" required>
				  	<option value="">선택</option>
				    <option value="A">명품관광코스</option>
				    <option value="B">관광명소</option>
				    <option value="C">축제</option>
				    <option value="D">숙박</option>
				    <option value="E">식당</option>
				    <option value="F">음식</option>
				    <option value="G">쇼핑</option>
				    <option value="H">기타</option>
				  </select>
				  <input type="hidden" id="tourno" name="tourno" value="">
				</div>
			</div>
			<div class="field">
				<label class="label">이용후기</label>
				<div class="control has-icons-left has-icons-right">
				  <textarea class="textarea" name="content" id="content" cols="80" rows="8" maxlength="500" required></textarea>
				</div>
 				<p class="help is-success">이용후기를 작성해주세요.</p>
			</div>
			<!-- star : double  -->
			<section class="star"> 
				<label class="label">별점을 선택해주세요</label>
				<input type="radio" name="star" value="5" id="rate1">
					<label for="rate1">★</label>
				<input type="radio" name="star" value="4" id="rate2">
					<label for="rate2">★</label>
				<input type="radio" name="star" value="3" id="rate3">
					<label for="rate3">★</label>
				<input type="radio" name="star" value="2" id="rate4">
					<label for="rate4">★</label>
				<input type="radio" name="star" value="1" id="rate5">
					<label for="rate5">★</label>
			</section>
			<div class="field">
				<label class="label">사진 추가</label>
				<div class="control">
					<button type="button" class="button is-link" onclick="imgUpload(1)">사진 추가</button>
				</div>
			</div>
			<div class="buttons">
			  <button type="submit" class="button is-success">등록</button>
			  <button type="reset" class="button is-warning">취소</button>
			  <a href="${path1 }/GetImpressListCtrl.do" class="button is-info">목록</a>
			</div>
		</form>
    </div>
  </section>
  <script>
  function imgUpload(no){
	var tourno = document.frm1.tourno.value;
	if(tourno==""){
		alert("이용 카테고리를 선택해주세요");
		return;
	}
	var win1 = window.open("imgUpload2.jsp?no="+no+"tourno="+tourno,"win","width=400, height=150");
  }
  function changeTourNo(){
	  var cate = document.frm1.cate.value;
	  if(cate==""){
		  alert("이용 카테고리를 선택하지 않으셨습니다.")		  
	  }
	  $.ajax({
		url:"${path1 }/NoLoadCtrl.do",
		type:"post",
		dataType:"json",
		success:function(data){
			$("#tourno").val(cate+data.no);
		}
	  });
  }
  </script>
  <jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>