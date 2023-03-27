<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>오디션 등록</h2>
	<form method="post" action = "action1.jsp" name="frm">
		<table border = 1>
			<tr>
				<td>참가번호</td>
				<td style ="text-align: left"><input type="text" name = "artist_id">*참가번호는(A000)4자리입니다.</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td style ="text-align: left"><input type="text" name = "artist_name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td style ="text-align: left">
					<input type="text" name = "date1">년
					<input type="text" name = "date2">월
					<input type="text" name = "date3">일
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio"	value= "M" name = "gender" checked>남성
					<input type="radio"	value= "F" name = "gender">여성
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name = "talent">
						<option value=0>특기</option>
						<option value=1>보컬</option>
						<option value=2>댄스</option>
						<option value=3>랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td style ="text-align: left"><input type="text" name = "agency"></td>
			</tr>
			<tr>
				<td colspan=2 align="left">
					<input type="button" value = "오디션 등록" onclick = "insertCheck()">&nbsp;
					<input type="button" value="다시쓰기" onclick = "res()">
				</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>