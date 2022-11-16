<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
</head>
<body>
<div>
	<h2>이미지 업로드</h2>
	<form action="${path1 }/ImgUploadCtrl.do " method="post" name="upload" id="upload" enctype="mutilpart/form-data">
		<table class="row">
			<tr>
				<th>장소</th>
				<td>
					<input type="number" name="pos" id="pos" class="input" value="${pos }">
				</td>
				<th>장소 번호</th>
				<td>
					<input type="text" name="tourno" id="tourno" class="input" value="${tourno }">
				</td>
				<th>파일 이름</th>
				<td>
					<input type="file" name="filename" id="filename" class="input" value="${filename }">
				</td>
			</tr>
		</table>
		<div class="control">
    	<button class="button is-link">사진업로드</button>
  		</div>
	</form>
</div>
</body>
</html>