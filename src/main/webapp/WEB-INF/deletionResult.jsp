<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>Save Result</title>


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
	<div class="container-fluid text-center">
	<c:choose>
		<c:when test="${result }">
						<img id="resultImg" alt="tragedy"/>
			<p style="font-size: 40px">Film successfully deleted &#128520</p>
		</c:when>
		<c:otherwise>
					<img id="resultImg" alt="tragedy"/>
			<p style="font-size: 40px">Deletion unsuccessful  &#128529</p>
			<p style="font-style: italic">You are trying to delete a parent row referenced in another table.</p>
		</c:otherwise>
	</c:choose>
	</div>
			<script>
			window.addEventListener('load', loadImg);

			function loadImg() {
  				var imageElement = document.getElementById('resultImg');
  				const url = "https://api.unsplash.com/photos/random?query=" + imageElement.alt.replace(/ /g, "+") + "&client_id=yp_PY-Nzr42qXpkFPOmRWgecEs4-guyD3mM42yiyT9o";
   				fetch(url)
        			.then(response => {
            			return response.json();
       					})
        			.then(data => {
                        imageElement.src = data.urls.thumb;
                    	});
				}
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>

</html>