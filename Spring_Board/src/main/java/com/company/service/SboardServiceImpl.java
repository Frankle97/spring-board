package com.company.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dao.SboardDao;
import com.company.dto.SboardDto;

@Repository
public class SboardServiceImpl implements SboardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SboardDao dao;
	
	private static final String namespace="com.company.mapper.SboardMapper";
	
	@Override
	public int insert(SboardDto dto) throws Exception {
		return sqlSession.insert(namespace + ".insert", dto);
	}

	@Override
	public List<SboardDto> showList() throws Exception {
		return sqlSession.selectList(namespace + ".showList");
	}
	
	@Override
	public List<SboardDto> searchList(SboardDto dto) throws Exception {
		return dao.searchList(dto);
	}

	@Override
	public SboardDto detail(SboardDto dto) throws Exception {
		return sqlSession.selectOne(namespace + ".detail", dto);
	}
	
	@Override
	public int update(SboardDto dto) throws Exception {
		return sqlSession.update(namespace + ".update", dto);
	}

	@Override
	public int delete(SboardDto dto) throws Exception {
		return sqlSession.delete(namespace + ".delete", dto);
	}

	@Override
	public int hit_up(SboardDto dto) throws Exception {
		return sqlSession.update(namespace + ".hit_up", dto);
	}

}
