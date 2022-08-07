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
	<h2><c:out value="${numResults }"/> result<c:if test="${numResults != 1 }">s</c:if> found for search criteria '<c:out value="${criteria }"/>'</h2>
	<table>
		<c:forEach var="film" items="${ films}">
			<tr>
				<td>
					<a href="findFilmByID.do?filmId=<c:out value="${film.id }"/>">
						<c:out value="${film.title }"/> (<c:out value="${film.releaseYear }"/>)
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>