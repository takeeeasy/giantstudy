package com.com.com.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.com.com.approval.service.serviceImpl.ApprovalServiceImpl;

@Controller
public class ApprovalController {
	@Resource(name = "ApprovalService")
	private ApprovalServiceImpl approvalService;
	
	@RequestMapping("login")
	public String login() 
	{
		return "approval/login";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(@RequestParam Map<String, Object> map, HttpSession session )
	{
		
		if (map.toString() == "{}") {
			System.out.println("ininin");
			session.invalidate();
			return "approval/loginProc";
		}
		else {
			
			List <Map<String, Object>> list = new ArrayList<Map <String, Object>>();
			list = approvalService.login(map); // 
			if(list.size() > 0) {
				Map <String, Object> loginMap = new HashMap<String, Object>();
				loginMap.put("memName", list.get(0).get("memName"));
				loginMap.put("memRank", list.get(0).get("memRank"));
				loginMap.put("memId", list.get(0).get("memId"));
				loginMap.put("memPass", list.get(0).get("memPass"));
				Map <String, Object> adminMap = (Map<String, Object>) approvalService.isAdminList(loginMap);
				
//				loginMap.put("memRank", adminMap.toString() == "{}" ? list.get(0).get("memRank") : adminMap.get("adminRank"));
				System.out.println(adminMap == null);
				loginMap.put("adminRank", adminMap == null ? "" : adminMap.get("adminRank"));
				
				session.setAttribute("getMember", loginMap);
			}
			
			return "approval/loginProc";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) 
	{
		session.invalidate(); 
		return "redirect:/login";
	}
	
	
	@RequestMapping(value = "applist", produces = "application/text; charset=utf8")
	public String appList(Model model, HttpSession session, @RequestParam Map<String, Object> map)
	{
		
		if (session.getAttribute("getMember") == null) {
			return "redirect:/loginProc"; 
		}
		else {
			
			Map <String, Object> sessionMap = (Map)session.getAttribute("getMember");
			int seq = approvalService.selectSeq();
			
			List <Map <String, Object>> list = approvalService.selectList(sessionMap);
			Map <String, Object> adminMap = (Map<String, Object>) approvalService.isAdminList(sessionMap);
			
			if (adminMap != null) { 
			model.addAttribute("getIsAdmin", adminMap);
			}
			model.addAttribute("getList", list);
			model.addAttribute("maxSeq", seq);
			return "approval/appList";
		}
	}
	
	@RequestMapping("insertContent")
	public String writeView(Model model, @RequestParam int seq) throws Exception
	{
		
		return "approval/writeAndView";
	}
	
	@RequestMapping("viewContent")
	public String viewContent(Model model, @RequestParam Map <String, Object> map)
	{
		
		System.out.println(map.get("seq")+", "+map.get("status"));
		
		List <Map <String, Object>> historyList = approvalService.selectHistory(map);
		Map<String, Object> contentList = approvalService.selectContent(map).get(0);
		
		model.addAttribute("content", contentList);
		model.addAttribute("history", historyList);
		return "approval/writeAndView";
	}
	
	@RequestMapping("insertList")
	public String approve(@RequestParam Map<String, Object> map)
	{
		
		approvalService.insertList(map);
		approvalService.insertHistory(map);
		return "redirect:/applist";
	}
	
	@RequestMapping("updateList")
	public ModelAndView updateList(@RequestParam Map<String, Object> map, 
			HttpServletRequest request,
			ModelAndView mv)
	{
//		"aprvName"
		approvalService.updateList(map);
		approvalService.insertHistory(map);
		mv.setViewName("redirect:/applist");
//		mv.addObject("aprvName", URLEncoder.encode(map.get("aprvName").toString(), "UTF-8"));
		return mv;
	}
	
	@RequestMapping("updateHistory")
	public String updateHistory(@RequestParam Map<String, Object> map)
	{
		
		approvalService.updateHistory(map);
		return "redirect:/applist";
	}
	
	@RequestMapping("popup")
	public String popup(Model model, HttpSession session) {
		
		Map <String, Object> sessionMap = (Map)session.getAttribute("getMember");
		List <Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = approvalService.selectMember(sessionMap);
		model.addAttribute("member", list);
		return "approval/popup";
	}
	
	@RequestMapping("insertAdmin")
	public String insertAdmin(@RequestParam Map<String, Object> map) {
		System.out.println("in");
		String[] memName = map.get("memName").toString().split(":");
		map.put("memName", memName[0]);
		approvalService.insertAdmin(map);
		
		return "approval/popup";
	}
	
	
}
