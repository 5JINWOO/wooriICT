let today = new Date(); // 오늘날짜 비교
let thisMonth = new Date();
today.setHours(0,0,0,0);
let pickYear;
let pickMonth;
let pickDay;
let thisColumn;

buildCalendar();
// 달력 렌더링

function buildCalendar() {		
	let firstDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), 1); // 이번달  시작
	let lastDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, 0); // 이번달 끝
	let calendar = document.getElementById("cal_body");
	$('.year').text(thisMonth.getFullYear());
	$('.month').text(thisMonth.getMonth()+1);	
	
	$.ajax({
		type : "GET",
		url : "/board/schView",
		data : {'calYear' : thisMonth.getFullYear(),
				'calMonth' : thisMonth.getMonth()+1,// 냔
				},
		success: function(data){			
			while (calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
				calendar.deleteRow(calendar.rows.length - 1);
			}
			let nowRow = calendar.insertRow(); // 첫번째 행

			for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
				let nowColumn = nowRow.insertCell(); // 열 추가
			}	
			
			for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) { 
				let nowColumn = nowRow.insertCell(); // 새 열을 추가하고
				nowColumn.innerText = nowDay.getDate(); // 추가한 열에 날짜 입력		
				nowColumn.onclick = function () { choiceDate(this); }	
				if (nowDay.getDay() == 0) { // 일요일인 경우 글자색 빨강으로
					nowColumn.style.backgroundColor = "#FFD1D1";
				}
				if (nowDay.getDay() == 6) { // 토요일인 경우 글자색 파랑으로 하고
					nowColumn.style.backgroundColor = "#D6D6FB";
					nowRow = calendar.insertRow(); // 새로운 행 추가
				}				
				for(var i=0; i<data.length; i++){
					if(nowColumn.innerText == data[i].calDay){
						nowColumn.style.backgroundColor = '#96CB96';
					}
				}	
			}
			for (let j = 1; j <= 6-(lastDate.getDay()); j++) { // 마지막날 요일뺀만큼
				nowRow.insertCell(); // 열 추가		
			}			
		},
		error: function(data){
			console.log("스케줄 저장 실패");
		}
	});   
}
// 날짜 선택
function choiceDate(nowColumn) {
	thisColumn = nowColumn;
	pickYear = thisMonth.getFullYear();
	pickMonth = thisMonth.getMonth()+1;
	pickDay = nowColumn.innerText;
	console.log(pickYear+"년"+ pickMonth +"월"+ pickDay +"일");
	$('.todayData').text(pickYear+"년"+ pickMonth +"월"+ pickDay +"일");
    scheduleList();
    modalOn(); // 해당날짜 클릭시 모달 켜짐
} 
// 이전달 버튼 클릭
$('.go-prev').on('click', function() {
	thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() - 1, thisMonth.getDate());   
    buildCalendar();    // 달력 다시 생성
});
// 다음달 버튼 클릭
$('.go-next').on('click', function() {
	thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, thisMonth.getDate());   
    buildCalendar();    // 달력 다시 생성
});

// 모달창 부분
// //---------------------------------------------------------------------------------------------

const modal = document.getElementById("modal");	
// 모달창 띄우기
function modalOn() {
    modal.style.display = "flex";
};
function isModalOn() {
    return modal.style.display === "flex";
};
// 모달창 끄기
function modalOff() {
    modal.style.display = "none";
};	
// 닫기버튼 클릭시 모달창 꺼짐
$('.close-area').on('click', function() {
	modalOff();
});	
function modalCancel() {
	modalOff();
};
// 모달창 바깥부분 클릭시 모달창 꺼짐
modal.addEventListener("click", e => {
    const evTarget = e.target;
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff();
    }
});
// Esc클릭시 모달창 꺼짐
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
	        modalOff();
	}
});
// 저장된 스케줄 일정 가져오기
function scheduleList() {
	console.log("scheduleList 실행");			
	$.ajax({
		url : "/board/schList",
		type : "GET",
		data : {'calYear': pickYear,
				'calMonth': pickMonth,
				'calDay' : pickDay},			
		success : function(data) {
			console.log("스케줄불러오기 성공");
			var result = "";			
			for (var i = 0; i < data.length; i++) {
				result += "<tr>";
				result += "<td>" + data[i].calTime + "</td>";
				result += "<td>" + data[i].calContents + "</td>";
				if(data[i].calReq == 'true') {
					result += "<td><span>*</span></td>";
				}else result += "<td></td>";					
				result += "<td class='delbtn'><a href='javascript:void(0)' onclick='scheduleDel("+data[i].calNo+")'><i class='sch-del fa-solid fa-xmark'></i></td>"
				result += "</tr>";
			}
			$('#schView').html(result);
		},
		error : function() {
			console.log("스케줄불러오기 실패");
		}
	});
}

// 스케줄 일정 저장하기
function scheduleSave(){
	console.log("scheduleSave()실행");
	let calTime = $("#timeInput").val();
	let calContents = $("#contentInput").val();
	
	if($("#reqInput").is(":checked")) {
		calReq = "true";
	}else {
		calReq = "false"
	};
	
	let calDate = new Date();
	console.log(pickYear+"-"+pickMonth+"-"+pickDay);	
	// 유효성 검사
	if(calTime==""){
		alert("시간을 입력하세요.")
		$("#timeInput").focus();
	}else if (calContents==""){
		alert("내용을 입력하세요.")
		$("#contentInput").focus();
	}else {		
		console.log("스케줄저장"+pickYear+"년"+pickMonth+"월"+pickDay+"일"+calTime+"분"+calReq+"중요체크"+calContents+"내용");	
		$.ajax({
			type : "POST",
			url : "/board/schRegi",
			data : {'calYear': pickYear,
					'calMonth': pickMonth,
					'calDay' : pickDay,
					'calTime': calTime,
					'calReq': calReq,
					'calDate': calDate,
					'calContents':calContents},
			success: function(data){
				if(data=="1"){
				console.log("스케쥴 저장 성공");
				modalReset();
				modalOff();
				buildCalendar();
				}
			},
			error: function(data){
				console.log("스케쥴 저장 실패");
			}
		});			
	}
}
	// input 입력된 내용 지우기
function modalReset() {
	$('#timeInput').val('');
	$('#contentInput').val('');
	$("input:checkbox[id='reqInput']").prop("checked", false);
}	

// x버튼 클릭 시 해당 스케줄 data 삭제하기
function scheduleDel(calNo) {
	console.log("스케줄 삭제 실행");		
	$.ajax({
		url : "/board/schDel",
		type : "GET",
		data : {'calNo' : calNo},
		success : function(data) {
			if (data == "Y") {
				console.log("글삭제 성공");
				scheduleList();
				buildCalendar();
			} else
				console.log("글삭제 실패");
		},
		error : function() {
			alert("글삭제 실패");
		}
	});
}

	
	
	





