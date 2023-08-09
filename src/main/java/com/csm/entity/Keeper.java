package com.csm.entity;

public class Keeper {
	private int Keeper_ID;
	private String Keeper_Name;
	private String Keeper_DOB;
	private String Keeper_Rank;
	public int getKeeper_ID() {
		return Keeper_ID;
	}
	public void setKeeper_ID(int keeper_ID) {
		Keeper_ID = keeper_ID;
	}
	public String getKeeper_Name() {
		return Keeper_Name;
	}
	public void setKeeper_Name(String keeper_Name) {
		Keeper_Name = keeper_Name;
	}
	public String getKeeper_DOB() {
		return Keeper_DOB;
	}
	public void setKeeper_DOB(String keeper_DOB) {
		Keeper_DOB = keeper_DOB;
	}
	public String getKeeper_Rank() {
		return Keeper_Rank;
	}
	public void setKeeper_Rank(String keeper_Rank) {
		Keeper_Rank = keeper_Rank;
	}
	public Keeper(String keeper_Name, String keeper_DOB, String keeper_Rank) {
		super();
		Keeper_Name = keeper_Name;
		Keeper_DOB = keeper_DOB;
		Keeper_Rank = keeper_Rank;
	}
	
	
	
}
