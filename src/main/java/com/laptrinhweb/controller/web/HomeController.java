package com.laptrinhweb.controller.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.service.IBookService;
import com.laptrinhweb.util.MessageUtils;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IBookService bookService;
	
	@Autowired
	private MessageUtils messageUtils;
	
	@RequestMapping(value = "/trang-chu",method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("/web/home");
		int totalBook = bookService.getCountBook();
		List<BookDTO> newBooks =bookService.getNewBooks(6,totalBook-6);
		List<BookDTO> bookList = bookService.findAll();
		mav.addObject("newBooks", newBooks);
		mav.addObject("bookList", bookList);
		return mav;
	}
	
	
	@RequestMapping(value = "/dang-nhap",method = RequestMethod.GET)
	public ModelAndView loginPage(@RequestParam(value = "message",required = false) String message) {
		ModelAndView mav = new ModelAndView("/web/login");
		if(message!=null) {
			Map<String, String> messages = messageUtils.getMessage(message);
			mav.addObject("arlet",messages.get("arlet"));
			mav.addObject("message",messages.get("message"));
		}
		return mav;
	}

	
	@RequestMapping(value = "/thoat",method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		ModelAndView mav = new ModelAndView("redirect:/trang-chu");
		return mav;
	}
	
	@RequestMapping(value = "/accessDenied",method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView("redirect:/dang-nhap?accessDenied");
		return mav;
	}
}
