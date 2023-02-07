<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script defer src="${path}/resources/js/board.js"></script>
	<title>게시판</title>
</head>
<body>
<div class="container">
  <h2>게시판</h2>
  <form>
  <div class="table-responsive">          
  <table class="table table-striped">
    <thead>
      <tr>
        <th class="col-md-1">번호</th>
        <th class="col-md-5">제목</th>
        <th class="col-md-3">작성자</th>
        <th class="col-md-3">날짜</th>        
      </tr>
    </thead>    
    <tbody>
    <c:forEach items = "${boardList}" var= "list">
      <tr>
        <td>${list.boardNo}</td>     
        <td><a href="/board/detail?boardNo=${list.boardNo}">${list.boardTitle}</a></td>     
        <td>${list.boardWriter}</td>
        <td><fmt:formatDate value="${list.boardDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
  <button type="button" class="btn btn-success" onclick="location.href='/board/write'">글쓰기</button>
  </form>
</div>
</body>
</html>