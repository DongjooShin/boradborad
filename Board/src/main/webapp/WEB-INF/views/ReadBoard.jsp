<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script type="text/javascript">
	function goList() {

		location.href = "/board/listAll?cpage=${cpage}&searchType= &keyword= ";
	}

	function delBoard() {

		location.href = "/board/delBoard?cpage=${cpage}&b_num=${board.b_num }&b_group=${board.b_group}";
	}

	function ModifyBoard() {

		location.href = "/board/ModifyBoard?cpage=${cpage}&b_num=${board.b_num }";
	}
	
	
	
	function answer() {
		location.href = "/board/answerBoard?cpage=${cpage}&b_num=${board.b_num }";
	}

 
	
		function secondReply(r_num) {
		
		
		
		var replyBox = '<tr height="30">';
		replyBox += '<td colspan="4"><textarea rows="4" cols="85" name="r_text" style="width: 99%;"></textarea></td></tr>';
		replyBox += '<tr height="30" class="tdSpace"> <td colspan="4"><input type="submit" value="등록"></td> </tr>';
		
		$('#secondReply'+r_num).append(replyBox);
		
		
		$('#replyText'+r_num).text("댓글 취소");
		}
	 
	
</script>
</head>
<body>
	<h1>뷰페이지</h1>

	<div style="margin-left: 50px;">

		<table border="1" cellpadding="0" cellspacing="0"
			style="margin-bottom: 15px">
			<tr height="30" class="tdSpace">
				<td width="100">글번호</td>
				<td width="250">${board.b_num }</td>
				<td width="100">작성시간</td>
				<td width="200"><fmt:formatDate value="${board.b_date }"
						type="both" /></td>
			</tr>

			<tr height="30" class="tdSpace">
				<td width="100">제목</td>
				<td width="250">${board.b_title }</td>
				<td width="100">작성자</td>
				<td width="200">${board.m_id }
			</tr>
			<tr height="30" class="tdSpace">
				<td colspan="4">내용</td>

			</tr>
			<tr height="30" class="tdSpace">

				<td colspan="4"><textarea rows="20" cols="85" name="b_content"
						readonly="readonly" style="width: 99%;">${board.b_content }</textarea></td>
			</tr>
			<tr height="30" class="tdSpace">
				<td colspan="4"><input type="button" value="리스트"
					onclick="goList()"> <input type="button" value="답변" onclick="answer()">
					<c:if test="${userFlag==0}">
					<input type="button" value="수정"
					onclick="ModifyBoard()"> <input type="button" value="삭제"
					onclick="delBoard()"></c:if></td>
			</tr>

		</table>
		<table>
			<c:forEach var="reply" items="${reply }" varStatus="loop">

				<tr height="30">
					<td width="500" colspan="3">${reply.r_text }<a
						style="margin-left: 10px;" onclick="secondReply(${reply.r_num})"
						id="replyText${reply.r_num}" class="replyText">댓글 </a>
					</td>
					<td width="200" colspan="1"><fmt:formatDate
							value="${reply.r_date }" type="both" /></td>

				</tr>

				<tr>
					<td colspan="4"><div id="secondReply${reply.r_num}"></div></td>
				</tr>



			</c:forEach>
		</table>


		<form action="/board/insertReply" method="post">
			<input type="hidden" value="${board.b_num }" name="b_num">
			<table style="padding-bottom: 100px;">
				<tr height="30" class="tdSpace">
					<td colspan="4">댓글</td>

				</tr>


				<tr height="30" class="tdSpace">

					<td colspan="4"><textarea rows="7" cols="85" name="r_text"
							style="width: 99%;"></textarea></td>

				</tr>
				<tr height="30" class="tdSpace">
					<td colspan="4"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>