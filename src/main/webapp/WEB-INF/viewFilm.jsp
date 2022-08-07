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

	<c:choose>
		<c:when test="${empty film }">
			<p>Film Not Found</p>
		</c:when>
		<c:otherwise>
			<form action="deleteFilm.do" method="POST">
				<input type="hidden" name="filmId" value="<c:out value="${film.id }"/>"/>
				<button type="submit" class="btn btn-info mb-2">Delete</button>
			</form>
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
					<td>
						<c:if test="${not empty film.cast }">
							<ul>
								<c:forEach var="actor" items="${film.cast}">
									<li>${ actor.firstName}${actor.lastName}</li>
								</c:forEach>
							</ul>
						</c:if>
					</td>
				</tr>



			</table>
		</c:otherwise>
	</c:choose>
</body>

</html>