\<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="footer-div" id="footer-div" style="width: 100%; height: 70px;">
  <div class="links" style="text-align: center; padding: 15px;">
    <a class="navbar-brand" href="#" style="padding-left: 0px"><img id="img-gray" src="${pageContext.request.contextPath}/resources/static/images/logo.png"></a>
    <span>회사소개</span><span>이용약관</span><span>고객센터</span><span>인재채용</span><span>TEL : 02-717-5196</span>
    <div style="text-align: center;">주소 : 서울특별시 마포구 독막로 275 (대흥동 445) 광성벤쳐프라자 6 </div>
  </div>
</div>
<div id="chat-channel-button"></div>


</body>
</html>
