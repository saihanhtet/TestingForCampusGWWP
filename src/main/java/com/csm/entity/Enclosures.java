package com.csm.entity;

public class Enclosures {
	private int Enclosure_ID;
	public int getEnclosure_ID() {
		return Enclosure_ID;
	}
	public Enclosures(String enclosure_Type, String enclosure_Location) {
		super();
		Enclosure_Type = enclosure_Type;
		Enclosure_Location = enclosure_Location;
	}
	public void setEnclosure_ID(int enclosure_ID) {
		Enclosure_ID = enclosure_ID;
	}
	public String getEnclosure_Type() {
		return Enclosure_Type;
	}
	public void setEnclosure_Type(String enclosure_Type) {
		Enclosure_Type = enclosure_Type;
	}
	public String getEnclosure_Location() {
		return Enclosure_Location;
	}
	public void setEnclosure_Location(String enclosure_Location) {
		Enclosure_Location = enclosure_Location;
	}
	private String Enclosure_Type;
	private String Enclosure_Location;
}
