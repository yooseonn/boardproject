<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">

.main-menu {
	float: center;
	position: relative;
}
.main-menu-a { padding-bottom: 20px; }
.main-menu-a {
  	font-size: 14px; color: #000; font-weight: 500;
  	text-align: center; text-decoration: none;
  	letter-spacing: 0.05em; display: block; padding: 12px 14px;
}
.main-menu > li > a:hover { color: #36C88A; }

.login-menu { font-size: 12px; font-weight: 500px; padding-right: 10%; cursor: pointer; }
.login-menu-a { text-decoration: none; color: #000; }
.login-menu-a:hover {
	color: #36C88A;
}
.main-nav {
	margin-bottom: -10px; padding-left: 10%;
	width: 100%; display: flex;
	position: relative;
}


</style>

<div class="header-main">
  <nav class="main-nav navbar">
       <p style="margin: 2px;">
           <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
               <span style="width: 200px; height: 70; position: relative; left: 0; top:20px; color: #2984ff; filter: mask(color=red) shadow(direction=135) chroma(color=red);font-style: italic; font-family: arial black; font-size: 30px; font-weight: bold;">MobileEntropy</span>
           </a>
       </p>
   </div>
   <div class="main-menu">
      <a href="${pageContext.request.contextPath}/board/list" class="main-menu-a">게시판</a>
    </div>
   <div class="login-menu">
       <div style="padding-top: 20px;  float: right;">
          <c:if test="${empty sessionScope.member}">
              <a href="${pageContext.request.contextPath}/member/login">로그인</a>
                   &nbsp;|&nbsp;
               <a href="${pageContext.request.contextPath}/member/member">회원가입</a>
          </c:if>
          <c:if test="${not empty sessionScope.member}">
               <span style="color:blue;">${sessionScope.member.userName}</span>님
                   &nbsp;|&nbsp;
               <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                   &nbsp;|&nbsp;
               <a href="${pageContext.request.contextPath}/member/">정보수정</a>
          </c:if>
       </div>
   </nav>
</div>
