<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<c:set var="path2" value="${pageContext.request.contextPath }"/>
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="<%=request.getContextPath() %>/">
      <img src="${path2 }/data/img/logo.png" width="112" height="28"/>
    </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>
	<div id="navbarBasicExample" class="navbar-menu">
	  <div class="navbar-start">
	    <div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link">
		 	명품관광코스
			</a>
			<div class="navbar-dropdown">
	          <a class="navbar-item">
				대표관광코스
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	         	  나만의 맞춤관광
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	         	  올레길/둘레길 코스
	          </a>
	       	</div>
		</div>
	    <a class="navbar-item" href="#">
		관광명소
	    </a>
	    <a class="navbar-item" href="#">
		축제
	    </a>
	    <a class="navbar-item" href="#">
		숙박/식당/쇼핑
	    </a>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link">
		 	대구관광
			</a>
			<div class="navbar-dropdown">
	          <a class="navbar-item">
				여행소식
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	         	   관광서비스
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	         	   문의
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	           	자주묻는질문
	          </a>
	       	</div>
		</div>
	    <a class="navbar-item" href="<%=request.getContextPath()%>/GetNoticeListCtrl.do">
		NOTICE
		</a>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link">
		 	더 알아보기
			</a>
			<div class="navbar-dropdown">
	          <a class="navbar-item">
	            About
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	            Contact
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item">
	            Report an issue
	          </a>
	       	</div>
		</div>
	</div>
    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-dark" href="${path2 }/user/membership.jsp">
            <strong>회원가입</strong>
          </a>
          <a class="button is-light" href="${path2 }/user/login.jsp">
          	로그인
          </a>
        </div>
      </div>
    </div>
  </div>
</nav>