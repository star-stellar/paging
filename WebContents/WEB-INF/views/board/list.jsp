<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>


<input type="hidden" value="${category}" class="category">
<div class="container">
	<div class="jumbotron">
		<h1>게시판</h1>
	</div>
	
	<form class="form-inline searchForm">
		<div class="form-group">
			<select class="form-control category">
				<option value="">====전체====</option>
				<option value="notice" ${category=='notice' ? 'selected':''}>공지사항</option>
				<option value="free" ${category=='free' ? 'selected':''}>자유게시판</option>
			</select>
		</div>
		<div class="form-group">
		<select class="form-control" name="type">
			<option value="T" >제목</option>
			<option value="C" ${cri.type=='C' ? 'selected':''}>내용</option>
			<option value="W" ${cri.type=='W' ? 'selected':''}>작성자</option>
		</select>
		</div>
		<div class="form-group">
			<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
		</div>
		<button type="button" class="btn btn-primary">검색</button>
	</form>
	
	<table class="table">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="b">
		<tr>
			<td>${b.bno }</td>
			<td>${b.category }</td>
			<td>${b.title }</td>
			<td>${b.writer }</td>
			<td>${b.writeDate }</td>
		</tr>
		</c:forEach>
	</table>
	
	<ul class="pagination">
		<c:if test="${p.prev}">
		<li class="page-item">
			<a class="page-link" href="${p.startPage-1}">이전페이지</a>
		</li>
		</c:if>
		<c:forEach begin="${p.startPage}" end="${p.endPage }" var="pageNum">
		<li class="page-item ${cri.page == pageNum ? 'active':''}">
			<a class="page-link" href="${pageNum }">${pageNum }</a>
		</li>
		</c:forEach>
		<c:if test="${p.next}">
		<li class="page-item">
			<a class="page-link" href="${p.endPage+1 }">다음페이지</a>
		</li>
		</c:if>
	</ul>
	
</div>
<%@ include file="../layout/footer.jsp" %>


