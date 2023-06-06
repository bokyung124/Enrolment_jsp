<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>login</title>
</head>
<body class = "loginDiv">
	<br>
	<br>
	<h1 class = "title">SIGN IN</h1>
		<div class="login-form">
		  <form method="post" action="login_verify.jsp">
			<input type="text" name="userID" class="text-field" placeholder="ID">
			<input type="password" name="userPassword" class="text-field" placeholder="Password">
			<input type="submit" value="로그인" class="submit-btn">
			<input type="button" value="취소" class = "back-btn" onclick="location.href='main.jsp'">
		  </form>

</body>
</html>