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
    <title>질문 및 답변 목록</title>
     <jsp:include page="/head.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="columns is-full">
    <jsp:include page="../../admin/admin_sidebar.jsp" />
  	<div class="column is-10">
      <h1 class="title">질문 및 답변 목록</h1>
		<table class="table">
		  <thead>
		    <tr>
		      <th><abbr title="No">번호</abbr></th>
		      <th><abbr title="Title">제목</abbr></th>
		      <th><abbr title="Title">작성자</abbr></th>
		      <th><abbr title="Result">작성일</abbr></th>
		    </tr>
		  </thead>
		   <tbody>
		   <c:forEach items="${list }" var="dto" varStatus="status">
		    <tr>
		      <td>${status.count }</td>
		      <td>
		      	<c:if test='${sid.equals(dto.getAuthor()) || sid.equals("admin")}'>
		      		<a href="${path1 }/GetQnaCtrl.do?no=${dto.no }">${dto.title }</a>
		      	</c:if>
		      	<c:if test='${sid.notequals(dto.getAuthor()) || sid.notequals("admin")}'>
		      		<span>"${dto.getTitle()}"</span>
		      	</c:if>
		      </td>	
		      <td>
		      	<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		    </tr>
		    </c:forEach>
			 <c:if test="${empty list }">
		    <tr>
		    	<td colspan="3">해당 데이터 목록이 없습니다.</td>
		    </tr>
		    </c:if>
		  </tbody>
		</table>
		<div class="buttons">
		  <a href="${path1 }/qna/addQna.jsp" class="button is-success">글 등록</a>
		</div>
    </div>
    </div>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>