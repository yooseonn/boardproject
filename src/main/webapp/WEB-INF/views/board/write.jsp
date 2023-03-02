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
.form-control {
    border: 1px solid #999; border-radius: 4px; background-color: #fff;
    padding 5px 5px;
    fontFamily : "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    vertical-align: baseline;
}
.form-control [readonly] { background-color : #f8f9fa;}

textarea.form-control { height: 170px; resize :none; }


.tr,.th {
	width: 20px;
}

element.style {
    width: 80px;
}
.form-select {
 border: revert;
 border-radius: 3px;
}
.fw-semibold {
	color:#36C88A;
	font-weight: bold;
}
</style>

<script type="text/javascript">

function sendOk() {
    const f = document.BoardForm;
	str = f.subject.value.trim();
	if(!str) {
		alert("제목을 입력하세요 !");
		f.subject.focus();
		return;
	}

	str = f.content.value.trim();
	if(! str){
		alert("내용을 입력하세요. ");
		f.content.focus();
		return;
	}

	f.content.value = str;

	f.action = "/board/${mode}";


	f.submit();

	alert("게시글 작성 성공 !! ");
}
</script>

<script type="text/javascript">
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

//글 수정시, 첨부파일 삭제
<c:if test="${mode=='update'}">
function deleteFile(fileNum) {
	let url = "${pageContext.request.contextPath}/board/deleteFile";
	$.post(url, {fileNum:fileNum}, function(data){
		$("#f"+fileNum).remove();
	}, "json");
}
</c:if>
</script>

<div class="container">
	<div class="body-container">
		<h3 class="fw-semibold">게시글 작성</h3>
		<hr>

		<form name="BoardForm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>
							<input type="text" name="subject" value="${dto.subject}"
							${mode=="update" || mode=="answer" ? "readonly='readonly'":""}></td>
					</tr>
					<tr>
						<th scope="row" style="width: 300px;">작성자</th>
						<td>${sessionScope.loginMember.userName}</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
						 <textarea name="content" class="form-control"> </textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<input type="file" name="selectFile" multiple="multiple">
						</td>
					</tr>

					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr id="f${vo.fileNum}">
								<td class="table-light col-sm-2" scope="row">첨부된파일</td>
								<td>
									<p class="form-control-plaintext">
										<a href="javascript:deleteFile('${vo.fileNum}');"><i class="bi bi-trash"></i></a>
										${vo.originalFilename}
									</p>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<br>

			<table class="table table-borderless">
				<tr>
					<td class="text-center">
						<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;
						</button>
						<button type="button" class="btn btn-light"
								onclick="location.href='${pageContext.request.contextPath}/board/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;
						</button>

						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">

						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
