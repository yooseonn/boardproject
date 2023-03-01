<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">

  .body-container {
    min-height: 900px;
    margin: auto;
    margin-top: 100px;
  }
</style>

<script type="text/javascript">

  function sendLogin() {
    const f = document.loginForm;
    let str;

    str = f.userId.value.trim();
    if(!str) {
      f.userId.focus();
      return;
    }
    str = f.userPwd.value.trim();
    if(!str) {
      f.userPwd.focus();
      return;
    }
    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();


  }
</script>

<div class="container">
  <div class="body-container">

    <div class="row d-flex justify-content-center">
      <div class="col-md-6">
        <div class="p-3">
          <form name ="loginForm" method="post" class="row g-3" style="width: 400px; margin: auto;">
            <h3 class="fw-semibold">로그인</h3>
            <div class="col-12">
              <label class="mb-1 fs-6">아이디</label>
              <input type="text" name="userId" class="form-control" placeholder="아이디">
            </div>
            <div class="col-12">
              <label class="mb-1 fs-6">패스워드</label>
              <input type="password" name="userPwd" class="form-control" autocomplete="off"
                     placeholder="패스워드">
            </div>
            <div class="col-12">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="rememberMe">
                <label class="form-check-label" for="rememberMe" style="font-size: 14px;"> 아이디 저장</label>
                <div style="float: right">
                  <a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-2 text-right" style="font-size: 14px;">아이디 찾기</a>
                  <a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2 text-right" style="font-size: 14px;">패스워드 찾기</a>
                  <a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none text-right" style="font-size: 14px;">회원가입</a>
                </div>
              </div>
            </div>
            <div class="col-12">
              <button type="button" class="btn btn-primary" onclick="sendLogin();" style="width: 100%;">
                &nbsp;로그인&nbsp;
              </button>
            </div>
          </form>
        </div>

        <div class="d-grid">
          <p class="form-control-plaintext text-center text-primary">${message}</p>
        </div>

      </div>
    </div>

  </div>
</div>