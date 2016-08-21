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
	$('#idCheckLabel').css('display','block');
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
			success : function(id){
				//return 값이 0이면 중복되는 아이디 없음
				if(id == 0){
					$('.idCheckLabel').css('display','none');
					$('#UseId').css('display','block');
					$('#idCheck').val(1);
				}
				else{
					$('.idCheckLabel').css('display','none');
					$('#notUseId').css('display','block');
					$('#idCheck').val(0);
				}
			},
			error : function(){
				alert("에러!");
			}
			
		});
	
	});
	
	$('#m_pw_check').on('change', function () {
		
		if($('#m_pw_check').val() == $('#m_pw').val()){
			$('.passwordCheckLabel').css('display','none');
			$('#samePassword').css('display','block');
			
		}
		else{
			$('.passwordCheckLabel').css('display','none');
			$('#unSamePassword').css('display','block');
			
			 
		}
		
		
	});
	
	
	
	
	
	
})


function checkIdFuc() {
	if($('#idCheck').val() == 0 ){
		alert("아이디 중복 확인을 해주세요");
		return false;
	}
	if($('#m_pw_check').val() != $('#m_pw').val()){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
	}
	
	if($('#m_pw').val() == "" ){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if($('#m_pw_check').val() == "" ){
		alert("비밀번호 확인을 입력하세요.");
		return false;
	}
	
	if($('#m_name').val() == "" ){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if($('#m_email').val() == "" ){
		alert("이메일을 입력하세요.");
		return false;
	}
	
	
	
}
	
	
	



</script>
<style type="text/css">

.idCheckLabel{

display: none;
font-weight: bold;
}

#UseId{
 color: blue;
}

#notUseId{
 color: red;
}


.passwordCheckLabel{
display: none;
font-weight: bold;
}

#unSamePassword{
color: red;
}

#samePassword{
color: blue;
}


</style>
</head>
<body>

	<br><br>
	<h2>SignUp</h2>
	
	<br><br>
	
	
	<div>
		<form action="/member/memberSignUp" method="post" name="signUp" onsubmit="return checkIdFuc()">	
			<input type="text" id="idCheck" value="0">
			<p>아이디</p><input type="text" name="m_id" id="m_id">	
			<input type="button" value="중복확인" id="id_Check"> 
			
			<label id="idCheckLabel" class="idCheckLabel">중복확인을 해주세요.</label>
			<label id="notUseId" class="idCheckLabel">중복된 아이디 입니다. 다시 입력해 주세요.</label>
			<label id="UseId" class="idCheckLabel">사용가능한 아이디 입니다.</label>
			
			
			<p>비밀번호</p><input type="text" name="m_pw" id="m_pw">
			<p>비밀번호확인</p><input type="text" id="m_pw_check">
			<label id="unSamePassword" class="passwordCheckLabel">패스워드가 일치하지 않습니다.</label>
			<label id="samePassword" class="passwordCheckLabel">패스워드가 일치합니다.</label>
			
			<p>이름</p><input type="text" name="m_name">
			<p>이메일</p><input type="text" name="m_email">		
		
			<br>
			<input type="submit" value="확인">
		</form>
	
	
	
	</div>
	<br><br>

</body>
</html>