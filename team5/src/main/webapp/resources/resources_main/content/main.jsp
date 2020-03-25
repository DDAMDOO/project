<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">TMC</h1>

		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">오늘의 날씨</div>
					<div class="card-body">
						<%@ include file="../../../WEB-INF/views/cityweather.jsp"%>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">등산자 보험</div>
					<div class="card-body">
						<%@ include file="carousel.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<div class="card" style="height:800px; text-align:center;">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>Mountain Info
			</div>
			<div class="card-body">
				<%@ include file="../../../WEB-INF/views/map.jsp"%>
			</div>
		</div>

	</div>
</main>