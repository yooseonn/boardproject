<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style = "text/css">

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
        const f = document.memberForm;
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
            alert("패스워드를 다시 입력 하세요. ");
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
        const f = document.memberForm;

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


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                    <script>
                        function daumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var fullAddr = ''; // 최종 주소 변수
                                    var extraAddr = ''; // 조합형 주소 변수
                                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                        fullAddr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                        fullAddr = data.jibunAddress;
                                    }
                                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                                    if(data.userSelectedType === 'R'){
                                        //법정동명이 있을 경우 추가한다.
                                        if(data.bname !== ''){
                                            extraAddr += data.bname;
                                        }
                                        // 건물명이 있을 경우 추가한다.
                                        if(data.buildingName !== ''){
                                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                        }
                                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                                    }
                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                                    document.getElementById('addr1').value = fullAddr;
                                    // 커서를 상세주소 필드로 이동한다.
                                    document.getElementById('addr2').focus();
                                }
                            }).open();
                        }
                    </script>
