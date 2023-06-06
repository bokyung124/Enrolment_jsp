<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>수강신청 입력</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%@include file="user.jsp"%>
	<%@ include file="top.jsp"%>
	<br>
	<% if (session_id == null) response.sendRedirect("login.jsp"); %>
	<br>
	<b><div id="semesterInfo"></div></b>
	<%
   String driver = "oracle.jdbc.driver.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String user = "kimminjoo";
   String password = "1234";
   Connection myConn = null;
   Statement stmt = null;
   PreparedStatement pstmt = null;
   String mySQL = "";
   String majorSQL = "";
   String loginMajor = "";
   ResultSet myResultSet = null;
   ResultSet majorResultSet = null;
   int currentTab = 0;
   int sem = 0; 
   try{
      Class.forName(driver);
      myConn = DriverManager.getConnection(url, user, password);
      myConn.setAutoCommit(false);
      stmt = myConn.createStatement();
      pstmt = myConn.prepareStatement //테이블 출력 pstmt
            ("select c.c_id, c.c_id_no, c_name, c_unit, c_major, t_time, t.p_id, t_loc, t_max" 
      + " from course c, teach t where c.c_id = t.c_id and c.c_id_no = t.c_id_no"
      + " and t_semester = ? and (c.c_id, c.c_id_no) not in(select c_id, c_id_no from enroll where s_id = ?) and c_major LIKE ?");
     System.out.println(pstmt+"💙💙💙💙💙💙💙");
   }catch(ClassNotFoundException e){
      System.out.println("jdbc driver 로딩 실패");
   }catch(SQLException e){
      System.out.println("오라클 연결 실패");
   }
   //현 학기에 해당하는 과목만 보여주기
   CallableStatement cstmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}"); //stored function 이용
   cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
   CallableStatement cstmt2 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
   cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
   try{
      cstmt.execute();
      cstmt2.execute();
      int nYear = cstmt.getInt(1);
      int nSemester = cstmt2.getInt(1);
       sem = nYear * 10 + nSemester; 
       System.out.println(sem);
      %><script>document.getElementById('semesterInfo').innerHTML = "<%=nYear%>년  <%=nSemester%>학기";</script>
	<%
   }catch(SQLException e){
      System.err.println("SQLException: " + e.getMessage());
   }finally{
      if(cstmt != null)
         try{myConn.commit(); cstmt.close();
         }catch(SQLException e){System.err.println("SQLException: " + e.getMessage());}
   }
   //login 사용자의 전공
   majorSQL = "select s_major from student where s_id = '" + session_id + "'";
   majorResultSet = stmt.executeQuery(majorSQL);
   if(majorResultSet.next()){
      loginMajor = majorResultSet.getString(1);   
      System.out.println(loginMajor);
   }%>
	<div class="tab_menu_container" align="center">
		<br>
		<button class="menu_btn">전체</button>
		<button class="menu_btn">전공</button>
		<button class="menu_btn">교양</button>
		<button class="menu_btn">타전공</button>
	</div>
	<br>
	<% for(int i = 0; i < 4; i++){%>
	<%
         String indexName = "box_" + i;%>
	<table width="70%" align="center" class="tab_box" id="<%=indexName%>"
		border>
		
		<%if(i == 0){
            pstmt.setInt(1, sem); 
            pstmt.setString(2, session_id); 
            pstmt.setString(3, "%");
         }
         else if(i == 1){
            pstmt.setInt(1, sem); 
            pstmt.setString(2, session_id);
            
            pstmt.setString(3, loginMajor);   

         }
         else if(i == 2){
            pstmt.setInt(1, sem); 
            pstmt.setString(2, session_id); 
            pstmt.setString(3, "교양");   

         }
         else if(i == 3){
            pstmt.setInt(1, sem); 
            pstmt.setString(2, session_id); 
            pstmt.setString(3, "%");   
         }
         %>
		<tr>
			<th>과목번호</th>
			<th>분반</th>
			<th>과목명</th>
			<th>학점</th>
			<th>주관학과</th>
			<th>시간</th>
			<th>교수</th>
			<th>강의실</th>
			<th>정원</th>
			<th>수강신청</th>
		</tr>
		
		<% myResultSet = pstmt.executeQuery();
		System.out.println("😊😊😊😊😊😊😊😊");
		System.out.println(myResultSet);
         if(myResultSet != null){
        	 System.out.println("slsllslslsllslslls");
        	 if(myResultSet.next() == false ){
        		 System.out.println("33333");
        	 }
            while(myResultSet.next()){

           	 System.out.println("qpqpqpqpqpqpqpqpqpqpqpqppq");
               String c_id = myResultSet.getString(1);
               System.out.println(c_id);
               int c_id_no = myResultSet.getInt(2);
               String c_name = myResultSet.getString(3);
               int c_unit = myResultSet.getInt(4);
               String c_major = myResultSet.getString(5);
               int t_time = myResultSet.getInt(6);
               String p_id = myResultSet.getString(7);
               String t_loc = myResultSet.getString(8);
               int t_max = myResultSet.getInt(9);
               if(i==3){
                  if(c_major.equals(loginMajor) || c_major.equals("교양"))  
                	  continue;
               }%>
			<tr>
			<td><%=myResultSet.getString(1) %></td>
			<td><%=c_id_no %></td>
			<td><%=c_name %></td>
			<td><%=c_unit %></td>
			<td><%=c_major %></td>
			<td><%=t_time %></td>
			<td><%=p_id %></td>
			<td><%=t_loc %></td>
			<td><%=t_max %></td>
			<td><a id="Wcolor"
				href="insert_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">신청</a></td>
		</tr>
		<%}
         }%>
	</table>
	<%}%>

	<%
   pstmt.close();
   stmt.close();
   myConn.close();
%>
	<script>
   $('.tab_box').hide();
   $('#box_0').show();
   $('.menu_btn').on('click', function(){
      $('.menu_btn').removeClass('on');
      $(this).addClass('on')
      var idx = $('.menu_btn').index(this);
      $('.tab_box').hide();
      $('#box_' + idx).show();
   });
</script>
</body>

</html>