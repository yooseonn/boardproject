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
        max-width: 600px;
        margin: auto;
    }
    #selectEmail {
        width: 140px;
    }
    .col-form-label { margin-top: 10px; }
</style>

<script type="text/javascript">

    function memberOk() {
        const f = document.memberSubmit;
        let str;
        str = f.userId.value;
        if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) {
            alert("아이디를 다시 입력 하세요. ");
            f.userId.focus();
            return;
        }
        let mode = "${mode}";
        if(mode === "member" && f.userIdValid.value === "false") {
            str = "아이디 중복 검사가 실행되지 않았습니다.";
            $("#userId").parent().find(".help-block").html(str);
            f.userId.focus();
            return;
        }

        str = f.userPwd.value;
        if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) {
            alert("패스워드는 하나 이상의 숫자와 문자가 포함되어야 합니다. ");
            f.userPwd.focus();
            return;
        }
        if( str !== f.userPwd2.value ) {
            alert("패스워드가 일치하지 않습니다. ");
            f.userPwd.focus();
            return;
        }

        str = f.userName.value;
        if( !/^[가-힣]{2,5}$/.test(str) ) {
            alert("이름을 다시 입력하세요. ");
            f.userName.focus();
            return;
        }

        str = f.email1.value.trim();
        if( !str ) {
            alert("이메일을 입력하세요. ");
            f.email1.focus();
            return;
        }
        str = f.email2.value.trim();
        if( !str ) {
            alert("이메일을 입력하세요. ");
            f.email2.focus();
            return;
        }
        f.action = "${pageContext.request.contextPath}/member/${mode}";
        f.submit();
    }

    function changeEmail() {
        // 이메일 설정
        const f = document.memberSubmit;

        let str = f.selectEmail.value;
        if(str !== "direct") {
            f.email2.value = str;
            f.email2.readOnly = true;
            f.email1.focus();
        }
        else {
            f.email2.value = "";
            f.email2.readOnly = false;
            f.email1.focus();
        }
    }

    function userIdCheck() {
        // 아이디 중복 검사
        let userId = $("#userId").val();
        if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) {
            var str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
            $("#userId").focus();
            $("#userId").parent().find(".help-block").html(str);
            return;
        }

        let url = "${pageContext.request.contextPath}/member/userIdCheck";
        let query = "userId=" + userId;
        $.ajax({
            type:"POST"
            ,url:url
            ,data:query
            ,dataType:"json"
            ,success:function(data) {
                let passed = data.passed;
                if(passed === "true") {
                    let str = "<span style='color:blue; font-weight: bold;'>" + userId + "</span> 아이디는 사용가능 합니다.";
                    $(".userId-box").find(".help-block").html(str);
                    $("#userIdValid").val("true");
                } else {
                    let str = "<span style='color:red; font-weight: bold;'>" + userId + "</span> 아이디는 사용할수 없습니다.";
                    $(".userId-box").find(".help-block").html(str);
                    $("#userId").val("");
                    $("#userIdValid").val("false");
                    $("#userId").focus();
                }
            }
        });
    }
</script>

<div class="container">
    <div style="margin-left: 100px">
        <div class="body-container">
            <div class="body-title">
                <h3 class="fw-semibold">${mode=="member"?"회원가입":"정보수정"} </h3>
            </div>
            <div class="body-main">

                <form name="memberSubmit" method="post" style="margin-top : 20px;">
                    <label class="col-form-label" for="userId">아이디</label>
                    <div class="userId-box">
                        <div class="row">
                            <div class="col-7 pe-1">
                                <input type="text" name="userId" id="userId" class="form-control" value="${dto.userId}"
                                ${mode=="update" ? "readonly='readonly' ":""}
                                       placeholder="아이디">
                            </div>
                            <div class="col-4 ps-1">
                                <c:if test="${mode=='member'}">
                                    <button type="button" class="btn btn-primary" onclick="userIdCheck();" style="width: 140px;">중복 확인</button>
                                </c:if>
                            </div>
                        </div>
                        <c:if test="${mode=='member'}">
                            <small class="form-control-plaintext help-block" style="color: gray">
                                아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다
                            </small>
                        </c:if>
                    </div>
                    <label class="col-form-label" for="userPwd">패스워드</label>
                    <div class="row">
                        <div class="col-sm-10">
                            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
                            <small class="form-control-plaintext" style="color: gray">
                                패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다
                            </small>
                        </div>
                    </div>

                    <label class="col-form-label" for="userPwd2">패스워드 확인</label>
                    <div class="row">
                        <div class="col-sm-10">
                            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="패스워드 확인">
                        </div>
                    </div>

                    <label class="col-form-label" for="userName">이름</label>
                    <div class="row">
                        <div class="col-sm-10">
                            <input type="text" name="userName" id="userName" class="form-control" value="${dto.userName}"
                            ${mode=="update" ? "readonly='readonly' ":""}
                                   placeholder="이름">
                        </div>
                    </div>
                    <label class="col-form-label" for="selectEmail">이메일</label>
                    <div class="row">
                        <div class="col-8 row">
                            <div class="col input-group">
                                <input type="text" name="email1" class="form-control" maxlength="30" value="${dto.email1}" >
                                <span class="input-group-text p-1" style="border: none; background: none;">@</span>
                                <input type="text" name="email2" class="form-control" maxlength="30" value="${dto.email2}" readonly="readonly">
                            </div>

                            <div class="col-1 pe-0">
                                <select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
                                    <option value="">선 택</option>
                                    <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
                                    <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
                                    <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
                                    <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
                                    <option value="direct">직접입력</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div>&nbsp;</div>
                    <div class="row">
                        <div class="text-center">
                            <button type="button" name="sendButton" class="btn btn-primary" onclick="memberOk();" style="width: 496px; float: left;"> ${mode=="member"?"회원가입":"정보수정"}</button>
                            <input type="hidden" name="userIdValid" id="userIdValid" value="false">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



