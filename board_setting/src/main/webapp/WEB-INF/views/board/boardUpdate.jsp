<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="${path}/resources/js/board.js"></script>
	<title>게시글 수정</title>
</head>
<body>
<div class="container">
<h1>
	게시글 수정
</h1>

<form method = "post">	
	<input type="hidden" value="${boardDetail.boardNo}" id="boardNo" name="boardNo">
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" value="${boardDetail.boardTitle}" id="boardTitle" name="boardTitle" />
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" value="${boardDetail.boardWriter}" id="boardWriter" name="boardWriter" />
	</div>
	<div class="form-group">		
		<label>내용</label>
		<textarea class="form-control" cols="50" rows="10" id="boardContent" name="boardContent" />${boardDetail.boardContent}
		</textarea>
	</div>
	<button type="button" class="btn btn-info" onclick="fn_boardUpd()">수정</button>
	<button type="button" class="btn btn-primary" onclick="location.href='/board/list'">목록</button>
</form>
</div>
</body>
</html>
