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
    <title>질문 및 답변 등록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>
  <jsp:include page="../header.jsp" />
  <section class="section">
    <div class="container">   
      <h2 class="title">질문 등록</h2>
      	<form id="frm1" name="frm1" action="${path1 }/AddQnaCtrl.do" method="post">
			<table class="table">
			   <tbody>
			    <tr>
		      		<th><label for="title">제목</label></th>
   			  		<td>
   			  			<input type="text" class="input" maxlength="120" name="title" id="title" placeholder="제목 입력" required />
   			  		</td>
			    </tr>
			    <tr>
			      	<th><label for="content">질문내용</label></th>
			      	<td><textarea rows="8" cols="100" name="content" id="content" class="textarea" required></textarea></td>
			    </tr>
		    	<tr>
   					<th><label for="author">작성자</label></th>
   					<td>
   						<input type="text" class="input" maxlength="120" name="author" id="author" value="${dto.id }" readonly/>
   						<input type="hidden" name="lev" id="lev" value="0"/>
   					</td>
			    </tr>
			    <tr>
					<th><label for="sec1">비밀글 여부</label></th>
					<td>
						<input type="radio" name="sec" id="sec1" value="N" checked>
						<label for="">공개</label>
						<input type="radio" name="sec" id="sec2" value="Y">
						<label for="">비밀글</label>
					</td>
				</tr>
			  </tbody>
			</table>
			<div class="buttons">
			  <button type="submit" class="button is-success">등록</button>
			  <button type="reset" class="button is-warning">취소</button>
			  <a href="${path1 }/GetQnaListCtrl.do" class="button is-info">목록</a>
			</div>
		</form>
    </div>
  </section>
  <jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
