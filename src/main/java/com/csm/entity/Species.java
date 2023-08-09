package com.csm.entity;

public class Species {
	private int Species_ID;
	private String Species_Type;
	private String Species_GP;
	private String Species_Lifestyle;
	public Species(String species_Type, String species_GP, String species_Lifestyle,
			String conservationStatus) {
		super();
		Species_Type = species_Type;
		Species_GP = species_GP;
		Species_Lifestyle = species_Lifestyle;
		ConservationStatus = conservationStatus;
	}
	public int getSpecies_ID() {
		return Species_ID;
	}
	public void setSpecies_ID(int species_ID) {
		Species_ID = species_ID;
	}
	public String getSpecies_Type() {
		return Species_Type;
	}
	public void setSpecies_Type(String species_Type) {
		Species_Type = species_Type;
	}
	public String getSpecies_GP() {
		return Species_GP;
	}
	public void setSpecies_GP(String species_GP) {
		Species_GP = species_GP;
	}
	public String getSpecies_Lifestyle() {
		return Species_Lifestyle;
	}
	public void setSpecies_Lifestyle(String species_Lifestyle) {
		Species_Lifestyle = species_Lifestyle;
	}
	public String getConservationStatus() {
		return ConservationStatus;
	}
	public void setConservationStatus(String conservationStatus) {
		ConservationStatus = conservationStatus;
	}
	private String ConservationStatus;
}
