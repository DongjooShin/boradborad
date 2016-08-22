<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function signUp() {
	
	location.href = "/member/memberSignUp";
	
}

</script>
<style type="text/css">
#loginForm{
	margin-left: 30%;
}

#loginForm input{
	margin: 10px;
	margin-right: 15px;
}

</style>
</head>

<body>
<h2>Login</h2>

	<div id="loginForm">
		<form action="/member/login" method="post">
		
		<label>아 이 디 </label><input type="text" name = id size="30"><br>
		<label>비밀번호</label><input type="password" name = pw size="30"><br>
		<input type="submit" value="로그인"><input type="button" value="취소"><input type="button" value="회원가입" onclick="signUp()">
		
		
		</form>
	
	</div>
</body>
</html>