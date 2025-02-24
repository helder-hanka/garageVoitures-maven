package dao;

import java.sql.SQLException;
import java.util.List;

import model.Voiture;

public interface VoitureDAO {
	void ajouter(Voiture var1) throws SQLException;

	String modifier(Voiture var1) throws SQLException;

	Voiture trouverParImmat(String var1) throws SQLException;

	List<Voiture>lister() throws SQLException;

	void supprime(String var1) throws SQLException;
}
