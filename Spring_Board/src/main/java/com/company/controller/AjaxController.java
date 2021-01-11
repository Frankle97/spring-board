package com.company.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.SboardDto;
import com.company.service.SboardService;
@RequestMapping("/boardajax/*")
@Controller
public class AjaxController {
	@Autowired
	private SboardService service;
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	  @RequestMapping(value="/searchData", method = RequestMethod.GET)
	  @ResponseBody 
	  public List<SboardDto> searchData(@RequestParam("search") String search, Model model) throws Exception { 
		  SboardDto dto = new SboardDto();
		  dto.setBtitle(search);
		  return service.searchList(dto);
	  }
	 
}
