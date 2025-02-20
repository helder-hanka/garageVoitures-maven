<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Home</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/GarageVoitures/ajoutVoitures">Ajout Voitures</a>
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
		<h1 class="m-5">Bienvenue dans notre garage</h1>
		<h2>Veuillez enregistrer la voiture</h2>
		<form method="POST">
			<span class="text-success"> <%
 if (request.getAttribute("success") != null) {
 	out.write(request.getAttribute("success").toString());
 }
 %>
			</span> <span class="text-danger"> <%
 if (request.getAttribute("error") != null) {
 	out.write(request.getAttribute("error").toString());
 }
 %>
			</span>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Immatriculation</label>
				<input type="text" class="form-control"
					pattern="[A-Z]{2}-\d{3}-[A-Z]{2}" id="immatriculation"
					name="immatriculation" placeholder="AA-001-AA" required> <label
					for="exampleFormControlInput1" class="form-label">Marque</label> <input
					type="text" class="form-control" id="marque" name="marque"
					placeholder="Opel" required> <label
					for="exampleFormControlInput1" class="form-label">Modele</label> <input
					type="text" class="form-control" id="modele" name="modele"
					placeholder="Espace" required>
			</div>
			<div class="mb-3">
				<h3>Choisissez l'état de la voiture</h3>
				<select class="form-select" name="etat"
					aria-label="Default select example" required>
					<option selected></option>
					<option value="pris en charge">Pris en charge</option>
					<option value="en cours">En cours</option>
					<option value="terminé">Terminé</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>