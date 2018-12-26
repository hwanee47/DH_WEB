package com.daehan.standard.dao;

import java.util.HashMap;
import java.util.List;


public interface StandardDAO {
	public List<HashMap<String, String>> selectVendList() throws Exception;
	public void insertVend(HashMap<String, Object> map) throws Exception;
}
