package com.my.app;

public class TestWeatherModel implements Comparable<TestWeatherModel> {
	String name;
	String hyeonjaeIlgi;
	String sijung;
	String unryang;
	String joonghaUnryang;
	String temp;
	String iseulTemp;
	String chegam;
	String ilGangsu;
	String jeokseol;
	String seupdo;
	String punghyang;
	String pungsok;
	String haemyeonGiap;

	public TestWeatherModel(String name, String hyeonjaeIlgi, String sijung, String unryang, String joonghaUnryang,
			String temp, String iseulTemp, String chegam, String ilGangsu, String jeokseol, String seupdo,
			String punghyang, String pungsok, String haemyeonGiap) {
		this.name = name;
		this.hyeonjaeIlgi = hyeonjaeIlgi;
		this.sijung = sijung;
		this.unryang = unryang;
		this.joonghaUnryang = joonghaUnryang;
		this.temp = temp;
		this.iseulTemp = iseulTemp;
		this.chegam = chegam;
		this.ilGangsu = ilGangsu;
		this.jeokseol = jeokseol;
		this.seupdo = seupdo;
		this.punghyang = punghyang;
		this.pungsok = pungsok;
		this.haemyeonGiap = haemyeonGiap;
	}

	public String getName() {
		return name;
	}

	public String getHyeonjaeIlgi() {
		return hyeonjaeIlgi;
	}

	public String getSijung() {
		return sijung;
	}

	public String getUnryang() {
		return unryang;
	}

	public String getJoonghaUnryang() {
		return joonghaUnryang;
	}

	public String getTemp() {
		return temp;
	}

	public String getIseulTemp() {
		return iseulTemp;
	}

	public String getChegam() {
		return chegam;
	}

	public String getIlGangsu() {
		return ilGangsu;
	}

	public String getJeokseol() {
		return jeokseol;
	}

	public String getSeupdo() {
		return seupdo;
	}

	public String getPunghyang() {
		return punghyang;
	}

	public String getPungsok() {
		return pungsok;
	}

	public String getHaemyeonGiap() {
		return haemyeonGiap;
	}

	@Override
	public String toString() {
		return "TestWeatherModel [지역명=" + name + ", 현재온도=" + temp + ", 체감온도=" + chegam + ", 습도=" + seupdo + "]";
	}

	@Override
	public int compareTo(TestWeatherModel o) {
		return this.name.compareTo(o.name);
	}

}