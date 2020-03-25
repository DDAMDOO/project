package com.my.app;

public class MountainBaseModel {
	String city;
	String MountName;
	String MountNum;
	
	public MountainBaseModel(String city, String mountName, String mountNum) {
		this.city = city;
		MountName = mountName;
		MountNum = mountNum;
	}
	public String getCity() {
		return city;
	}
	public String getMountName() {
		return MountName;
	}
	public String getMountNum() {
		return MountNum;
	}
	@Override
	public String toString() {
		return "MountainBaseModel [city=" + city + ", MountName=" + MountName + ", MountNum=" + MountNum + "]";
	}
	
}