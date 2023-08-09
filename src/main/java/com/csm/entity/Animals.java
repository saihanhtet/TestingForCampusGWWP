package com.csm.entity;

public class Animals {

	public int getAnimal_ID() {
		return Animal_ID;
	}
	public void setAnimal_ID(int animal_ID) {
		Animal_ID = animal_ID;
	}
	public String getAnimal_Name() {
		return Animal_Name;
	}
	public void setAnimal_Name(String animal_Name) {
		Animal_Name = animal_Name;
	}
	public String getAnimal_Gender() {
		return Animal_Gender;
	}
	public void setAnimal_Gender(String animal_Gender) {
		Animal_Gender = animal_Gender;
	}
	public String getYear_Arrive() {
		return Year_Arrive;
	}
	public void setYear_Arrive(String year_Arrive) {
		Year_Arrive = year_Arrive;
	}
	public int getKeeper_ID() {
		return Keeper_ID;
	}
	public void setKeeper_ID(int keeper_ID) {
		Keeper_ID = keeper_ID;
	}
	public int getDiet_ID() {
		return Diet_ID;
	}
	public void setDiet_ID(int diet_ID) {
		Diet_ID = diet_ID;
	}
	public int getEnclosure_ID() {
		return Enclosure_ID;
	}
	public void setEnclosure_ID(int enclosure_ID) {
		Enclosure_ID = enclosure_ID;
	}
	public int getSpecies_ID() {
		return Species_ID;
	}
	public void setSpecies_ID(int species_ID) {
		Species_ID = species_ID;
	}
	public String getKeeper_Name() {
		return Keeper_Name;
	}
	public void setKeeper_Name(String keeper_Name) {
		Keeper_Name = keeper_Name;
	}
	
	public Animals(String animal_Name, String animal_Gender, String year_Arrive, int keeper_ID,
			int diet_ID, int enclosure_ID, int species_ID) {
		super();
		Animal_Name = animal_Name;
		Animal_Gender = animal_Gender;
		Year_Arrive = year_Arrive;
		Keeper_ID = keeper_ID;
		Diet_ID = diet_ID;
		Enclosure_ID = enclosure_ID;
		Species_ID = species_ID;
	}
	public Animals(int animal_ID, String animal_Name, String year_Arrive, String animal_Gender, int keeper_Keeper_ID,String keeper_Name) {
		super();
		Animal_ID = animal_ID;
		Animal_Name = animal_Name;
		Year_Arrive = year_Arrive;
		Animal_Gender = animal_Gender;
		Keeper_ID = keeper_Keeper_ID;
		Keeper_Name = keeper_Name;
	}
	
	public Animals(String keeper_Name, int total_Animals) {
		super();
		Keeper_Name = keeper_Name;
		Total_Animals = total_Animals;
	}
	
	public int getTotal_Animals() {
		return Total_Animals;
	}
	public void setTotal_Animals(int total_Animals) {
		Total_Animals = total_Animals;
	}
	
	

	private int Animal_ID;
	private String Animal_Name;
	private String Animal_Gender;
	private String Year_Arrive;
	private int Keeper_ID;
	private int Diet_ID;
	private int Enclosure_ID;
	private int Species_ID;
	private String Keeper_Name;
	private int Total_Animals;
}
