package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Voiture;
import utils.DBDConnection;

public class VoitureDAOImpl implements VoitureDAO {

	private static final Logger logger = Logger.getLogger(VoitureDAOImpl.class.getName());
	private static final String INSERT_SQL = "INSERT INTO Voiture (immatriculationId, marque, modele, etat) VALUES (?, ?, ?,?)";
	private static final String UPDATE_SQL = "UPDATE Voiture SET marque=?, modele=?, etat=? WHERE immatriculationId=?";
	private static final String DELETE_SQL = "DELETE FROM Voiture WHERE immatriculationId=?";
	private static final String SELECT_SQL = "SELECT * FROM Voiture WHERE immatriculationId=?";
	private static final String SELECT_ALL_SQL = "SELECT * FROM Voiture";

	@Override
	public void ajouter(Voiture voiture) throws SQLException {

		try (Connection conn = DBDConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
			stmt.setString(1, voiture.getImmatriculation());
			stmt.setString(2, voiture.getMarque());
			stmt.setString(3, voiture.getModele());
			stmt.setString(4, voiture.getEtat());
			stmt.executeUpdate();
		}

	}

	@Override
	public String modifier(Voiture voiture) {
		try (Connection conn = DBDConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(UPDATE_SQL)) {
			ps.setString(1, voiture.getMarque().trim());
			ps.setString(2, voiture.getModele().trim());
			ps.setString(3, voiture.getEtat().trim());
			ps.setString(4, voiture.getImmatriculation().trim().toUpperCase());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				return "Modification réussie.";
			} else {
				return "Erreur : Aucun enregistrement trouvé pour cette immatriculation.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Erreur lors de la modification de la voiture.";
		}

	}

	@Override
	public Voiture trouverParImmat(String immatriculation) throws SQLException {

		try (Connection conn = DBDConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(SELECT_SQL)) {

			ps.setString(1, immatriculation);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Voiture(rs.getString("immatriculationId"), rs.getString("marque"),
							rs.getString("modele"), rs.getString("etat"));
				}
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, null + "trouverParId", e);
		}
		return null;
	}

	@Override
	public List<Voiture> lister() throws SQLException {
		List<Voiture> voitures = new ArrayList<>();
		voitures.clear();
		try (Connection conn = DBDConnection.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SQL);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Voiture voiture = new Voiture(rs.getString("immatriculationId"), rs.getString("marque"),
						rs.getString("modele"), rs.getString("etat"));
				voitures.add(voiture);
			}

		}
		return voitures;
	}

	@Override
	public void supprime(String immatriculation) throws SQLException {
		try (Connection conn = DBDConnection.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(DELETE_SQL);

			ps.setString(1, immatriculation);
			ps.executeUpdate();
		}

	}

}
