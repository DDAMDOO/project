<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Core</div>
			<a class="nav-link" href="resources/resources_main/index.jsp">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div>DashBoard
			</a>
			<a class="nav-link" href="mapinfo">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div>Mountain Info
			</a>
			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapsePages" aria-expanded="false"
				aria-controls="collapsePages">
				<div class="sb-nav-link-icon">
					<i class="fas fa-book-open"></i>
				</div> Shopping
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
				data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav accordion"
					id="sidenavAccordionPages">
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#pagesCollapseAuth" aria-expanded="false"
						aria-controls="pagesCollapseAuth">Authentication
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="pagesCollapseAuth"
						aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="resources/resources_main/login.html">Login</a><a
								class="nav-link" href="resources/resources_main/register.html">Register</a><a
								class="nav-link" href="resources/resources_main/password.html">Forgot
								Password</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#pagesCollapseError" aria-expanded="false"
						aria-controls="pagesCollapseError">Error
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="pagesCollapseError"
						aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="../401.html">401 Page</a><a
								class="nav-link" href="../404.html">404 Page</a><a
								class="nav-link" href="../500.html">500 Page</a>
						</nav>
					</div>
				</nav>
			</div>

		</div>
	</div>
</nav>