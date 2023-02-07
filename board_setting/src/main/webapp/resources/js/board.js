/*글등록하기*/
function fn_boardRegi(){
	var boardTitle = $("#boardTitle").val();
	var boardWriter = $("#boardWriter").val();
	var boardContent = $("#boardContent").val();
		
	console.log("글등록 ajax");
	
	if(boardTitle==""){
		alert("제목을 입력하세요.")
		$("#boardTitle").focus();
	}else if (boardWriter==""){
		alert("작성자를 입력하세요.")
		$("#boardWriter").focus();
	}else if (boardContent==""){
		alert("내용을 입력하세요.")
		$("#boardContent").focus();
	}else {
	
	$.ajax({
		type : "POST",
		url : "/board/regi",
		/*contentType : "application/json; charset=utf-8",*/
		data : {'boardTitle' : boardTitle, 'boardWriter' : boardWriter, 'boardContent' : boardContent},
		success: function(data){
			if(data == 1){
				alert("글 등록이 완료되었습니다.");
				location.href = "/board/list";		
			}
		},
		error: function(data){
			alert("실패");
			console.log(data);
		}
	});
	
	}
};

/*글수정하기*/
function fn_boardUpd(){
	var boardNo = $("#boardNo").val();
	var boardTitle = $("#boardTitle").val();
	var boardWriter = $("#boardWriter").val();
	var boardContent = $("#boardContent").val();
		
	console.log("글수정 ajax");
	console.log(boardNo);
	
	if(boardTitle==""){
		alert("제목을 입력하세요.")
		$("#boardTitle").focus();
	}else if (boardWriter==""){
		alert("작성자를 입력하세요.")
		$("#boardWriter").focus();
	}else if (boardContent==""){
		alert("내용을 입력하세요.")
		$("#boardContent").focus();
	}else {
	
	$.ajax({
		type : "POST",
		url : "/board/update",
		/*contentType : "application/json; charset=utf-8",*/
		data : {'boardNo':boardNo, 'boardTitle' : boardTitle, 'boardWriter' : boardWriter, 'boardContent' : boardContent},
		success: function(data){
			if(data == "1"){
				alert("글 수정이 완료되었습니다.");
				location.href = "/board/list";		
			}
		},
		error: function(data){
			alert(data);
			alert("실패");
			console.log(data);
		}
	});	
	}
};

