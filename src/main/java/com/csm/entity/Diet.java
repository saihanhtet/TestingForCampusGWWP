package com.csm.entity;

public class Diet {
	private int Diet_Id;
	private String Diet_Type;
	private int No_Of_Feed;
	public int getDiet_Id() {
		return Diet_Id;
	}
	public void setDiet_Id(int diet_Id) {
		Diet_Id = diet_Id;
	}
	public Diet(String diet_Type, int no_Of_Feed) {
		super();
		Diet_Type = diet_Type;
		No_Of_Feed = no_Of_Feed;
	}
	public String getDiet_Type() {
		return Diet_Type;
	}
	public void setDiet_Type(String diet_Type) {
		Diet_Type = diet_Type;
	}
	public int getNo_Of_Feed() {
		return No_Of_Feed;
	}
	public void setNo_Of_Feed(int no_Of_Feed) {
		No_Of_Feed = no_Of_Feed;
	}

	
}
