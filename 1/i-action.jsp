<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Statement stmt = null;
String mode = request.getParameter("mode");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("custno");
String city = request.getParameter("city");
try{
		
		String sql = "INSERT INTO tb1_member_202205 VALUES(?,?,?,?,TO_DATE(?,'yyyy-mm-dd'),?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,custno);
		pstmt.setString(2,custname);
		pstmt.setString(3,phone);
		pstmt.setString(4,address);
		pstmt.setString(5,joindate);
		pstmt.setString(6,grade);
		pstmt.setString(7,city);
		
		pstmt.executeUpdate(); //update수 return 가능
}
catch(Exception e){
		e.printStackTrace();
}
%>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>