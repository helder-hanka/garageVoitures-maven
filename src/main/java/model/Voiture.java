package model;

public class Voiture {
	
private String immatriculation;
private String marque;
private String modele;
private String etat;

	public Voiture(String immatriculation, String marque, String modele, String etat) {
		this.immatriculation = immatriculation;
		this.marque = marque;
		this.modele = modele;
		this.etat = etat;
	}

	public String getImmatriculation() {
		return immatriculation;
	}

	public void setImmatriculation(String immatriculation) {
		this.immatriculation = immatriculation;
	}

	public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

	public String getModele() {
		return modele;
	}

	public void setModele(String modele) {
		this.modele = modele;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}
	
	 public String toString() {
	      return "Voiture{Immatriculation=" + this.immatriculation + ", marque='" + this.marque + "', modele='" + this.modele + "', etat=" + this.etat + "}";
	   }

}
