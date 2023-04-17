<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
	//resv, resvno, empno, resvdate, seatno
	request.setCharacterEncoding("UTF-8");
	String empno = request.getParameter("empno");
	System.out.println(empno);
%>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2 align=center>사원번호 : <%=empno %>님의 좌석예약 조회</h2>
<table border=1>
	<tr>
		<td>사원번호</td><td>이름</td><td>근무일자</td><td>좌석번호</td><td>좌석위치</td><td>내선번호</td>
	</tr>


<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con =
		DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select re.empno, empname, resvdate, re.seatno, office, callno " +
				"from resv re, tbl_emp em, tbl_seat se " +
				"where re.empno = ? " +
				"and re.seatno = se.seatno " +
				"and re.empno = em.empno";
		PreparedStatement p = con.prepareStatement(sql);
		p.setString(1, empno);
		ResultSet rs = p.executeQuery();
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
<%
		}
	}
	catch(Exception e){
		e.printStackTrace();	
	}
	
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>