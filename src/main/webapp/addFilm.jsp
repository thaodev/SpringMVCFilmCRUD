<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AddFilm</title>
<style>
.form-group
,
required
</style>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- <!-- Bootstrap Font Icon CSS
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"> -->
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
		<div class="text-center">
			<h1>ADD A FILM INTO DATABASE</h1>
		</div>
		<form action="addFilm.do" method="POST">
			<div class="form-group">
				<label for="title">Title*</label> <input type="text"
					class="form-control" name="title" id="desc" required
					aria-describedby="description" placeholder="Enter film title">
			</div>
			<div class="form-group">
				<label for="desc">Description</label> <input type="text"
					class="form-control" name="description" id="desc"
					aria-describedby="description" placeholder="Enter film description">
			</div>
			<div class="form-group">
				<label for="year">Release Year</label> <input type="number"
					class="form-control" name="releaseYear" id="year"
					aria-describedby="Release Year"
					placeholder="Enter film release year">
			</div>
			<div class="form-group">
				<label for="lang">Language*</label> <select class="form-select"
					name="languageId" required id="lang"
					aria-label="Default select example">
					<option selected>Select film language</option>
					<option value="1">English</option>
					<option value="2">Italian</option>
					<option value="3">Japanese</option>
					<option value="4">Mandarin</option>
					<option value="5">French</option>
					<option value="6">German</option>
				</select>
			</div>

			<div class="form-group">
				<label for="lang">Category</label> <select class="form-select"
					id="lang" aria-label="Default select example">
					<option selected>Select film category</option>
					<option value="1">1. Action</option>
					<option value="2">2. Animation</option>
					<option value="3">3. Children</option>
					<option value="4">4. Classics</option>
					<option value="5">5. Comedy</option>
					<option value="6">6. Documentary</option>
					<option value="7">7. Drama</option>
					<option value="8">8. Family</option>
					<option value="9">9. Foreign</option>
					<option value="10">10. Games</option>
					<option value="11">11. Horror</option>
					<option value="12">12. Music</option>
					<option value="13">13. New</option>
					<option value="14">14. Sci-Fi</option>
					<option value="15">15. Sport</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rental">Rental Duration</label> <input type="text"
					class="form-control" id="rental" aria-describedby="Rental Duration"
					placeholder="3">
			</div>
			<div class="form-group">
				<label for="rental rate">Rental Rate*</label> <input type="number"
					required class="form-control" name="rentalRate" id="rental rate"
					step=0.01 placeholder="$4.99">
			</div>
			<div class="form-group">
				<label for="length">Length*</label> <input type="number" required
					class="form-control" name="length" id="length"
					placeholder="Enter length">
			</div>
			<div class="form-group">
				<label for="repcost">Replacement Cost</label> <input type="number"
					class="form-control" name="replacementCost" id="repcost"
					placeholder="$19.99">
			</div>
			<div class="form-group">
				<label for="rate">Rating</label> <select class="form-select"
					name="rating" id="rate" aria-label="Default select example">
					<option selected></option>
					<option value="G">G</option>
					<option value="PG">PG</option>
					<option value="PG13">PG13</option>
					<option value="R">R</option>
					<option value="NC17">NC17</option>
				</select>
			</div>
			<div class="form-group">
				<label for="feature">Special Features</label> <select
					class="form-select" name="specialFeatures" id="feature"
					aria-label="Default select example">
					<option selected></option>
					<option value="Trailers">Trailers</option>
					<option value="Commentaries">Commentaries</option>
					<option value="Deleted Scences">Deleted Scenes</option>
					<option value="Behind the Scenes">Behind the Scenes</option>
				</select>
			</div>


			<div class="text-center mt-3">
				<button type="submit" class="btn btn-primary">Add Film</button>
			</div>
		</form>

	</div>

	<c:choose>
		<c:when test="${empty title}">

		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${empty filmAdded }">
					<p>No film added</p>
				</c:when>
				<c:otherwise>
					<p>Save successfully</p>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
