package com.daehan.standard.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daehan.standard.dao.StandardDAO;
import com.daehan.standard.service.StandardService;

/**
 * @Class Name : StandardServiceImpl.java
 * @Description : 기준관리 처리하는 비즈니스 구현 클래스 
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2018.12.26    김진환          최초 생성
 *
 *  
 */
@Service("standardService")
public class StandardServiceImpl implements StandardService{
	@Autowired
	private StandardDAO standardDAO;

	@Override
	public void addVend(HashMap<String, Object> map) throws Exception {
		standardDAO.addVend(map);
	}
}
