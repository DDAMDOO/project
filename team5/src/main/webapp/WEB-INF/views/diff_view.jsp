<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Team Project by 2020 TMC</title>
<link
	href="${pageContext.request.contextPath}/resources/resources_main/css/styles.css?1"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<%@ include file="../../resources/resources_main/content/topnav.jsp"%>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="../../resources/resources_main/content/lefter.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<div style="text-align: center; height: 100%; weight: 100%;">
				<div class="card mb-4"
					style="text-align: center; height: 100%; weight: 100%;">
					<div class="card-header" style="background-color:rgba(85,255,51, 0.03);">
						<h3>산 추천</h3>
					</div>
					<div class="card-body">
						<%@ include file="../../WEB-INF/views/diff.jsp"%>
					</div>
				</div>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<%@ include file="../../resources/resources_main/content/footer.jsp"%>
			</footer>
		</div>
	</div>

	<script src="<c:url value="/resources/resources_main/js/scripts.js"/>"></script>

	<script
		src="<c:url value="/resources/resources_main/assets/demo/datatables-demo.js"/>"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

</body>
</html>