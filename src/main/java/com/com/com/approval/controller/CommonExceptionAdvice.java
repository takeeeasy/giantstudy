package com.com.com.approval.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@Controller
//public class CommonExceptionAdvice {
//
//	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
//
////	@ExceptionHandler(Exception.class)
//	public ModelAndView common(Exception e) {
//		logger.info(e.toString());
//
//    ModelAndView mv = new ModelAndView();
//    mv.setViewName("approval/error");
//    mv.addObject("exception", e);
//
//		return mv;
//	}
//}