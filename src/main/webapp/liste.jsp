<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Voiture"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Voitures enregistrées</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
						href="/GarageVoitures/modifier">Modifier les voitures</a></li>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<form class="d-flex" role="search" method="post">
				<input class="form-control me-2" type="search"
				value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
					placeholder="Rechercher" aria-label="Search" name="search">
				<button class="btn btn-outline-success" type="submit">Rechercher</button>
			</form>
		</div>
	</nav>

	<div class="container mt-4">
		<h1 class="text-center">Liste des voitures enregistrées</h1>

		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		%>
		<%
		if (errorMessage != null) {
		%>
		<div class="alert alert-danger text-center" role="alert">
			<%=errorMessage%>
		</div>
		<%
		}
		%>

		<%
		List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
		%>

		<%
		if (voitures == null || voitures.isEmpty()) {
		%>
		<p class="text-center text-danger">Aucune voiture enregistrée.</p>
		<%
		} else {
		%>
		<table class="table table-bordered">
			<thead class="thead-light">
				<tr>
					<th>Nombres de voitures</th>
					<th>Immatriculation</th>
					<th>Marque</th>
					<th>Modèle</th>
					<th>État</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < voitures.size(); i++) {
					Voiture voiture = voitures.get(i);
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%=voiture.getImmatriculation()%></td>
					<td><%=voiture.getMarque()%></td>
					<td><%=voiture.getModele()%></td>
					<td><%=voiture.getEtat()%></td>
					<td><a
						href="/GarageVoitures/modifier?immatriculation=<%=voiture.getImmatriculation()%>&marque=<%=voiture.getMarque() %>&modele=<%=voiture.getModele() %>&etat=<%=voiture.getEtat() %>"
						class="text-primary"><i
							class="fa-regular fa-pen-to-square fa-lg"></i></a> <a
						href="/GarageVoitures/supprimer?marque=<%=voiture.getImmatriculation()%>"
						class="text-danger"
						onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette voiture ?');">
							<i class="fa-regular fa-trash-can fa-lg"></i>
					</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		}
		%>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

</html>
