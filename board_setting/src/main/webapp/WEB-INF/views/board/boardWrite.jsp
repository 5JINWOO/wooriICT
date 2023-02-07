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
	<title>게시글 작성</title>
</head>
<body>
<div class="container">
<h1>
	게시글 작성
</h1>

<form>	
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" placeholder="제목을 입력하세요." id="boardTitle" name="boardTitle" />
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" placeholder="작성자를 입력하세요." id="boardWriter" name="boardWriter" />
	</div>
	<div class="form-group">		
		<label>내용</label>
		<textarea class="form-control" cols="50" rows="10" placeholder="내용을 입력하세요." id="boardContent" name="boardContent" /></textarea>
	</div>
	<button type="button" class="btn btn-info" onclick="fn_boardRegi()">작성</button>
	<button type="button" class="btn btn-primary" onclick="location.href='/board/list'">목록</button>
</form>
</div>
</body>
</html>
