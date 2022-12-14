<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<c:set var="path1" value="<%=request.getContextPath() %>" />
	<article class="panel is-success">
  <p class="panel-heading">
    관리자 메뉴
  </p>
  <a class="panel-block is-active" href="${path1 }/GetUserListCtrl.do">
	회원관리
  </a> 
  <a class="panel-block" href="${path1 }/GetTourListCtrl.do">
  	관광서비스 관리
  </a>
  <a class="panel-block" href="${path1 }/GetNoticeListCtrl.do">
	게시판관리
  </a>
  <a class="panel-block">
  	더 알아보기
  </a>
</article>