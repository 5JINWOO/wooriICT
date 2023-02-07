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
<title>Ajax게시판</title>

</head>
<body>
	<div class="container">
		<h2>게시판</h2>
		<form>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr> 
							<th class="col-md-2"><input type="checkbox" id="chkAll" >전체선택</th>
							<th class="col-md-1">번호</th>
							<th class="col-md-5">제목</th>
							<th class="col-md-2">작성자</th>
							<th class="col-md-2">날짜</th>
						</tr>
					</thead>
					<tbody id="listView">
					</tbody> <!-- test -->
				</table>
			</div>
			<button type="button" class="btn btn-success"
				onclick="regiView()">글쓰기</button>
		</form>
		
		<!---------------------------------------- 글등록창 --------------------------------------------->
		<form id="regi" style="display:none">
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					placeholder="제목을 입력하세요." id="ajaxTitle" name="boardTitle" />
			</div>
			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control"
					placeholder="작성자를 입력하세요." id="ajaxWriter" name="boardWriter" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" cols="50" rows="10"
					placeholder="내용을 입력하세요." id="ajaxContent" name="boardContent" /></textarea>
			</div>
			<button type="button" class="btn btn-info" onclick="ajaxRegi()">작성</button>
		</form>
		<!---------------------------------------- 글 상세창 --------------------------------------------->
		<div id="detail">
			
		</div>
		<!---------------------------------------- ------- --------------------------------------------->
	</div>
<script>
	$(document).ready(function() {
		console.log("jQuery START");
		ajaxList();
		/*글 전체 선택 */
		$("#chkAll").click(function(){
			var chkList = $('input[name=chk]');	
			if($("#chkAll").is(":checked")) chkList.prop("checked", true);
			else chkList.prop("checked", false);
		});		
	});
	/*글 목록*/
	function ajaxList() {
		console.log("ajaxList실행");			
		$.ajax({
			url : "/board/ajaxList",
			type : "GET",
			success : function(data) {
				console.log(data);
				var result = "";
				result += "<tr><td><button type='button' class='btn btn-danger' onclick='selectDel()'>선택삭제</button></td></tr>";
				for (var i = 0; i < data.length; i++) {
					var date = new Date(data[i].boardDate);
					date = moment(date).format(
							'YYYY-MM-DD HH:mm:ss');
					result += "<tr>";
					result += "<td><input type='checkbox' name='chk' value='" + data[i].boardNo + "'></td>";
					result += "<td>" + data[i].boardNo + "</td>";
					result += "<td><a href='javascript:void(0)' onclick='ajaxDetail("+data[i].boardNo+")'>"
							+ data[i].boardTitle + "</a></td>";
					result += "<td>" + data[i].boardWriter
							+ "</td>";
					result += "<td>"
							+ date
							+ " <button type='button' class='btn btn-danger pl-1' onclick='ajaxDel("
							+ data[i].boardNo
							+ ")'>삭제</button></td>";
					result += "</tr>";
					result += "</tr>";
				}
				$('#listView').html(result);
			},
			error : function() {
				alert("error");
			}
		});
	}	
	
	/*글 선택 삭제 */
	function selectDel(){ 
		console.log("selectDel 실행");
		var delList = new Array();
		var chkList = $('input[name=chk]:checked');
		
		for(var i =0; i<chkList.length; i++){			
			delList.push(chkList[i].value);			
		}
		console.log("delList 값:"+delList.length); 	
		
		if(delList.length == 0) alert("삭제할 대상을 체크하여 주십시오.");
		else {
			alert(delList);

			$.ajax({
				url : "/board/selDelete",
				type : "GET",
				traditional: true,
				data : {
					delList : delList
				},				
				success : function(data) {
					if (data == "Y") {
						console.log("글삭제 성공");
						ajaxList();
					} else
						console.log("글삭제 실패");
				},
				error : function() {
					alert("글삭제 실패");
				}
			});		
		}
	}
	/*글 삭제 */
	function ajaxDel(boardNo) {
		console.log("ajaxDel실행");
		var result = confirm("삭제하시겠습니까?");

		if (result == true) {
			$.ajax({
				url : "/board/ajaxDelete",
				type : "GET",
				data : {
					'boardNo' : boardNo
				},
				success : function(data) {
					if (data == "Y") {
						console.log("글삭제 성공");
						ajaxList();
					} else
						console.log("글삭제 실패");
				},
				error : function() {
					alert("글삭제 취소");
				}
			});
		} else
			console.log("글삭제 취소");
	}
	/* 버튼 클릭 시 글 등록 창 생성/제거 */
	function regiView() {
		const regi = document.getElementById('regi');

		if (regi.style.display === 'none') {
			regi.style.display = 'block';
		} else {				
			regi.style.display = 'none';
			$('#regi').each(function() {     /* 입력된값 초기화시키기 */
				  this.reset();
			});
		}
	}
	/* 글 등록 */
	function ajaxRegi() {
		var boardTitle = $("#ajaxTitle").val();
		var boardWriter = $("#ajaxWriter").val();
		var boardContent = $("#ajaxContent").val();
			
		console.log("글등록 ajax");
		
		if(boardTitle==""){
			alert("제목을 입력하세요.")
			$("#ajaxTitle").focus();
		}else if (boardWriter==""){
			alert("작성자를 입력하세요.")
			$("#ajaxWriter").focus();
		}else if (boardContent==""){
			alert("내용을 입력하세요.")
			$("#ajaxContent").focus();
		}else {
		
			$.ajax({
				type : "POST",
				url : "/board/ajaxRegi",
				data : {'boardTitle' : boardTitle, 'boardWriter' : boardWriter, 'boardContent' : boardContent},
				success: function(data){
					if(data == 1){
						console.log("글 등록 완료");
						regiView();
						ajaxList();	
					}
				},
				error: function(data){
					alert("글 등록 실패");
					console.log(data);
				}
			});			
		}
	}
	/* 글 상세 */
	function ajaxDetail(boardNo) {
		console.log("AjaxDetail실행");
		console.log(boardNo);
		const detail = document.getElementById('detail');
		detail.style.display ='block';

		$.ajax({
			url : "/board/ajaxDetail",
			type : "GET",
			data : {'boardNo':boardNo},
			success : function(data) {
				console.log(data);
				var result = "";									
				result += "<div class='form-group'><label>번호</label><br>"+ data.boardNo+"</div>"
				result += "<div class='form-group'><label>제목</label><br>"+ data.boardTitle+"</div>"
				result += "<div class='form-group'><label>작성자</label><br>"+ data.boardWriter+ "</div>"
				result += "<div class='form-group'><label>내용</label><div>"+ data.boardContent+"</div>"					
				result += "</div><br>";
				result += "<button type='button' class='btn btn-primary'" 
				result += "onclick='detailClose()'>닫기</button>"
							
				$('#detail').html(result);
		    },
			error : function() {
				alert("글상세보기 실패");
			}
		});
	}
	/* 글 상세 닫기버튼 */
	function detailClose() {
		const detail = document.getElementById('detail');
		detail.style.display ='none';			
	}		
</script>
</body>
</html>