package com.company.controller;

import java.io.File;
import java.net.InetAddress;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.dto.SboardDto;
import com.company.service.SboardService;
@RequestMapping("/board/*")
@Controller
public class SboardController {
	@Autowired
	private SboardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(SboardController.class);
	
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String write() throws Exception {
		return "/board/board_write";
	}
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String writeAct(MultipartFile file, HttpServletRequest request, SboardDto dto, RedirectAttributes rttr) throws Exception {
		String res = "fail";

		dto.setBip(InetAddress.getLocalHost().getHostAddress());
		UUID uid = UUID.randomUUID();
		String filename = uid.toString() + "_" + file.getOriginalFilename();
		String uploadpath = request.getSession().getServletContext().getRealPath("/") + "/upload";
		File target = new File(uploadpath, filename);
		FileCopyUtils.copy(file.getBytes(), target);
		dto.setImage(filename);
		
		if (service.insert(dto) > 0 ) {
			res = "success";
			rttr.addFlashAttribute("insert", res);
		} 
		return "redirect:/board/showList";
	}
	public void imageName() {
		
	}
	@RequestMapping(value = "/showList", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		model.addAttribute("list", service.showList());
		return "/board/list";
	}
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public String detail(SboardDto dto, Model model) throws Exception {
		model.addAttribute("boardVO", service.detail(dto));
		service.hit_up(dto);
		return "/board/board_detail";
	}
	@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
	public String delete(SboardDto dto, Model model) throws Exception {
		model.addAttribute("boardVO", service.detail(dto));
		return "/board/board_delete";
	}
	@RequestMapping(value = "/board_delete", method = RequestMethod.POST)
	public String deleteAction(SboardDto dto, RedirectAttributes rttr) throws Exception {
		String res = "fail";
		if (service.delete(dto) > 0 ) {
			res = "success";
			rttr.addFlashAttribute("delete", res);
		}
		return "redirect:/board/showList";
	}
	@RequestMapping(value = "/board_modify", method = RequestMethod.GET)
	public String modify(SboardDto dto, Model model) throws Exception {
		model.addAttribute("boardVO", service.detail(dto));
		return "/board/board_modify";
	}
	@RequestMapping(value = "/board_modify", method = RequestMethod.POST)
	public String modifyAct(MultipartFile file, HttpServletRequest request, SboardDto dto, RedirectAttributes rttr) throws Exception {
		String res = "fail";
		
		UUID uid = UUID.randomUUID();
		String filename = uid.toString() + "_" + file.getOriginalFilename();
		String uploadpath = request.getSession().getServletContext().getRealPath("/") + "/upload";
		File target = new File(uploadpath, filename);
		FileCopyUtils.copy(file.getBytes(), target);
		System.out.println(uid.toString().length());
		if (file.getOriginalFilename() != "") {
			dto.setImage(filename);
		} else {
			dto.setImage(request.getParameter("img"));
		}
		
		if (service.update(dto) > 0 ) {
			res = "success";
			rttr.addFlashAttribute("update", res);
		} 
		return "redirect:/board/showList";
	}
	 
}
