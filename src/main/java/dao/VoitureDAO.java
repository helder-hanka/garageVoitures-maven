package dao;

import java.sql.SQLException;
import java.util.List;

import model.Voiture;

public interface VoitureDAO {
	void ajouter(Voiture var1) throws SQLException;
	void modifier(Voiture var1) throws SQLException;
	Voiture trouverParId(String var1) throws SQLException;
	List<Voiture> lister() throws SQLException;
	void supprime(String var1) throws SQLException;
}
