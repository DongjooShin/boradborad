<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function login() {
	
}
function signUp() {
	location.href = "/member/memberSignUp";
}
function showList() {
	location.href = "/board/listAll?cpage=1&searchType= &keyword= ";
}


</script>
</head>
<body>


<h1>DASH  BOARD</h1>

<input type="button" value="로그인" onclick="login()">
<br><br>
<input type="button" value="회원가입" onclick="signUp()">
<br><br>
<input type="button" value="게시판 목록보기" onclick="showList()">
<br><br><br><br><br>
</body>
</html>