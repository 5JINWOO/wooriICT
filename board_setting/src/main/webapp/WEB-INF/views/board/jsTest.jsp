<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css"/>
<!--  CSS초기화 시켜주는 link 걸어준 후 실행 > border겹치는 것 해결됨 -->
<%@ include file="../common/common.jsp"%>
<%@ include file="../common/nav.jsp"%>
<head>
<meta charset="UTF-8">
<title>자바스크립트 Test</title>
<style type="text/css">
	#numText {
		width:50px;
		margin-right :-4px;
	}
</style>
</head>
<body>
	<!-- Test2 - 구구단 -->
	<div class="container col-md-3">
		<h3>TEST2 - 구구단</h3>		
		<select id="dan">
			<option>선택</option>
			<option value="1">1단</option>
			<option value="2">2단</option>
			<option value="3">3단</option>
			<option value="4">4단</option>
			<option value="5">5단</option>
			<option value="6">6단</option>
			<option value="7">7단</option>
			<option value="8">8단</option>
			<option value="9">9단</option>
		</select>		
		<button onclick="gugudan()">계산</button>
		<div id=printGugu></div>
	</div>
	
	
	<!-- Test4 - 색상변경 -->
	<div class="container col-md-3">
		<h3>TEST4 - 색상변경</h3>
		<div id ="all">
			<div id="first">첫번째</div>
			<div id="second">두번째</div>
			<div id="third">세번째</div>
			<div id="fourth">네번째</div>
		</div>
		<select id="order">
			<option>선택</option>
			<option value="all">전체</option>
			<option value="0">첫번째</option>
			<option value="1">두번째</option>
			<option value="2">세번째</option>
			<option value="3">네번째</option>
<!-- 			<option>선택</option> -->
<!-- 			<option value="all">전체</option> -->
<!-- 			<option value="first">첫번째</option> -->
<!-- 			<option value="second">두번째</option> -->
<!-- 			<option value="third">세번째</option> -->
<!-- 			<option value="fourth">네번째</option> -->
		</select> 
		<select id="color">
			<option value="">선택</option>
			<option value="red">빨강</option>
			<option value="blue">파랑</option>
			<option value="yellow">노랑</option>
			<option value="green">초록</option>
		</select>
		<button onclick="changeColor()">변경</button>
	</div>
	
	<!-- Test6 -->
	<div class="container col-md-3">
		<h3>TEST6</h3>
		<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="numText">  <!-- 양의정수외 입력안되게하기 -->	
		<button onclick="numTable()">선택</button>
		<div id="resultTb" >
			<table class="table table-bordered">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody id='tdResult'>
				</tbody>
			</table>
		</div>
	</div>
	
<script>
	/* Test2-구구단 */
	function gugudan(){         
         var dan = $("#dan").val();         
         
         var str ="";
         for (var i = 1; i <= 9; i++) {
             var r = dan * i;
             str += dan + "×" + i + "=" + r + "<br>";
         }
         $("#printGugu").empty().append(str); /* 다른 값이 오면 지워지고 다른값이 표시되게 empty추가 */
    }

	/* Test4-색상변경 */
	function changeColor(){	
// 		제이쿼리 사용한 방법	
		var order = $("#order").val();
		var color = $("#color").val();
		$("#all").find("div").removeAttr("style");
		if(order == "all") {
			$("#all").find("div").css("color", color);
		} else {
			$("#all").find("div").eq(order).css("color", color);
		}
		/* $('#all').css('color', 'black');  변하지 않은 부분도 있어서 css적용이 안됨*/ 
// 		-> 자바스크립트 사용 
// 		$('#first').css('color', 'black');
// 		$('#second').css('color', 'black');
// 		$('#third').css('color', 'black');
// 		$('#fourth').css('color', 'black'); /* 색상 검은색으로 초기화 / id=all을 쓸 경우 css안먹는 경우가 있다. */

// 		console.log(order);
// 		console.log(color);

// 		if(!color) {
// 			alert("변경할 색상을 선택해주세요");						
// 		}else { 
// 		if (order == "all") {
// 			$('#first').css('color', color);
// 			$('#second').css('color', color);
// 			$('#third').css('color', color);
// 			$('#fourth').css('color', color);
// 		}
// 		else if(order =="first") $('#first').css('color', color);
// 		else if(order =="second") $('#second').css('color', color);
// 		else if(order =="third") $('#third').css('color', color);
// 		else if(order =="fourth") $('#fourth').css('color', color);
// 		else alert("변경할 부분를 고르시오")
// 		}
	}

	function numTable(){
		var num = $('#numText').val();
		console.log("");
		console.log(num);
		var cnt = 1;		

		var result = "";

		if(num != 0){		
			for(var i=0; i<(num/4); i++) {
				result += "<tr>";
				for(var j=1; j<=4; j++) {
					if(num-cnt>=0) {
						result += "<td>" + cnt + "</td>";
						cnt++;	
					}else {
						result += "<td>X</td>";
					}									
				}				
				result += "</tr>";
			}
		}
		console.log(result);
		$('#tdResult').html(result);
	}
</script>
</body>
</html>