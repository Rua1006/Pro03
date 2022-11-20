<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<style>
#logo { display:block; width:217px; height:63px; background-image:url("${path0 }/data/logo.png");
background-size:100% auto; background-repeat:no-repeat;}
#nav { border-bottom:3px solid #ddd; }
.navbar-menu .navbar-link {text-align: center;}
.tile:not(.is-child) {display: flex; flex-wrap: wrap;}
.tile {text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
.panel-heading {text-align: center;}
.panel-block {text-align: center;}
p.title { font-size:1.4rem; }
p.subtitle { font-size:1.1rem; }
.item_com {   overflow: hidden;  text-overflow: ellipsis;  display: -webkit-box;
  -webkit-line-clamp: 3;  -webkit-box-orient: vertical; font-size:0.9rem; }
.breadcrumb ul li:last-child { padding-right:1.5rem; }
p.comment2 { max-width:400px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; 
max-height:40px; }
.hidden_item { display:none; }
.star_data { height:36px; position:relative; background-image:url("${path0 }/data/star.png"); 
background-repeat:no-repeat; background-position:left center; background-size:100px auto; }
#star_group { width:100px; height:36px; position:relative; }
#star_group #stardate { width:100px; height:36px; background-image:url("${path0 }/data/star1.png"); 
background-repeat:no-repeat; background-position:left center; background-size:100px auto; }
#star_group #starrate { width:100px; height:36px; background-image:url("${path0 }/data/star.png"); 
background-repeat:no-repeat; background-position:left center; background-size:100px auto; }
#star10:checked ~ #star_group #starrate { width:100px; }
#star9:checked ~ #star_group #starrate { width:90px; }
#star8:checked ~ #star_group #starrate { width:80px; }
#star7:checked ~ #star_group #starrate { width:70px; }
#star6:checked ~ #star_group #starrate { width:60px; }
#star5:checked ~ #star_group #starrate { width:50px; }
#star4:checked ~ #star_group #starrate { width:40px; }
#star3:checked ~ #star_group #starrate { width:30px; }
#star2:checked ~ #star_group #starrate { width:20px; }
#star1:checked ~ #star_group #starrate { width:10px; }
#star_btn { width:100px; height:36px; position:absolute; z-index:20; top:0; left:0;  }
#star_btn label { display:block; width:10px; height:36px; position:relative; float:left; }
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>