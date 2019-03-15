package com.com.com.approval.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.com.com.approval.service.serviceImpl.ApprovalServiceImpl;


@Controller
public class AjaxController {
	@Resource(name = "ApprovalService")
	private ApprovalServiceImpl approvalService;
	
	@RequestMapping("ajaxSelect")
	public String ajaxSelect(@RequestParam Map<String, Object> map, Model model)
	{
		List <Map<String, Object>> list = new ArrayList<Map <String, Object>>();
		list = approvalService.ajaxList(map);
		model.addAttribute("getList", list);
		return "approval/ajaxSelect";
	}
	
	@RequestMapping("aprvSearch")
	public String searchList(@RequestParam Map<String, Object> map, Model model, HttpSession session)
	{
		Map <String, Object> sessionMap = (Map)session.getAttribute("getMember");
		System.out.println("in");
		int seq = approvalService.selectSeq();
		
		List <Map <String, Object>> list = new ArrayList<Map <String, Object>>();
		Map <String, Object> adminMap = (Map<String, Object>) approvalService.isAdminList(sessionMap);
		
		if (adminMap != null) { 
		model.addAttribute("getIsAdmin", adminMap);
		}
		list = approvalService.searchList(map);
		
		model.addAttribute("maxSeq", seq);
		model.addAttribute("getList", list);
		return "approval/appList";
	}
	
	
	@RequestMapping("apilogin")
	public String writeView(Model model, @RequestParam Map<String, Object> map)
	{
		System.out.println("in");
		return "approval/apilogin";
	}
}
