package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Voiture;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.VoitureDAOImpl;

/**
 * Servlet implementation class Listes
 */
@WebServlet("/Listes")
public class Listes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VoitureDAOImpl voitureDaoI = new VoitureDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Listes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			List<Voiture> voitures = voitureDaoI.lister();
            req.setAttribute("voitures", voitures);
        } catch (SQLException e) {
            // En cas d'erreur, envoyer un message d'erreur à la vue
            req.setAttribute("errorMessage", "Erreur lors de la récupération des voitures. Veuillez réessayer.");
        }
		req.getRequestDispatcher("liste.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String search = req.getParameter("search");
		
		try {
			List<Voiture> voitures;
			
			if(search == null || search.isEmpty()) {
				 voitures = voitureDaoI.lister();
			} else {
				Voiture result = voitureDaoI.trouverParImmat(search);
	            voitures = result != null ? List.of(result) : List.of();
			}
			req.setAttribute("voitures", voitures);
			
		}catch(SQLException e) {
			e.printStackTrace(); // Log l'erreur pour le débogage
			req.setAttribute("errorMessage", "Erreur lors de la récupération des voitures. Veuillez réessayer.");
		}
		req.getRequestDispatcher("liste.jsp").forward(req, res);
	}

}
