<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<jsp:include page="/head.jsp" />
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관광정보 업로드</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
<form action="${path1 }/AddTourCtrl.do" method="post" name="frm1" id="frm1" enctype="mutilpart/form-data">
<div class="field">
  <label class="label">카테고리 선택</label>
  <div class="control">
    <div class="select" onfocus="changeTourNo()">
      <select name="tourno">
	    <option id="cate" value="A">대표관광코스</option>
	    <option id="cate" value="B">나만의 맞춤관광</option>
	    <option id="cate" value="C">올레길/둘레길 코스</option>
	  </select>
    </div>
  </div>
</div>
  <label class="label">관광지 이름</label>
  <div class="control">
    <input class="input" type="text" placeholder="관광지 이름 입력" required>
    <p class="help is-success">관광지 이름을 입력하세요</p>
  </div>
<div class="field">
  <label class="label">관광지 정보 입력</label>
  <div class="control">
    <input class="input" type="text" placeholder="관광지 정보 입력" value="">
  </div>
  <p class="help is-success">관광지 정보를 입력하세요</p>
</div>
<div class="field">
  <label class="label">세부내용 입력</label>
  <div class="control">
    <textarea class="textarea" placeholder="Textarea" cols="20" rows="8"></textarea>
  </div>
</div>
<div class="file">
  <label class="file-label">
    <input class="file-input" type="file" name="pic_1" id = "pic_1" onclick="imgUpload()">
    <span class="file-cta">
      <span class="file-icon">
        <i class="fas fa-upload"></i>
      </span>
      <span class="file-label">
       	파일 업로드 테스트중
      </span>
    </span>
  </label>
</div>
<div class="field is-grouped">
  <div class="control">
    <button class="button is-link">전송</button>
  </div>
  <div class="control">
    <button class="button is-link is-light">취소</button>
  </div>
</div>
</form>
<script>
	function imgUpload(){
		var pic_1 = document.frm1.pic_1.value;
		var win = window.open("imgUpload.jsp?pic_1="+pic_1,"사진 업로드","width=500, height=500");
		
	}
	function changeTourNo(){
		var cate = document.frm1.cate.value;
		if(cate==""){
			alert("분류를 선택하지 않았습니다.");
			document.frm1.cate.focus();
			return;
		}
		$.ajax({
			url:"${path1 }/NoLoadCtrl.do",
			type:"post",
			dataType:"jason",
			success:function(data){
				console.log(data.no);
				$("#tourno").val(cate+data.no);
			}
		});
	}
</script>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>