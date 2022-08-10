<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View</title>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.html">Movie Library</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.html">Home</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<h2>
			<c:out value="${numResults}" /> result<c:if test="${numResults != 1}">s</c:if>
			found for search criteria '
			<c:out value="${criteria }" />
			'
		</h2>

		<div class="row">
			<div class="col-md-12 text-center">
				<a href="addFilm.jsp" class="btn btn-success" role="button">Add a
				Film</a>


			</div>
			
		</div>
		<table class="table table-striped">
			<thead>

				<tr>
					<th scope="col">Film Id</th>
					<th scope="col">Title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="film" items="${films}">

					<tr>
						<td><c:out value="${film.key}" /></td>
						<td><a
							href="findFilmByID.do?filmId=<c:out value="${film.key }"/>">
								<c:out value="${film.value }" />
						</a></td>

					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>