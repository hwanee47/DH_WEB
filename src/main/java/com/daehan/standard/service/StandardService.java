package com.daehan.standard.service;

import java.util.HashMap;
import java.util.List;


public interface StandardService {
	public List<HashMap<String, String>> searchVendList() throws Exception;
	public void addVend(HashMap<String, Object> map) throws Exception;
	public void deleteVend(HashMap<String, Object> map) throws Exception;
}
