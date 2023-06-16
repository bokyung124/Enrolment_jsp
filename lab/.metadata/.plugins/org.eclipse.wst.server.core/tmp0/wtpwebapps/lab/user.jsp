<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="style.css?after" rel="stylesheet" type="text/css">
</head>
</html>

<br>
<br>

<br><div><a class = "clover" href="main.jsp">🍀</a></div>
<table class="top" width="500px" align="right">
	<tr>
		<td>
			<% String session_id = (String) session.getAttribute("user");
		if (session_id == null) {%>
			<p>로그인을 해주세요.</p> <%} else {%>
			<p><%=session_id%>님 방문을 환영합니다.
			</p>
		</td>
		<td>
			<% if (session_id.length() == 7) {%> <a href="update.jsp">마이페이지</a> <%} else if (session_id.length() == 5) {%>
			<a href="update_prof.jsp">마이페이지</a> <% }
				else { %>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> <%} %> <%}%>
		</td>
		<td>
			<% String log;
			if (session_id == null)
			log = "<a href=login.jsp>로그인</a>";
			else log = "<a href=logout.jsp>로그아웃</a>"; %>
			<p class="title"><%=log%></p>
		</td>

		<td></td>
	</tr>
</table>


