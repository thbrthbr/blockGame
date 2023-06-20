package com.thl.model;

public class member {
	private int idnum;
	private String name;
	private String password;
	private String record;
	private int trial;
	private String email;
	public int getIdnum() {
		return idnum;
	}
	public void setIdnum(int idnum) {
		this.idnum = idnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public int getTrial() {
		return trial;
	}
	public void setTrial(int trial) {
		this.trial = trial;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password
				+ ", record=" + record + ", try=" + trial + ", email="
				+ email + "]";
	}
	

}
