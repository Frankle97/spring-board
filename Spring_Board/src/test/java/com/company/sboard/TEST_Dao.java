package com.company.sboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.company.dao.SboardDao;
import com.company.dto.SboardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class TEST_Dao {
	@Autowired
	private SboardDao dao;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Test
	@Rollback(false)
	public void test() throws Exception {
		SboardDto dto = new SboardDto();
		dto.setBtitle("r");
		System.out.println(dao.searchList(dto));
	}

}
