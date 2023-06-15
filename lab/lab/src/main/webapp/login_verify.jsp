<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");

Connection myConn = null;
Statement stmt = null;
String mySQL = null;
ResultSet rs = null;

String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "leebk";
String passwd = "1124";
String dbdriver = "oracle.jdbc.driver.OracleDriver";


Class.forName(dbdriver);
myConn=DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

if(userID.length() == 7) {
	mySQL="select s_id from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
}
else if(userID.length() == 5) {
	mySQL="select p_id from professor where p_id='" + userID + "' and p_pwd='" + userPassword + "'";
}

rs = stmt.executeQuery(mySQL);

if(rs.next()){
	session.setAttribute("user", userID);
	response.sendRedirect("main.jsp");
}
else{
	response.sendRedirect("login.jsp"); 
}


stmt.close();
myConn.close();
%>
