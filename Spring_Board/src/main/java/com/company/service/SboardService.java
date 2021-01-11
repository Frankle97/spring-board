package com.company.service;

import java.util.List;

import com.company.dto.SboardDto;

public interface SboardService {
	public int insert(SboardDto dto) throws Exception;
	public List<SboardDto> showList() throws Exception;
	public List<SboardDto> searchList(SboardDto dto) throws Exception;
	public SboardDto detail(SboardDto dto) throws Exception;
	public int hit_up(SboardDto dto) throws Exception;
	public int update(SboardDto dto) throws Exception;
	public int delete(SboardDto dto) throws Exception;
}
