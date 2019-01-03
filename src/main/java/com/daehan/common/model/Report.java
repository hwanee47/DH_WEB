package com.daehan.common.model;

import java.util.HashMap;
import java.util.List;

public class Report {
	String test;
	List<HashMap<String,String>> list;
	
	
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public List<HashMap<String, String>> getList() {
		return list;
	}
	public void setList(List<HashMap<String, String>> list) {
		this.list = list;
	}
	
	
}
