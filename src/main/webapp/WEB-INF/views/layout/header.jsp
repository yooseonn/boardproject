\<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

 <div class="header-main">
   <nav class="main-nav navbar">
     <div class="d-flex justify-content-start" style="height:55px;">
       <ul class="main menu" style="padding-left">
         <li> <a class="navbar-brand" href=""<li><a class="navbar-brand" href="${pageContext.request.contextPath}/" style="padding-left: 0px"><img id="img-logo" src="${pageContext.request.contextPath}/resources/images/logo_color.png"></a></li>
       </ul>
       <ul class="main-menu">
         <li><a href="${pageContext.request.contextPath}/login/main" class="main-menu-a">로그인</a></li>
         <li><a href="${pageContext.request.contextPath}/community/main" class="main-menu-a">커뮤니티</a></li>
              <ul class="sub-menu" style="z-index: 100">
                  <li><a href="${pageContext.request.contextPath}" aria-label="submenu">전체 커뮤니티</a></li>
                  <li><a href="${pageContext.request.contextPath}" aria-label="submenu">부서별 커뮤니티</a></li>
              </ul>
         </li>

           <c:if test="${sessionScope.member.membership==99}">
               <li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" class="main-menu-a">관리자 메뉴</a><ul class="sub-menu" style="z-index: 100">
                 <ul class="sub-menu" style="z-index: 100">
                    <li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" aria-label="subemnu">공지사항 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/faqManage/list" aria-label="subemnu">자주하는 질문 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/qnaManage/list" aria-label="subemnu">1:1문의 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/board/list" aria-label="subemnu">게시글 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/eventManage/list" aria-label="subemnu">이벤트 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/memberManage/list" aria-label="subemnu">회원 관리</a></li>
                </ul>
              </li>
          </c:if>
                 <c:if test="${not empty sessionScope.member}">
                   <span class="login-menu-a" id="user-sort">${sessionScope.member.userName}</span>님
                   <a class="login-menu-a" style="padding-right: 14px;" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                   <a class="login-menu-a" href="${pageContext.request.contextPath}/">정보수정</a>
                 </c:if>

          </c:if>

                 </ul>
               </li>
       </ul>
     </div>
     </div>
   </nav>

 </div>
