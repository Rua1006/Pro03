<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<c:set var="path2" value="${pageContext.request.contextPath }"/>
<nav class="navbar is-white" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" id="logo" href="<%=request.getContextPath() %>/">
      
    </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>
	<div id="navbarBasicExample" class="navbar-menu">
	  <div class="navbar-start" id="gnb">
	    <div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=A">
		 	명품관광코스
			</a>
			<div class="navbar-dropdown cate" id="cate01">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=B">
		 	관광명소
			</a>
			<div class="navbar-dropdown cate" id="cate02">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=C">
		 	축제
			</a>
			<div class="navbar-dropdown cate" id="cate03">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=D">
		 	숙박
			</a>
			<div class="navbar-dropdown cate" id="cate04">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=E">
		 	식당
			</a>
			<div class="navbar-dropdown cate" id="cate05">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=F">
		 	음식
			</a>
			<div class="navbar-dropdown cate" id="cate06">
				    
			</div>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
			<a class="navbar-link"  href="${path2 }/GetTourCateListCtrl.do?cate=G">
		 	쇼핑
			</a>
			<div class="navbar-dropdown cate" id="cate07">
				    
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
	          <a class="navbar-item" href="<%=request.getContextPath()%>/GetQnaListCtrl.do">
	            QNA
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item" href="<%=request.getContextPath()%>/GetImpressListCtrl.do">
	 			이용후기
	          </a>
	          <hr class="navbar-divider">
	          <a class="navbar-item" >
	            Report an issue
	          </a>
	       	</div>
		</div>
	</div>
	</div>
    <div class="navbar-end">
	  <div class="navbar-item">
	  	<c:if test="${empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/user/membership.jsp" class="button is-dark">
	     <strong>회원가입</strong>
	   </a>
	   <a href="${path2 }/user/login.jsp" class="button is-light">
	   	 로그인
	   </a>
	 </div>
	</c:if>
	<c:if test="${not empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/UserInfoCtrl.do" class="button is-light">
	     <strong>유저정보</strong>
	   </a>
	   <a href="${path2 }/UserLogOutCtrl.do" class="button is-light">
	   	 로그아웃
	   </a>
		<c:if test='${sid.equals("admin")}'>
		   <a href="${path2 }/AdminCtrl.do" class="button is-warning">
		     <strong>관리자</strong>
		   </a>
	 	</c:if>
	 </div>
	</c:if>
  </div>
  </div>
</nav>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path2 }/MenuLoadCtrl.do",
			type:"POST",
			enctype:"UTF-8",
			datatype:"json",
			processData:false,
			contentType:false, 
			cache:false,
			success:function(data){
				$(".navbar-dropdown.cate").empty();
				var trans = $.parseJSON(data);
				$.each(trans, function(key, value){
					if(key=="data"){
						for(var i=0;i<value.length;i++){
							if(value[i].cate=="A"){
								$("#cate01").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="B"){
								$("#cate02").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="C"){
								$("#cate03").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="D"){
								$("#cate04").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="E"){
								$("#cate05").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="F"){
								$("#cate06").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="G"){
								$("#cate07").append("<a class='navbar-item' href='${path2 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							}
						}
					}
				});
				
			}
		});
	});
</script>