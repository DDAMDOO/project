package com.my.app;

public class MountainDetailModel {
	String temperature;
	String humidity;
	String direction;
	String speed;
	
	public MountainDetailModel(String temperature, String humidity, String direction, String speed) {
		this.temperature = temperature;
		this.humidity = humidity;
		this.direction = direction;
		this.speed = speed;
	}
	public String getTemperature() {
		return temperature;
	}
	public String getHumidity() {
		return humidity;
	}
	public String getDirection() {
		return direction;
	}
	public String getSpeed() {
		return speed;
	}
	@Override
	public String toString() {
		return "MountainDetailModel [temperature=" + temperature + ", humidity=" + humidity + ", direction=" + direction
				+ ", speed=" + speed + "]";
	}
	
}