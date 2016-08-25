<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#changeLetter1 {
	color: red;
	font-weight: bold;
	font-size: 13px;
}

#changeLetter2 {
	color: red;
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 13px;
}
</style>
</head>

<body>
<h2>Login</h2>

	<div id="loginForm">
		<form action="/member/login" method="post">
		
		<label>아 이 디 </label><input type="text" name = id size="30"><br>
		<label>비밀번호</label><input type="password" name = pw size="30"><br>
			<c:if test="${loginFlag ==0}">
 				<p id="changeLetter1">아이디 또는 비밀번호를 다시 확인하세요.</p>
				<p id="changeLetter2">등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못입력하셨습니다.</p>

			</c:if>
		<input type="submit" value="로그인"><input type="button" value="취소">
		<input type="button" value="회원가입" onclick="signUp()">
		
		
		</form>
	
	</div>
</body>
</html>