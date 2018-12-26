package com.daehan.standard.dao.impl;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.daehan.common.dao.AbstractDAO;
import com.daehan.standard.dao.StandardDAO;

/**
 * @Class Name : StandardDAOImpl.java
 * @Description : 
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2018.12.26    김진환          최초 생성
 *
 *  
 */
@Repository
public class StandardDAOImpl extends AbstractDAO implements StandardDAO{
	private static final Logger logger = Logger.getLogger(StandardDAOImpl.class);

	@Override
	public void addVend(HashMap<String, Object> map) throws Exception {
		System.out.println("여까지오나?");
		
	}
}
