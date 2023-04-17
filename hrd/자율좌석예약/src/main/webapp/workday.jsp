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
<h2 align=center>부서별근무일수집계</h2>
<table border=1>
	<tr>
		<td>사원번호</td><td>이름</td><td>부서명</td><td>근무일수</td>
	</tr>


<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con =
		DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select re.empno, empname, deptcode, count(re.empno) " +
				"from resv re, tbl_emp em " +
				"where re.empno = em.empno " +
				"group by re.empno, empname, deptcode " +
				"order by re.empno ";
		PreparedStatement p = con.prepareStatement(sql);
		ResultSet rs = p.executeQuery();
		while(rs.next()){
			String hihi = rs.getString(3);
			switch (hihi){
				case "10":
					hihi = "영업팀";
					break;
				case "20":
					hihi = "총무팀";
					break;
				case "30":
					hihi = "구매팀";
					break;
			}
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=hihi%></td>
		<td><%=rs.getString(4) %></td>
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