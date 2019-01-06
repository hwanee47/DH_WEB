package com.daehan.common.model;

import java.util.HashMap;
import java.util.List;

public class Report {
	String vendName;
	String remark;
	List<HashMap<String,String>> list;
	
	
	public String getVendName() {
		return vendName;
	}
	public void setVendName(String vendName) {
		this.vendName = vendName;
	}
	public List<HashMap<String, String>> getList() {
		return list;
	}
	public void setList(List<HashMap<String, String>> list) {
		this.list = list;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
