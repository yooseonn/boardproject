\<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
}
</style>

<div class="container">
	<div class="body-container">

        <div class="row justify-content-md-center mt-5">
            <div class="col-md-8">
                <div class="border border-primary mt-5 p-4">
                       <h4 class="text-center fw-bold">${title}</h4>
                       <hr class="mt-4">

	                <div class="d-grid p-3">
						<p class="text-center">${message}</p>
	                </div>

                       <div class="d-grid">
                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/home';">메인화면</button>
                       </div>
                </div>

            </div>
        </div>

	</div>
</div>
