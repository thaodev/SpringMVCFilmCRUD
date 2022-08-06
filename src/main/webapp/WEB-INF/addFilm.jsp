<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AddFilm</title>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- Bootstrap Font Icon CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>

	<div class="container-fluid">
		<form action="addFilm.do" method="POST">
			<div class="form-group">
				<label for="desc">Description</label> <input type="text"
					class="form-control" name="description" id="desc" s
					aria-describedby="description" placeholder="Enter film description">
			</div>
			<div class="form-group">
				<label for="year">Release Year</label> <input type="text"
					class="form-control" name="releaseYear" id="year"
					aria-describedby="Release Year"
					placeholder="Enter film description">
			</div>
			<div class="form-group">
				<select
					class="form-select" aria-label="Default select example">
					<option selected>Enter film description</option>
					<option value="English">English</option>
					<option value="Italian">Italian</option>
					<option value="Japanese">Japanese</option>
					<option value="Mandarin">Mandarin</option>
					<option value="French">French</option>
					<option value="German">German</option>
				</select>
			</div>

			<div class="form-group">
				<label for="category">category</label> <input type="text"
					class="form-control" id="category" aria-describedby="category"
					placeholder="Enter film description">
			</div>
			<div class="form-group">
				<label for="rental">Rental Duration</label> <input type="text"
					class="form-control" id="rental" aria-describedby="Rental Duration"
					placeholder="Enter Rental Duration">
			</div>



			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
