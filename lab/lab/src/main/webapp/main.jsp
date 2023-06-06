<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="style.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>수강신청</title>
</head>

<body>
	<%@include file="user.jsp"%>
	<%if (session_id != null) {
	 	if (session_id.length()==7) { %>
	<%@include file="top.jsp"%>
	<% } else if (session_id.length() == 5) { %>
	<%@include file="top_prof.jsp"%>
	<% } }
	else { %>
	<%@include file="top.jsp"%>
	<% }%>


	<h2 class="mainTitle">ENROLL</h2>

	<script type="text/javascript">
		const cursor = document.querySelector(".cursor");
		var timeout;
		
		document.addEventListener("mousemove", (e) => {
			let x = e.pageX;
		let y = e.pageY;
		
		cursor.style.top = y + "px";
		cursor.style.left = x + "px";
		cursor.style.display = "block";
		
		function mouseStopped() {
			cursor.style.display = "none";
		}
		clearTimeOut(timeout);
		timeout = setTimeout(mouseStopped, 1000);
		});
		
		document.addEventListener("mouseout", () => {
			cursor.style.display = "none";
		});
		</script>

	<%-- 	
	<table width="75%" align="center" height="100%">
		<%if (session_id != null) {%>
		
		<tr>
			<td><br>
			<br>
			<br>
			<br>

			<br>
			<br>
			<br>
			<br>
			<b><%=session_id%>님 방문을 환영합니다.</b></td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td><br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<b class = "title"><%=log%></b></td>
		</tr>
		<% } %>
	</table> --%>
</body>
</html>