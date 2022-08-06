<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
<c:if test="${empty films }">hello</c:if>
	<c:forEach var="film" items="${ films}">
		<table>
			<tr>
				<th><strong><em>${film.title }</em></strong></th>
			</tr>
			<tr>

				<td><strong>ID: </strong></td>
				<td>${film.id }</td>
			</tr>
			<tr>
				<td><strong>Description: </strong></td>
				<td>${film.description }</td>
			</tr>
			<tr>
				<td><strong>Release Year: </strong></td>
				<td>${film.releaseYear }</td>
			</tr>
			<tr>
				<td><strong>Language: </strong></td>
				<td>${film.language }</td>
			</tr>
			<tr>
				<td><strong>Category: </strong></td>
				<td>${film.category }</td>
			</tr>
			<tr>
				<td><strong>Rental Duration: </strong></td>
				<td>${film.rentalDuration }</td>
			</tr>
			<tr>
				<td><strong>Rental Rate: </strong></td>
				<td>${film.rentalRate }</td>
			</tr>
			<tr>
				<td><strong>Length:</strong></td>
				<td>${film.length }</td>
			</tr>
			<tr>
				<td><strong>Replacement Cost: </strong></td>
				<td>${film.replacementCost }</td>
			</tr>
			<tr>
				<td><strong>Rating: </strong></td>
				<td>${film.rating }</td>
			</tr>
			<tr>
				<td><strong>Special Features: </strong></td>
				<td>${film.specialFeatures }</td>
			</tr>
			<tr>
				<td><strong>Cast</strong></td>
				<td>
					<ul>
						<c:forEach var="actor" items="${film.cast}">
							<li>${ actor.firstName}${actor.lastName}</li>
						</c:forEach>
					</ul>
				</td>
			</tr>



		</table>
	</c:forEach>
</body>
</html>