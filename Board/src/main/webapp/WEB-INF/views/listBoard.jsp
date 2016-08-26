<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<link rel='stylesheet'
	href='/resources/vendor/bootstrap/css/bootstrap.min.css'
	type='text/css' rel="stylesheet" />

<script type="text/javascript">
	function listAllPage() {
		location.href = "/board/listAll?cpage=1&rowPerPage=${rowPerPage}&searchType= &keyword= ";
	}
	$(function() {
		 $('#pageNum').on('change', function(){
			var rowPerPage = $('#pageNum option:selected').val();
			location.href = "/board/listAll?cpage=1&rowPerPage="+rowPerPage+"&searchType= &keyword= ";
		});
	})
</script>

<style type="text/css">
#searchBoard {
	margin: 150px 0 190px 0;
}
</style>
</head>
<body>
	<div class="row">
		<div id="searchBoard">
			<div class="col-lg-10 col-md-offset-1">
				<form action="search" method="post">
					<div class="col-lg-2">
						<select name="searchType" class="form-control" id="searchType">
							<option value="t">제목</option>
							<option value="tc">제목+내용</option>
							<option value="w">글쓴이</option>
						</select>
					</div>
					<div class="col-lg-3">
						<input type="text" name="keyword" id="keyword"
							class="form-control" placeholder="검색" value="${page.keyword }">
						<input type="hidden" name="cpage" value="1">
					</div>
					<div class="col-lg-1">
						<input type="submit" value="검색" class="btn btn-primary"><input type="hidden" name="rowPerPage" value="${rowPerPage }">
					</div>
				</form>

				<div class="col-lg-1">
					<c:if test="${page.keyword != ''}">
						<input type="button" value="전체보기" onclick="listAllPage()" class="btn btn-primary">
					</c:if>
				</div>


				<div class="col-lg-2 col-md-offset-2">
					<select name="pageNum" class="form-control" id="pageNum">
					<option value="5" >선택</option>
						<option value="5" >5</option>
						<option value="10">10</option>
						<option value="15">15</option>
					</select>
				</div>

				<div class="col-lg-1">
					<a href="/board/logout" class="btn btn-primary">로그아웃</a>
				</div>
			</div>
		</div>

		<br>

		<div class="col-lg-10 col-md-offset-1">
			<div class="panel panel-default">
				<table border="1" cellpadding="0" cellspacing="0"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<tr height="30" class="tdSpace">
						<td width="100" colspan="5">게시판</td>
					</tr>
					<tr height="30" class="tdSpace">
						<td width="50">번호</td>
						<td width="250">제목</td>
						<td width="100">작성자</td>
						<td width="180">날짜</td>
						<td width="50">조회수</td>
					</tr>

					<c:forEach var="list" items="${list}" varStatus="loop">
						<tr height="30" class="tdSpace">
							<c:if test="${list.b_flag == 0 }">
								<td width="50"><c:if test="${list.b_depth ==0 }">${list.b_num }</c:if></td>
								<td width="300"><c:forEach begin="1" end="${list.b_depth }"
										step="1">&nbsp;&nbsp;&nbsp;</c:forEach> 
			<a href="/board/ReadBoard?b_num=${list.b_num }&cpage=${page.cpage}&rowPerPage=${rowPerPage}">
			<c:if test="${list.b_depth !=0 }">ㄴ</c:if>${list.b_title }
			</a>
			</td>
								<td width="100">${list.m_id }</td>
								<td width="100"><fmt:formatDate value="${list.b_date }"
										type="both" /></td>
								<td width="50">${list.b_count }</td>
							</c:if>

							<c:if test="${list.b_flag != 0}">

								<td width="50"></td>
								<c:forEach begin="1" end="${list.b_depth }" step="1">&nbsp;&nbsp;&nbsp;</c:forEach>
								<td width="300">&nbsp;&nbsp;<c:if
										test="${list.b_depth !=0 }">ㄴ</c:if>삭제된 게시물 입니다.
								</td>
								<td width="100"></td>
								<td width="100"></td>
								<td width="50"></td>

							</c:if>

						</tr>

					</c:forEach>
				</table>
			</div>
		</div>


		<br>
		<div class="col-lg-1 col-md-offset-1">
			<a href="/board/insertBoard?rowPerPage=${rowPerPage }" class="btn btn-primary">글쓰기</a>
		</div>
		<div class="col-lg-3 col-md-offset-2"
			style="text-align: center; font-size: 20px">

			<c:if test="${page.preIcon != 1 }">
				<a
					href="/board/listAll?cpage=1&rowPerPage=${rowPerPage }&searchType=${page.searchType }&keyword=${page.keyword}">
					<< </a>
			</c:if>
			<c:if test="${page.preIcon != 1 }">
				<a
					href="/board/listAll?cpage=${page.startBlock-1 }&rowPerPage=${rowPerPage }&searchType=${page.searchType }&keyword=${page.keyword}">
					&nbsp;< </a>
			</c:if>

			<c:forEach var="perPage" begin="${page.startBlock }"
				end="${page.endBlock }" step="1">
				<a
					href="/board/listAll?cpage=${perPage }&rowPerPage=${rowPerPage }&searchType=${page.searchType }&keyword=${page.keyword}"
					class="paginate_button">&nbsp;${perPage }</a>
			</c:forEach>
			<c:if test="${page.nextIcon != 1 }">
				<a
					href="/board/listAll?cpage=${page.endBlock+1 }&rowPerPage=${rowPerPage }&searchType=${page.searchType }&keyword=${page.keyword}">
					&nbsp;> </a>
			</c:if>
			<c:if test="${page.nextIcon != 1 }">
				<a
					href="/board/listAll?cpage=${page.totalPage }&rowPerPage=${rowPerPage }&searchType=${page.searchType }&keyword=${page.keyword}">
					&nbsp;>> </a>
			</c:if>
		</div>

	</div>



</body>
</html>