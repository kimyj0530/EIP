function check(){
	if(frm.resvno.value.length==0){
		alert("예약번호 X");
		frm.resvno.focus;
		return false;
	} else if(frm.empno.value.length==0){
		alert("사원번호 X");
		frm.empno.focus();
		return false;
	} else if(frm.resvdate.value.length==0){
		alert("사원번호 X");
		frm.resvdate.focus();
		return false;
	} else if(frm.seatno.value.length==0){
		alert("좌석번호 X");
		frm.seatno.focus();
		return false;
	} else{
		alert("완료");
		document.frm.submit();
		return true;
	}
}

function listcheck(){
	if(frm2.empno.value.length==0){
		alert("사원번호 X");
		frm2.empno.focus;
		return false;
	} else{
		alert("완료");
		frm2.submit();
	}
	
}

function res(){
	alert("초기화");
	document.frm.reset();
}