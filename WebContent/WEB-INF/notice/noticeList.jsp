<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*, java.net.InetAddress" %>
<%@ page import ="kr.go.deagu.model.*" %>
<c:set var="path1" value="<%=request.getContextPath()%>" /> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>
  <jsp:include page="/header.jsp"/>
  <section class="section">
    <div class="container">
      <table class="table">
		  <thead>
		    <tr>
		      <th><abbr title="No">No</abbr></th>
		      <th><abbr title="Title">Title</abbr></th>
		      <th><abbr title="Result">RegDate</abbr></th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${list }" var="dto" varStatus="status" >
		    <tr>
		      <td>${status.count }</td>
		      <td><a href="${path1 }/GetNoticeCtrl.do?no=${dto.no}">${dto.title }</a></td>
		      <td>
		    	<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss"/>
		    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>  
			</td>
		    </tr>
		  </c:forEach> 
		  </tbody>
	</table>
    </div>
  </section>
  <jsp:include page="/footer.jsp"/>
  </body>
</html>