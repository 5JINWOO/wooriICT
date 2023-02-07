<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/common.jsp"%>
<%@ include file="../common/nav.jsp"%>
<head>
<meta charset="UTF-8">
<title>스케줄관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" type="text/css"	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />
<link href="/resources/css/calendar.css?after;" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="sec_cal">
		<div class="year"></div>
		<div class="cal_nav">
			<a href="javascript:;" class="go-prev"> &lt; </a>
			<div class="month"></div>
			<a href="javascript:;" class="go-next"> &gt; </a>
		</div>
	</div>
	<div class="cal_wrap container table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md day">일</th>
					<th class="col-md day">월</th>
					<th class="col-md day">화</th>
					<th class="col-md day">수</th>
					<th class="col-md day">목</th>
					<th class="col-md day">금</th>
					<th class="col-md day">토</th>
				</tr>
			</thead>
			<tbody id="cal_body">
			</tbody>
		</table>
	</div>
	<!------------------------------ =모달창=-------------------------------- -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<div>
					<h2>스케줄 입력</h2>
					<div class="close-area">
						<i class='fa-solid fa-xmark'></i>
					</div>
				</div>				
				<div class="todayData">XXXX년 X월 XX일</div>				
			</div>			
			<div class="content">
				<table class="table">
					<thead>
						<tr>
							<th class="col-xs-1">시간</th>
							<th class="col-xs-8">내용</th>
							<th class="col-xs-1">중요</th>
							<th class="col-xs-1">삭제</th>
						</tr>
					</thead>
					<tbody id="schView">
					</tbody>
				</table>
				<form>
					<div class="form-group">
						<label class="inputTitle" for="timeInput">시간</label>
						<input type="time" class="form-control" name="calTime" id="timeInput">
					</div>
					<div class="form-group">
 						<label class="inputTitle" for="contentInput">내용</label>
  						<input type="text" class="form-control" id="contentInput" name="calContents" placeholder="스케줄 내용을 입력해 주세요.">
					</div>
					<div class="checkbox reqbox">
    					<label><input type="checkbox" id="reqInput" name="calReq">중요 스케줄(체크시 <span>*</span>표시 됩니다.)</label>
					</div>
					<div class="btn-lay">
					<button type="button" class="btn btn-basic cancelBtn" onclick="modalCancel()">취소</button>
					<button type="button" class="btn btn-primary" onclick="scheduleSave()">저장</button>	
					</div>				
				</form>
			</div>
		</div>
	</div>
	<script src="${path}/resources/js/calendar.js"></script>
</body>
</html>