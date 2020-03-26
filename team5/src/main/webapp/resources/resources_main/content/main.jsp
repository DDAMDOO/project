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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath}/resources/resources_main/css/styles.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
</head>
<main>
	<div class="container-fluid">
		<h2 style="text-align:left;"><img
	src="/app/resources/resources_main/img/logo.png" width=60 height=80>TMC 통합 등산  정보 시스템</h2>

		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header" style="text-align:center; background-color:rgba(85,255,51, 0.03); height:60px" ><h3>오늘의 지역별 날씨</h3></div>
					<div class="card-body" style="height:200px;  padding:0px;">
						<%@ include file="../../../WEB-INF/views/cityweather.jsp"%>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4" >
					<div class="card-header"style="text-align:center; background-color:rgba(85,255,51, 0.03); height:60px"><h3>등산자 보험</h3></div>
					<div class="card-body" style="height:200px; padding:0px;">
						<%@ include file="carousel.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<div class="card" style=" text-align: center; ">
			<div class="card-header" style="background-color:rgba(85,255,51, 0.03); height:60px;"><h3>개발자 정보</h3></div>
			<div class="card-body">
				<%@ include file="dev_info.jsp"%>
			</div>
		</div>

	</div>
</main>