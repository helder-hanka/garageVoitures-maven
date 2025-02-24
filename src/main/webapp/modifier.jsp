<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Page de modification</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/GarageVoitures/ajoutVoitures">Ajout
				Voitures</a>
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
				</ul>
			</div>
		</div>
	</nav>

	<div class="d-flex flex-column align-items-center ">
		<h1 class="m-5">Bienvenue dans notre garage</h1>
		<div class="d-flex flex-column align-items-center ">
			<h2>Modifier la voiture</h2>
			<form method="POST">
				<%
				if (request.getAttribute("resPost") != null) {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<%=request.getAttribute("resPost")%>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<script>
					setTimeout(function() {
						window.location.href = '/GarageVoitures/liste';
					}, 3000);
				</script>
				<%
				}
				%>

				<%
				if (request.getAttribute("result") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>Erreur :</strong>
					<%=request.getAttribute("result")%>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				}
				%>

				<div class="mb-3">
					<label for="immatriculation" class="form-label">Immatriculation</label>
					<input type="text" class="form-control"
						pattern="[A-Z]{2}-\d{3}-[A-Z]{2}" id="immatriculation"
						value="<%=request.getAttribute("immatriculation") != null ? request.getAttribute("immatriculation").toString() : ""%>"
						name="immatriculation" placeholder="AA-001-AA" required
						title="L'immatriculation doit suivre le format : AA-001-AA">

					<label for="marque" class="form-label">Marque</label> <input
						type="text" class="form-control" id="marque"
						value="<%=request.getAttribute("marque") != null ? request.getAttribute("marque").toString() : ""%>"
						name="marque" placeholder="Opel" required> <label
						for="modele" class="form-label">Modèle</label> <input type="text"
						class="form-control" id="modele"
						value="<%=request.getAttribute("modele") != null ? request.getAttribute("modele").toString() : ""%>"
						name="modele" placeholder="Espace" required>
				</div>

				<div class="mb-3">
					<h3>Choisissez l'état de la voiture</h3>
					<select class="form-select" name="etat"
						aria-label="Default select example" required>
						<option value="" disabled
							<%=request.getAttribute("etat") != null ? "selected" : ""%>>Sélectionnez
							un état</option>
						<option value="pris en charge"
							<%="pris en charge".equals(request.getAttribute("etat")) ? "selected" : ""%>>Pris
							en charge</option>
						<option value="en cours"
							<%="en cours".equals(request.getAttribute("etat")) ? "selected" : ""%>>En
							cours</option>
						<option value="terminé"
							<%="terminé".equals(request.getAttribute("etat")) ? "selected" : ""%>>Terminé</option>

					</select>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script>
	document.querySelector('form').addEventListener('submit', function() {
		alert('Traitement en cours, veuillez patienter...');
	});
</script>
</html>