package controller;

import java.io.IOException;
import java.sql.SQLException;

import dao.VoitureDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Voiture;

/**
 * Servlet implementation class AjoutVoitures
 */
@WebServlet("/AjoutVoitures")
public class AjoutVoitures extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private VoitureDAOImpl vDaoI = new VoitureDAOImpl();

	/**
	 * Default constructor.
	 */
	public AjoutVoitures() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("ajoutVoitures.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String immatriculation = request.getParameter("immatriculation");
		String marque = request.getParameter("marque");
		String modele = request.getParameter("modele");
		String etat = request.getParameter("etat");
		String newImm = immatriculation.replace("-", "");
		System.out.println("newImm: " + newImm);

		if (immatriculation == null || immatriculation.isEmpty() || marque == null || marque.isEmpty() || modele == null
				|| modele.isEmpty() || etat == null || etat.isEmpty()) {
			request.setAttribute("result", "Tous les champs ne sont pas remplis");
			request.getRequestDispatcher("ajoutVoitures.jsp").forward(request, response);
			return;
		}

		Voiture voiture = new Voiture(newImm, marque, modele, etat);
		try {
			vDaoI.ajouter(voiture);
			request.setAttribute("success", "Voiture ajoutée avec succès !");
			request.getRequestDispatcher("ajoutVoitures.jsp").forward(request, response);
		} catch (SQLException e) {
			request.setAttribute("error", "Erreur lors de l'ajout de la voiture: " + e.getMessage());
			request.getRequestDispatcher("ajoutVoitures.jsp").forward(request, response);
		}
	}
}
