package controller;

import java.io.IOException;
import java.sql.SQLException;

import dao.VoitureDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class ConfirmerSuppression
 */
@WebServlet("/ConfirmerSuppression")
public class ConfirmerSuppression extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final VoitureDAOImpl vDaoI = new VoitureDAOImpl();

	/**
	 * Default constructor.
	 */
	public ConfirmerSuppression() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String immatriculation = req.getParameter("immatriculation");

		if (immatriculation != null && !immatriculation.isEmpty()) {
			req.setAttribute("immatriculation", immatriculation);
			req.getRequestDispatcher("confirmerSuppression.jsp").forward(req, res);
			return;
		}
		req.getRequestDispatcher("ajoutVoitures.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String immat = req.getParameter("immatriculation");
		if(immat== null || immat.isEmpty()) {
			req.setAttribute("erreur", "Immatriculation ne doit pas etre vide");
			 req.getRequestDispatcher("confirmerSuppression.jsp").forward(req, res);
			return;
		}
		try {
			vDaoI.supprime(immat.trim());
			req.setAttribute("success", "Voiture supprimée avec succès !");
		}catch(SQLException e) {
			e.printStackTrace(); // Log l'erreur pour le débogage
			req.setAttribute("errorMessage", "Erreur lors de la supprésion voiture. Veuillez réessayer.");
		}
		req.getRequestDispatcher("confirmerSuppression.jsp").forward(req, res);
	}

}
