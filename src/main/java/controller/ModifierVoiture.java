package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Voiture;

import java.io.IOException;

import dao.VoitureDAOImpl;

/**
 * Servlet implementation class ModifierVoiture
 */
@WebServlet("/ModifierVoiture")
public class ModifierVoiture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final VoitureDAOImpl vDOImpl = new VoitureDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierVoiture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String immatriculation = req.getParameter("immatriculation");
		String marque = req.getParameter("marque");
		String modele = req.getParameter("modele");
		String etat = req.getParameter("etat");

		if (immatriculation != null && !immatriculation.isEmpty() && marque != null && !marque.isEmpty()
				&& modele != null && !modele.isEmpty() && etat != null && !etat.isEmpty()) {
			immatriculation = immatriculation.replaceAll("[^A-Z0-9]", ""); // Supprime tout sauf lettres et chiffres
			if (immatriculation.length() == 7) {
				immatriculation = immatriculation.substring(0, 2) + "-" + immatriculation.substring(2, 5) + "-"
						+ immatriculation.substring(5, 7);
			}
			req.setAttribute("immatriculation", immatriculation);
			req.setAttribute("marque", marque);
			req.setAttribute("modele", modele);
			req.setAttribute("etat", etat);
		}

		req.getRequestDispatcher("modifier.jsp").forward(req, res);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String immatriculation = req.getParameter("immatriculation");
		String marque = req.getParameter("marque");
		String modele = req.getParameter("modele");
		String etat = req.getParameter("etat");
		String newImmat = immatriculation.replace("-", "");

		if (immatriculation == null || immatriculation.isEmpty() || marque == null || marque.isEmpty() || modele == null
				|| modele.isEmpty() || etat == null || etat.isEmpty()) {
			req.setAttribute("result", "Tous les champs doivent être remplis !");
			req.getRequestDispatcher("modifier.jsp").forward(req, res);
			return;
		}
		Voiture voiture = new Voiture(newImmat, marque, modele, etat);
		String msg = vDOImpl.modifier(voiture);

		if (msg.startsWith("Erreur")) {
			req.setAttribute("result", msg);
		} else {

			req.setAttribute("resPost", msg);
		}
		req.getRequestDispatcher("modifier.jsp").forward(req, res);
	}

}
