package com.daehan.standard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daehan.standard.dao.StandardDAO;
import com.daehan.standard.service.StandardService;

/**
 * @Class Name : StandardServiceImpl.java
 * @Description : 기준관리 처리하는 비즈니스 구현 클래스 
 */
@Service("standardService")
public class StandardServiceImpl implements StandardService{
	@Autowired
	private StandardDAO standardDAO;

	@Override
	public List<HashMap<String, String>> searchVendList() throws Exception {
		return standardDAO.selectVendList();
	}
	
	@Override
	public void addVend(HashMap<String, Object> map) throws Exception {
		standardDAO.insertVend(map);
	}

	@Override
	public void deleteVend(HashMap<String, Object> map) throws Exception {
		standardDAO.deleteVend(map);
	}

	
}
