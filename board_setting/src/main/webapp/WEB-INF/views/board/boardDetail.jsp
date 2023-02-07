<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${path}/resources/js/board.js"></script>
<title>게시글 상세</title>
</head>
<body>
	<div class="container">
		<h1>게시글 상세</h1>

		<form>
			<div class="form-group">
				<label>번호</label> ${boardDetail.boardNo}
			</div>
			<div class="form-group">
				<label>제목</label> ${boardDetail.boardTitle}
			</div>
			<div class="form-group">
				<label>작성자</label> ${boardDetail.boardWriter}
			</div>
			<div class="form-group">
				<label>내용</label>
				<div>${boardDetail.boardContent}</div>
			</div>
			<button type="button" class="btn btn-info"
				onclick="location.href='/board/updateView?boardNo=${boardDetail.boardNo}'">수정</button>
			<button type="button" class="btn btn-danger"
				onclick="location.href='/board/delete?boardNo=${boardDetail.boardNo}'">삭제</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/board/list'">목록</button>
		</form>
	</div>
</body>
</html>
