<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.*, java.net.InetAddress" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<c:set var="path1" value="${request.getContextPath()}" />
<c:set var="path2" value="${pageContext.request.contextPath }"/>
<!DOCTYPE>
<html>
	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대구관광안내 DAEGU TOURIST INFORMATION</title>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
   <style>
	.section {height: auto; width: 1300px; margin: 0 auto;}    
   	.panel-block {width: 50%; margin: 0 auto;}
   	.title {font-size:25px;}
   </style>
</head>
<body>
<jsp:include page="${path1 }/header.jsp"/>
<div class="panel-block">
   	<p class="control has-icons-left">
     	<input class="input is-primary" type="text" placeholder="Search">
     	<span class="icon is-left">
       	<i class="fas fa-search" aria-hidden="true"></i>
     	</span>
   	</p>
</div>
<section class="section">	
<div class="tile is-ancestor">
  <div class="tile is-parent">
    <article class="tile is-child box" style="height: 240; ">
		<img alt="fes" src="${path0 }/data/getImage.jpg" style="width: 350; height: 190;">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=A">
      	명품관광코스
      	</a>	
    </article>
  </div>
  <div class="tile is-parent">
    <article class="tile is-child box"  style="height: 240;">
    	<img alt="fes" src="${path0 }/data/getImage11.jpg" style="width: 350; height: 190;">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=B">
      	관광명소
      	</a>
    </article>
  </div>
  <div class="tile is-parent">
    <article class="tile is-child box"  style="height: 240;">
     <img alt="fes" src="${path0 }/data/getImage13.jpg" style="width: 350; height: 190;">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=C">
      	축제
      	</a>
    </article>
  </div>
</div>
<div class="tile is-ancestor">
  <div class="tile is-vertical is-9">
    <div class="tile">
      <div class="tile is-parent is-vertical">
        <article class="tile is-child box"  style="width: 240;">
         <img alt="fes" src="${path0 }/data/getImage10.jpg" style="width: 220; height: 190;">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=D">
      	숙박
      	</a>
        </article>
        <article class="tile is-child box" style="width: 240;">
          <img alt="fes" src="${path0 }/data/rec3.jpg" >
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=E">
      	식당
      	</a>
        </article>
      </div>
      <div class="tile is-parent">
        <article class="tile is-child box">
         <iframe width="600"  height="400" src="https://www.youtube.com/embed/I_bsnbBFXZo" title="대구시티투어-클래식투어" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </article>
      </div>
    </div>
  </div>
  <div class="tile is-vertical is-3">
    <div class="tile">
      <div class="tile is-parent is-vertical">
        <article class="tile is-child box" style="width: 279;" >
           <img alt="fes" src="${path0 }/data/tasteLogo.jpg">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=F">
      	대구 10미
      	</a>
        </article>
        <article class="tile is-child box">
          <img alt="fes" src="${path0 }/data/dvvp1.jpg">
      	<a class="title link"  href="${path2 }/GetTourCateListCtrl.do?cate=G">
      	쇼핑
      	</a>
        </article>
      </div>
    </div>
  </div>
</div>
</section>
<jsp:include page="${path1 }/footer.jsp"/>	
</body>
</html>