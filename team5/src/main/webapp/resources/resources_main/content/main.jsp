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
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i>Area Chart Example
					</div>
					<div class="card-body">
						<p>날씨 api를 이용해서 할 부분</p>
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar mr-1"></i>Bar Chart Example
					</div>
					<div class="card-body">
						<%@ include
					file="carousel.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>Mountain Info
			</div>
			<div class="card-body" style="text-align:center">
				<%@ include
					file="../../../WEB-INF/views/map.jsp"%>
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>YeHun
			</div>
			<div class="card-body" style="text-align:center">
				<%@ include
					file="../../../WEB-INF/views/map.jsp"%>
			</div>
		</div>
	</div>
</main>