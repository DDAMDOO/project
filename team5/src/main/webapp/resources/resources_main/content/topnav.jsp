<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<a class="navbar-brand" href="/app/">Team Mountain Climber</a>

<!-- Navbar-->
<ul class="navbar-nav ml-auto ml-md-0">
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Activity Log</a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="resources/resources_main/login.jsp">Logout</a>
			<a class="dropdown-item" href="resources/resources_main/register.jsp">Register</a>
			<a class="dropdown-item" href="resources/resources_main/mypage.jsp">Mypage</a>
		</div>
	</li>
</ul>