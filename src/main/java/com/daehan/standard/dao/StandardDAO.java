package com.daehan.standard.dao;

import java.util.HashMap;
import java.util.List;


public interface StandardDAO {
	public List<HashMap<String, String>> selectVendList() throws Exception;
	public void insertVend(HashMap<String, Object> map) throws Exception;
	public void deleteVend(HashMap<String, Object> map) throws Exception;
	
	public List<HashMap<String, String>> selectMaterialList() throws Exception;
	public void insertMaterial(HashMap<String, Object> map) throws Exception;
	public void deleteMaterial(HashMap<String, Object> map) throws Exception;
}
