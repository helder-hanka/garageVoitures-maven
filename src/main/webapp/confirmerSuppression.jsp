<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Suppression</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/GarageVoitures/ajoutVoitures">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="/liste" href="/GarageVoitures/liste">Tous les
							voitures</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="/liste" href="/GarageVoitures/modifier">Modifier
							les voitures</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="d-flex flex-column align-items-center ">
		<h1>Confirmer la suppression</h1>
		<form method="post">
			<div class="card text-center">
				<div class="card-header">Immatriculation</div>
				<div class="card-body">
					<h5 class="card-title"><%=request.getAttribute("immatriculation")%>
					</h5>
					<%
					if (request.getAttribute("success") != null) {
					%>
					<span class="text-success"><%=request.getAttribute("success")%></span>
					<%
					} else if (request.getAttribute("erreur") != null) {
					%>
					<span class="text-danger"><%=request.getAttribute("erreur")%></span>
					<%
					} else {
					%>
					<p class="card-text">Voulez-vous supprimer cette voiture ?</p>
					<%
					}
					%>

					<div>
						<input type="hidden" name="immatriculation"
							value="<%=request.getAttribute("immatriculation")%>">
						<button type="submit" class="btn btn-danger"
							<%if (request.getAttribute("success") != null || request.getAttribute("erreur") != null) {%>
							disabled <%}%>>Confirmer</button>
						<a href="/GarageVoitures/liste" class="btn btn-primary"> <%
 if (request.getAttribute("success") != null || request.getAttribute("erreur") != null) {
 %>
							Retour à la liste <%
 } else {
 %> Annuler <%
 }
 %>
						</a>
					</div>

				</div>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>