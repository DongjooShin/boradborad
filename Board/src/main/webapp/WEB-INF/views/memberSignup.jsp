<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

$(function() {
	$('#id_Check').on('click', function () {

		var insertId = $('#m_id').val();
		
		if(insertId ==""){
			alert("아이디를 입력하세요")
			return;
		}
		
		$.ajax({
	
			url:'/member/idCheck',
			type:'post',
			data :{
				"id" : insertId
			},
			success : function(a){
				alert(a);
			},
			error : function(){
				alert("에러!");
			}
			
		});
	
	});
	
})
	
	
	



</script>

</head>
<body>

	<br><br>
	<h2>SignUp</h2>
	
	<br><br>
	
	
	<div>
		<form action="/member/memberSignUp" method="post" name="signUp">	
			<input type="hidden" id="idCheck" value="0">
			<p>아이디</p><input type="text" name="m_id" id="m_id">	
			<input type="button" value="중복확인" id="id_Check"> <label id="" >중복확인을 해주세요</label>
			<p>비밀번호</p><input type="text" name="m_pw" id="m_pw">
			<p>비밀번호확인</p><input type="text" id="m_pw_check">
			<p>이름</p><input type="text" name="m_name">
			<p>이메일</p><input type="text" name="m_email">		
		
			<br>
			<input type="submit" value="확인">
		</form>
	
	
	
	</div>
	<br><br>

</body>
</html>