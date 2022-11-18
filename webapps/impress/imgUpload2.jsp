<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%
	String no = request.getParameter("no");
	String tourno = request.getParameter("tourno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
<jsp:include page="../head.jsp" />
</head>
<body>
<form name="upload" id="upload" action="${path1 }/ImgUploadCtrl.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
		<th>업로드 파일</th>
			<td>
			<div class="file">
				<label class="file-label">
					<input class="input" type="file" name="picname" id="picname" accept="image/*">
				</label>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="field is-grouped">
				  <div class="control">
				    <button type="button" class="button is-link" onclick="fileUpload()">파일 업로드</button>
				  </div>
				  <div class="control">
				    <button type="reset" class="button is-link is-light">취소</button>
				  </div>
				  <div class="control">
				    <button type="button" class="button is-link is-light" onclick="picCheck()">확인</button>
				  </div>
				  <div class="control">
				    <button type="button" class="button is-link is-light" onclick="window.close()">닫기</button>
				  </div>
				</div>
			</td>
		</tr>
	</table>
	<div id="imgUpload">
		
	</div>
	<script>
	$(document).ready(function(){
		fileResearch();
	});
	</script>
	<script>
	function fileUpload(){
		if($("#picname").val()==""){
			alert("업로드할 파일을 지정하지 않으셨습니다.");
			return;
		}
		//파일 용량 제한
		var maxSize  = 10*1024*1024;    //10MB
		if ($('#picname').val() != "") { 
			var size = document.getElementById("picname").files[0].size;
			if(size > maxSize){
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$('#picname').val("");
				$('#picname').focus();
				return false;
	        }
		}
	</script>
	<script>
	function picCheck(){
		if(document.upload.pos.value=="1" || document.upload.pos.value==1){
			opener.document.frm1.pic_ck1.value = "yes";
			opener.document.frm1.pic1.value = document.upload.picname.value;
		} 
		window.close();
	}
	</script>
</form>
</body>
</html>