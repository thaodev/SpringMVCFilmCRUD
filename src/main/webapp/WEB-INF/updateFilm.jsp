<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- Bootstrap Font Icon CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
			<h1>UPDATE FILM</h1>
		</div>
		<form action="updateFilm.do" method="POST">
			<input type="hidden" name="id" value="<c:out value= "${film.id }"/>" />

			<div class="form-group">
				<label for="title">Title*</label> <input type="text"
					class="form-control" name="title" id="desc" required
					aria-describedby="description" placeholder="Enter film title"
					value="<c:out value="${film.title }"/>">
			</div>
			<div class="form-group">
				<label for="desc">Description</label> <input type="text"
					class="form-control" name="description" id="desc"
					aria-describedby="description" placeholder="Enter film description"
					value="<c:out value="${film.description }"/>">
			</div>
			<div class="form-group">
				<label for="year">Release Year</label> <input type="number"
					class="form-control" name="releaseYear" id="year"
					aria-describedby="Release Year"
					placeholder="Enter film release year"
					value="<c:out value="${film.releaseYear }"/>">
			</div>
			<div class="form-group">
				<label for="lang">Language*</label> <select class="form-select"
					name="languageId" required id="lang"
					aria-label="Default select example">
					<option selected>Select film language</option>
					<option <c:if test="${film.language == 'English' }">selected</c:if>
						value="1">English</option>
					<option <c:if test="${film.language == 'Italian' }">selected</c:if>
						value="2">Italian</option>
					<option
						<c:if test="${film.language == 'Japanese' }">selected</c:if>
						value="3">Japanese</option>
					<option
						<c:if test="${film.language == 'Mandarin' }">selected</c:if>
						value="4">Mandarin</option>
					<option <c:if test="${film.language == 'French' }">selected</c:if>
						value="5">French</option>
					<option <c:if test="${film.language == 'German' }">selected</c:if>
						value="6">German</option>
				</select>
			</div>

			<div class="form-group">
				<label for="lang">Category</label> <select class="form-select"
					id="lang" name="category" aria-label="Default select example">
					<option selected>Select film category</option>
					<option <c:if test="${film.category == 'Action' }">selected</c:if>
						value="Action">Action</option>
					<option
						<c:if test="${film.category == 'Animation' }">selected</c:if>
						value="Animation">Animation</option>
					<option
						<c:if test="${film.category == 'Children' }">selected</c:if>
						value="Children">Children</option>
					<option
						<c:if test="${film.category == 'Classics' }">selected</c:if>
						value="Classics">Classics</option>
					<option <c:if test="${film.category == 'Comedy' }">selected</c:if>
						value="Comedy">Comedy</option>
					<option
						<c:if test="${film.category == 'Documentary' }">selected</c:if>
						value="Documentary">Documentary</option>
					<option <c:if test="${film.category == 'Drama' }">selected</c:if>
						value="Drama">Drama</option>
					<option <c:if test="${film.category == 'Family' }">selected</c:if>
						value="Family">Family</option>
					<option <c:if test="${film.category == 'Foreign' }">selected</c:if>
						value="Foreign">Foreign</option>
					<option <c:if test="${film.category == 'Games' }">selected</c:if>
						value="Games">Games</option>
					<option <c:if test="${film.category == 'Horror' }">selected</c:if>
						value="Horror">Horror</option>
					<option <c:if test="${film.category == 'Music' }">selected</c:if>
						value="Music">Music</option>
					<option <c:if test="${film.category == 'New' }">selected</c:if>
						value="New">New</option>
					<option <c:if test="${film.category == 'Sci-Fi' }">selected</c:if>
						value="Sci-Fi">Sci-Fi</option>
					<option <c:if test="${film.category == 'Sport' }">selected</c:if>
						value="Sport">Sport</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rental">Rental Duration</label> <input type="text"
					class="form-control" id="rental" name="rentalDuration"
					aria-describedby="Rental Duration" placeholder="3"
					value="<c:out value="${film.rentalDuration }"/>">
			</div>
			<div class="form-group">
				<label for="rental rate">Rental Rate*</label> <input type="number"
					required class="form-control" name="rentalRate" id="rental rate"
					step=0.01 placeholder="$4.99"
					value="<c:out value="${film.rentalRate }"/>">
			</div>
			<div class="form-group">
				<label for="length">Length*</label> <input type="number" required
					class="form-control" name="length" id="length"
					placeholder="Enter length" value="<c:out value="${film.length }"/>">
			</div>
			<div class="form-group">
				<label for="repcost">Replacement Cost</label> <input type="number"
					class="form-control" name="replacementCost" id="repcost"
					placeholder="$19.99"
					value="<c:out value="${film.replacementCost }"/>">
			</div>
			<div class="form-group">
				<label for="rate">Rating</label> <select class="form-select"
					name="rating" id="rate" aria-label="Default select example">
					<option selected></option>
					<option <c:if test="${film.rating == 'G' }">selected</c:if>
						value="G">G</option>
					<option <c:if test="${film.rating == 'PG' }">selected</c:if>
						value="PG">PG</option>
					<option <c:if test="${film.rating == 'PG13' }">selected</c:if>
						value="PG13">PG13</option>
					<option <c:if test="${film.rating == 'R' }">selected</c:if>
						value="R">R</option>
					<option <c:if test="${film.rating == 'NC17' }">selected</c:if>
						value="NC17">NC17</option>
				</select>
			</div>
			<div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="cbox1"
						name="features" value="Trailers"
						<c:if test="${fn:contains(film.specialFeatures, 'Trailers')}">checked</c:if>>
					<label class="form-check-label" for="flexCheckDefault">
						Trailers </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="cbox2"
						name="features" value="Commentaries"
						<c:if test="${fn:contains(film.specialFeatures, 'Commentaries')}">checked</c:if>>
					<label class="form-check-label" for="flexCheck2">
						Commentaries </label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="cbox3"
						name="features" value="Deleted Scenes"
						<c:if test="${fn:contains(film.specialFeatures, 'Deleted Scenes')}">checked</c:if>>
					<label class="form-check-label" for="flexCheck3"> Deleted
						Scenes</label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="cbox4"
						name="features" value="Behind the Scenes"
						<c:if test="${fn:contains(film.specialFeatures, 'Behind the Scenes')}">checked</c:if>>
					<label class="form-check-label" for="flexCheck4"> Behind
						the Scenes</label>
				</div>
			</div>
			<input type="hidden" name="specialFeatures" value="" />

			<script>
 					const cbox1 = document.getElementById('cbox1');
   					cbox1.addEventListener('change', (event) => {
      					let checkboxes = document.querySelectorAll('input[name="features"]:checked');
      					document.querySelector('input[name="specialFeatures"]').value = "";
    					for (let i = 0; i < checkboxes.length; i++) {
      						document.querySelector('input[name="specialFeatures"]').value += checkboxes[i].value;
      						if (i < checkboxes.length - 1) {
      							document.querySelector('input[name="specialFeatures"]').value += ',';
      						}
      					}

						});  
      				const cbox2 = document.getElementById('cbox2');
       				cbox2.addEventListener('change', (event) => {
          					let checkboxes = document.querySelectorAll('input[name="features"]:checked');
          					document.querySelector('input[name="specialFeatures"]').value = "";
        					for (let i = 0; i < checkboxes.length; i++) {
          						document.querySelector('input[name="specialFeatures"]').value += checkboxes[i].value;
          						if (i < checkboxes.length - 1) {
          							document.querySelector('input[name="specialFeatures"]').value += ',';
          						}
          					}
 
							});    
     				const cbox3 = document.getElementById('cbox3');
       				cbox3.addEventListener('change', (event) => {
          					let checkboxes = document.querySelectorAll('input[name="features"]:checked');
          					document.querySelector('input[name="specialFeatures"]').value = "";
        					for (let i = 0; i < checkboxes.length; i++) {
          						document.querySelector('input[name="specialFeatures"]').value += checkboxes[i].value;
          						if (i < checkboxes.length - 1) {
          							document.querySelector('input[name="specialFeatures"]').value += ',';
          						}
          					}

    						});  
          			const cbox4 = document.getElementById('cbox4');
           			cbox4.addEventListener('change', (event) => {
           					let checkboxes = document.querySelectorAll('input[name="features"]:checked');
           					document.querySelector('input[name="specialFeatures"]').value = "";
           					for (let i = 0; i < checkboxes.length; i++) {
             						document.querySelector('input[name="specialFeatures"]').value += checkboxes[i].value;
             						if (i < checkboxes.length - 1) {
             							document.querySelector('input[name="specialFeatures"]').value += ',';
             						}
             					}
    
   							});  
					</script>

			<div class="text-center mt-3">
				<button type="submit" id="btn" class="btn btn-primary">Update
					Film</button>
			</div>
		</form>

	</div>

	<div>

		<c:choose>
			<c:when test="${empty updateResult}">

			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${updateResult = true }">
						<p style="font-size: 30px">Film successfully updated &#128526</p>
					</c:when>
					<c:otherwise>
						<p style="font-size: 30px">Update unsuccessful &#128532 </p>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
