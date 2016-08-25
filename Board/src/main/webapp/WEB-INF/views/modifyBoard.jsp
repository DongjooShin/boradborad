<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function cancel() {
	
	location.href="/board/ReadBoard?b_num=${board.b_num }&cpage=${cpage}";
}

</script>
</head>
<body>
	<h1>수정 페이지</h1>
	<form action="/board/ModifyBoard?cpage=${cpage}" method="post">
		<input type="hidden" name="b_num" value="${board.b_num }">
		
		<div style="margin-left: 50px;">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr height="30" class="tdSpace">
					<td width="100">글번호</td>
					<td width="250">${board.b_num }</td>
					<td width="100">작성시간</td>
					<td width="200"><fmt:formatDate value="${board.b_date }"
							type="both" /></td>
				</tr>

				<tr height="30" class="tdSpace">
					<td width="100">제목</td>
					<td width="250"><input type="text" size="40" name="b_title"
						value="${board.b_title }"></td>
					<td width="100">작성자</td>
					<td width="200">${board.m_id }
				</tr>
				<tr height="30" class="tdSpace">
					<td colspan="4">내용</td>

				</tr>
				<tr height="30" class="tdSpace">

					<td colspan="4"><textarea rows="20" cols="85" name="b_content"
							style="width: 99%;">${board.b_content }</textarea></td>
				</tr>
				
					<tr>
				<td colspan="1">첨부파일</td>
				<td colspan="3">
						<c:forEach var="row" items="${boardAtta }">
							<a name="file" href="/board/download?atta_id=${row.atta_id }">${row.atta_name }</a>
							<label>(${row.atta_size })KB</label>
							<br>
						</c:forEach>
					
				</td>
			</tr>
				<tr height="30" class="tdSpace">
					<td colspan="4"><input type="submit" value="확인">

						<input type="button" value="취소" onclick="cancel()"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>