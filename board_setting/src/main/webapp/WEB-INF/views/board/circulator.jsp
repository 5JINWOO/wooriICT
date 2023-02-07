<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 Test</title>
<style>
	table td {
		width:25%;	
	}
	input {
		border:none;
		width:100%;
		text-align:right;d
	}
	input:focus {
    	outline: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>계산기!</h1>
	<table class="table table-bordered">		
		<tr>
			<td colspan="4" id="cirDisplay"><input type="text" id="display" readonly="readonly" ></td> 
		</tr>
		
		<tr>
			<td onclick="add(7)">7</td>
			<td onclick="add(8)">8</td>
			<td onclick="add(9)">9</td>
			<td onclick="add('*')">X</td>	
		</tr>
		<tr>	
			<td onclick="add(4)">4</td>
			<td onclick="add(5)">5</td>
			<td onclick="add(6)">6</td>
			<td onclick="add('-')">-</td>	
		</tr>
		<tr>
			<td onclick="add(1)">1</td>
			<td onclick="add(2)">2</td>
			<td onclick="add(3)">3</td>
			<td onclick="add('+')">+</td>	
		</tr>
		<tr>
			<td onclick="del()">Del</td>
			<td onclick="add(0)">0</td>
			<td onclick="add('.')">.</td>
			<td onclick="circulate()">=</td>	
		</tr>
	</table>


</div>
<script>
	var display = document.getElementById('display'); //display부분
	var numCheck = false; //num체크
	var clear = false; //초기화 체크

// 	클릭시 애니메이션효과
	$("td").click(function() {         
		$(this).not("#cirDisplay").css("background-color", "gray"); // bgColor란 변수에, 본인의 background-color가 들어오게끔
 	 	setInterval(function(){
 			$("td").css("background-color", "white");
    	}, 100);  
	});

// 	입력
	function add(char) {
		if(clear && isNaN(char)==false) {                     // circulate 후  확인해서 클릭시에  초기화 시키기
			display.value = '';
			clear = false;
			numCheck = false;			
		}
			/* clear = false;	 */			
			if(numCheck == false) {
				clear = false;
				if(isNaN(char)) {
					//이전값이 연산자 > 입력 x				
				}else display.value += char;  //이전값이 숫자 > 입력 o
			}else {
				display.value += char; //numCheck true 입력 가능
				clear = false;
			}
			if(isNaN(char)) { //이번 입력 연산자 > false
				numCheck = false;  
			}else numCheck = true;     //이번 입력 숫자 > true				
		
		console.log(numCheck);
	}

// 	삭제
	function del() {
		display.value = display.value.slice(0, -1);	
		var last = display.value.slice(0);
		console.log(last);
		if(isNaN(last)){            //삭제시 numCheck처리하기
			numCheck = false;
		}else {
			if(!display.value){
				numCheck = false;
			}else numCheck = true;
		}
	}

// 	결과
	function circulate() { 
		/* console.log('계산'); */
		if(!display.value){
			console.log('계산');
			display.value = '';
		} //아무것도 안하게끔
		else {			
			display.value = eval(display.value);
			clear = true;
			numCheck = true;		
		}
	}
</script>
</body>
</html>