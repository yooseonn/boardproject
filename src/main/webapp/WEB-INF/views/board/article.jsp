<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
.body-title {
  font-size:20px;
  font-weight : bold;
  padding: 13px 0;

  }

 .category-title {
  font-size: 15px;
  color: #BDBDBD; }

.title {
	color:#36C88A;
	font-weight: bold;
}
.subjectTitle {
	font-weight: bold;
}

.articleWriterCircle {display: inline; color: #36C88A;}

.btn-outline-secondary {
	    --bs-btn-hover-bg: #18bd77;
	    --bs-btn-active-bg: #18bd77;
	    --bs-btn-active-border-color: #18bd77;
}

.articleWriterCircle {display: inline; color: #36C88A;}

.row reply-writer {
	height: 20px;
}

.image image_resized {
  max-width: 100%;
  height: auto;
  display: block;
}

.badge{
	width: 50px;
	height: 28px;
 	font-size: 15px;
    margin-left: 427px;
    margin-top: 10px;
    font-weight: 400;
    cursor : pointer;}

.readDto {
	text-decoration: none;
	color:black;
}


</style>

<script type="text/javascript">
<c:if test="${sessionScope.loginMember.userId==dto.userId}">

function deleteOk(num) {
    if(confirm("글을 삭제 하시겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/board/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

<script type="text/javascript">
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
				alert("요청 처리가 실패 했습니다.");
				return false;
			}

			console.log(jqXHR.responseText);
		}
	});
}

</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3 class="title"> 게시판 </h3>
		</div>

		<div class="body-main">
 			<hr style="border: 0; height: 2px; background: black; margin-bottom: 0px;">
			<table class="table mb-0">
				<thead>
					<tr>
						<td class="subjectTitle" colspan="2" align="center">
						 ${dto.subject}
						</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td width="50%">
							<h4 class="articleWriterCircle">●&nbsp;</h4>${dto.userId}
						</td>
						<td colspan="2" width="50%" style="text-align: right;">
						    <p style="display: inline; color: #696969; ">작성일자 </p><p style="display: inline; font-weight: 500;">${dto.regDate}</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="display: inline; color: #696969;">조회</p> <p style="display: inline; font-weight: 500;">${dto.hitCount}</p>
						</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200" style="max-width: 500px; overflow-wrap: anywhere; border-bottom: none;" id="ckEditor">
							${dto.content}
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center p-3">
							 <button type="button" class="btn btnSendBoardLike" title="좋아요" style="border-color: #A3A6AD">
							 	<i class="bi ${userBoardLiked ? 'bi-heart-fill':'bi-heart' }" style="color: ${userBoardLiked ? '#FF4F99':'#A3A6AD' }"></i>&nbsp;
							 	<span id="BoardLikeCount" style="color: #A3A6AD">${boardlikeCount}</span>
							 </button>
						</td>
					<tr>
						<td colspan="2" >
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a class="readDto" href="${pageContext.request.contextPath}/board/article?${query}&num=${preReadDto.num}" >${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-decoration: none;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a class="readDto" href="${pageContext.request.contextPath}/board/article?${query}&num=${nextReadDto.num}" >${nextReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-borderless">
				<tr>
					<td width="50%">

							<c:if test="${sessionScope.loginMember.userId==dto.userId}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/update?num=${dto.num}&page=${page}&size=${size}';">수정</button>
							</c:if>

				    			<button type="button" class="btn btn-light" onclick="deleteOk(${dto.num});">삭제</button>

					</td>
					<td class="text-end">
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/list?${query}';">목록</button>
					</td>
				</tr>
			</table>

			<!-- 댓글 -->
			<div class="reply">
				<form name="replyForm" method="post">
					<div id="listReply"></div>

					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-primary btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>

