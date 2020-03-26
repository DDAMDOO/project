<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a class="navbar-brand" href="/app/"> <img
	src="/app/resources/resources_main/img/logo.png" width=30 height=30>
	Team Mountain Climber
</a>
<div style="color: #ffffff; margin-left: 1450px;">
	<c:choose>
		<c:when test="${not empty sessionScope.ses}">
					<h4>${sessionScope.ses}님 환영합니다.</h4>
				</c:when>
		<c:otherwise>
					<h4>로그인을 해주세요.</h4>
				</c:otherwise>
	</c:choose>
</div>
<!-- Navbar-->
<ul class="navbar-nav ml-auto ml-md-0">
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		id="userDropdown" href="#" role="button" data-toggle="dropdown"
		aria-haspopup="true" aria-expanded="false"><i
			class="fas fa-user fa-fw"></i></a>
		<div class="dropdown-menu dropdown-menu-right"
			aria-labelledby="userDropdown">
			<div class="dropdown-divider"></div>
			<c:choose>
				<c:when test="${not empty sessionScope.ses}">
					<a class="dropdown-item" href="resources/resources_main/mypage.jsp">Mypage</a>
					<a class="dropdown-item" href="logout">Logout</a>
				</c:when>
				<c:otherwise>
					<a class="dropdown-item" href="resources/resources_main/login.jsp">Login</a>
					<a class="dropdown-item"
						href="resources/resources_main/register.jsp">Register</a>
				</c:otherwise>
			</c:choose>
		</div></li>
</ul>