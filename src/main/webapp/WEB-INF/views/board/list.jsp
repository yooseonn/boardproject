<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
.body-container {
	max-width: 800px;
	min-height: 900px;
	margin: auto;
	margin-top: 100px;
}
.title1 {height: 50px; width: 150px; font-size: 30px;}

.row {
	height: 100px;
	width: 160px;
}
.table1 {float: left; width: 300px; text-align: left;}
.table2 {width: 800px; text-align: left;}
.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {
	font-weight: bold;
	color: #36C88A;
	font-size: 20px;
	height: 10px;
	margin-bottom: 10px;
	}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }
.division {
	margin-top: 20px;
	margin-left: 52px;
	border-width: 2px;
	background-color:black;
	background: black;
}
.pagination {
	--bs-pagination-hover-bg: #36C88A;
	--bs-pagination-focus-bg: #36C88A;
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}
.page-navigation {
	margin-top:20px;
	margin-bottom: 50px;
	text-align: center;
}
.form-select {
	border: solid 0.5px;
	border-color: #C2C2C2;
	border-radius: 3px;
	width: 160px;
}
.btn {width: 80px;}
#mainButton {width: 140px;}
.btn-outline-secondary {
	--bs-btn-hover-bg:#ffffff;
	--bs-btn-hover-color: black;
	--bs-btn-active-bg: #ffffff;
	--bs-btn-active-color: black;
}
#searchComm { width: 160px; }
#condition { width: 90px; }
#board { margin: 10px; }
.typeSelectorLarge { width: 170px; float: left; }
.typeSelectorSmall { width: 170px; float: left}
.typeSelectorForm {margin-left: 20px;}
.semiTitle {margin-left: 25px; font-weight: bold; color: #4A4A4A; }
#mainButton { margin-left: 260px; }
.searchButton {
	width: 100px;
	float:left;
	margin-left: 20px;
}
.searchCondition {
	 width: 100px;
	 margin-left: 25px;
	 float:left;
 }
.searchInput {
	float:left;
	width: 150px;
}
.backMain { width: 200px; display: inline-block;}
</style>

<script type="text/javascript">

function searchCondtion() {
	const f = document.searchForm;
	f.submit();
}

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}

			console.log(jqXHR.responseText);
		}
	});
}

</script>

<div class="container">
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">게시판 </h3>

			<hr class="division">
			<div class="container text-center" id="board" style="margin-left: 28px;">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col" style=" max-width: 300px;" >제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${dto.num}</th>
								<td style=" max-width: 340px; ">
										<a href="${articleUrl}&num=${dto.num}" style="color:black; text-decoration: none; max-width: 260px; display: block; ">
											<span style="max-width: 260px;  display: block; text-overflow: ellipsis; white-space: nowrap; overflow:hidden; float: left;">${dto.subject}</span>
										</a>
								</td>
								<td>${dto.userId}</td>
								<td>${dto.regDate}</td>
								<td>${dto.hitCount}</td>
							</tr>
						</c:forEach>
						<li><div id="zero">${count == 0 ? " 등록된 게시글이 없습니다. " : ""}</div></li>
					</tbody>
				</table>
			</div>


					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/write';" style="margin-left: 740px;">글 작성</button>





			<br>


			<div class="search">
				<form name="searchForm" action="${pageContext.request.contextPath}/board/list" method="post">
					<div class="searchCondition" style="margin-left: 220px; margin-bottom: 20px;">
						<select class="form-select" id="condition" name="condition">
								<option selected value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
						</select>
					</div>
					<div class="searchInput">
						<input type="text" class="form-control" id="searchComm"  name="keyword" value="${keyword}" >
					</div>
					<div class="searchButton">
						<button type="button" class="btn btn-primary" onclick="searchCondtion()">검색</button>
					</div>
				</form>
			</div>
			<br>

		</div>
	</div>


</div>