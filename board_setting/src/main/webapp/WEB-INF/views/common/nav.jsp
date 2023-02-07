<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li role="presentation" class="home"><a href="/board/home">Home</a></li>
	<li role="presentation" class="dropdown board">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">게시판<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/board/list">게시판 목록</a></li>
			<li><a href="/board/ajaxView">게시판 목록 Ajax</a></li>			
		</ul></li>
	<li role="presentation" class="circulator"><a href="/board/circulator">계산기</a></li>
	<li role="presentation" class="jsTest"><a href="/board/jsTest">Test</a></li>
	<li role="presentation" class="calnav"><a href="/board/calendar">캘린더</a></li>
</ul>


<script>
$(document).ready(function() {
	console.log("[네비게이션바] 적용 jsp");
	var loc1 = location.pathname.split("/")[1];
	var loc2 = location.pathname.split("/")[2];

	console.log("loc1 => "+loc1);
	console.log("loc2 => "+loc2); 
	// 해당 페이지에 맞는 네비게이션바 강조 옵션 적용               loc1 비어있음 홈엔
	/* if(loc.indexOf("board") > -1){ */
		if(loc2.indexOf("home") > -1){
			$(".home").addClass("active");
		}else if(loc2.indexOf("jsTest") > -1){
			$(".jsTest").addClass("active");
		}else if(loc2.indexOf("circulator") > -1){
			$(".circulator").addClass("active");
		}else if(loc2.indexOf("calendar") > -1){
			$(".calnav").addClass("active");
		}else $(".board").addClass("active");	
	/* }else $(".circulator").addClass("active"); */
});
</script>