<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
int nTotalCourse = 0;
int nTotalUnit = 0;
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<title>수강신청 조회</title>
</head>
<body>
    <%@ include file="top.jsp"%>
    <%@ include file="user.jsp"%>
    <%
    
    if (session_id == null || session_id.isEmpty()) { // session_id가 null이거나 비어있을 경우 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
    } else {
      
        
        // 데이터베이스 연결 정보
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "leebk"; // 데이터베이스 사용자 이름에 맞게 변경해야 합니다.
        String password = "1124"; // 데이터베이스 비밀번호에 맞게 변경해야 합니다.
        
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            
            String query = "SELECT c_id, c_id_no, c_name, t_semester, t_time, t_loc, is_repeat "
                    + "FROM course "
                    + "JOIN teach ON course.c_id = teach.c_id AND course.c_id_no = teach.c_id_no "
                    + "JOIN enroll ON course.c_id = enroll.c_id AND course.c_id_no = enroll.c_id_no "
                    + "WHERE enroll.s_id = '" + session_id + "'";
            ResultSet resultSet = statement.executeQuery(query);
            
            %>
            <br>
            <br>
            <br>
            <table width="70%" align="center" border>
                <br>
                <tr>
                    <th>과목번호</th>
                    <th>분반</th>
                    <th>과목명</th>
                   
                    <th>학기</th>
                    <th>요일</th>
                    <th>시간</th>
                </tr>
            <%   
            while (resultSet.next()) {
                String c_id = resultSet.getString("c_id");
                int c_id_no = resultSet.getInt("c_id_no");
                String c_name = resultSet.getString("c_name");
             
                int t_semester = resultSet.getInt("t_semester");
                String t_time = resultSet.getString("t_time");
                String t_loc = resultSet.getString("t_loc");
                
                %>
                <tr>
                    <td><%=c_id%></td>
                    <td><%=c_id_no%></td>
                    <td><%=c_name%></td>
                    
                    <td><%=t_semester%></td>
                    <td><%=t_time%></td>
                    <td><%=t_loc%></td>
                </tr>
                <%
                nTotalCourse++;
                nTotalUnit += 3; // 가정: 모든 과목은 3학점
            }
            
            resultSet.close();
            statement.close();
            connection.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
    
    <div id="CountInfo" align="center" style="font-weight: bold;">
        수강신청한 강의 수 : <%=nTotalCourse%>개 &nbsp;&nbsp;&nbsp; 누적 학점 수 : <%=nTotalUnit%>학점
    </div>
    
</table>
</body>
</html>