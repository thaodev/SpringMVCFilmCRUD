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
	<div class="container-fluid ">
		<c:choose>
			<c:when test="${empty film }">
				<p>Film Not Found</p>
			</c:when>
			<c:otherwise>

				<table class="center">
					<tr>
						<th><strong><em>${film.title }</em></strong></th>
					</tr>
					<tr>

						<td><strong>ID: </strong></td>
						<td>${film.id }</td>
					</tr>
					<tr>
						<td><strong>Description: </strong></td>
						<td><c:if test="${not empty film.description }">${film.description }</c:if></td>
					</tr>
					<tr>
						<td><strong>Release Year: </strong></td>
						<td><c:if test="${not empty film.releaseYear }">${film.releaseYear }</c:if></td>
					</tr>
					<tr>
						<td><strong>Language: </strong></td>
						<td>${film.language }</td>
					</tr>
					<tr>
						<td><strong>Category: </strong></td>
						<td><c:if test="${not empty film.category }">${film.category }</c:if></td>
					</tr>
					<tr>
						<td><strong>Rental Duration: </strong></td>
						<td><c:if test="${not empty film.rentalDuration }">${film.rentalDuration }</c:if></td>
					</tr>
					<tr>
						<td><strong>Rental Rate: </strong></td>
						<td><c:if test="${not empty film.rentalRate }">${film.rentalRate }</c:if></td>
					</tr>
					<tr>
						<td><strong>Length:</strong></td>
						<td><c:if test="${not empty film.length }">${film.length }</c:if></td>
					</tr>
					<tr>
						<td><strong>Replacement Cost: </strong></td>
						<td><c:if test="${not empty film.replacementCost }">${film.replacementCost }</c:if></td>
					</tr>
					<tr>
						<td><strong>Rating: </strong></td>
						<td><c:if test="${not empty film.rating }">${film.rating }</c:if></td>
					</tr>
					<tr>
						<td><strong>Special Features: </strong></td>
						<td><c:if test="${not empty film.specialFeatures }">${film.specialFeatures }</c:if></td>
					</tr>
					<tr>
						<td><strong>Cast</strong></td>
						<td><c:if test="${not empty film.cast }">
								<ul>
									<c:forEach var="actor" items="${film.cast}">
										<li>${ actor.firstName}${actor.lastName}</li>
									</c:forEach>
								</ul>
							</c:if></td>
					</tr>



				</table>
				<div class="d-flex flex-row" class="mr-3">
					<div>
						<form action="deleteFilm.do" method="POST" >
							<input type="hidden" name="filmId"
								value="<c:out value="${film.id }"/>" />
							<button type="submit" class="btn btn-info mr-5">Delete</button>
						</form>
					</div>
					<div >
						<form action="presentFilmForUpdate.do" method="GET">
							<input type="hidden" name="filmId"
								value="<c:out value="${film.id }"/>" />
							<button type="submit" class="btn btn-info mx-auto">Update</button>
						</form>
					</div>
				</div>

			</c:otherwise>
		</c:choose>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>

</html>