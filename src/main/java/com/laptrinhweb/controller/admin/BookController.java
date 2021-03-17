package com.laptrinhweb.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.service.IBookService;
import com.laptrinhweb.service.ICategoryService;
import com.laptrinhweb.util.MessageUtils;

@Controller
public class BookController {
	
	@Autowired
	private IBookService bookService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtils messageUtils;
	
	@RequestMapping(value ="/quan-tri/danh-sach",method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam(value = "page",required = false) Integer page
			,@RequestParam(value = "limit",required = false) Integer limit,
			@RequestParam(value = "message", required = false) String message) {
		BookDTO book  =new BookDTO();
		book.setPage(page);
		book.setLimit(limit);
		Pageable pageable = new PageRequest(page-1, limit);
		book.setList(bookService.findAll(pageable));
		book.setTotalPages((int)Math.ceil((double)bookService.getTotalItems()/limit));
		ModelAndView mav = new ModelAndView("admin/database");
		mav.addObject("book", book);
		if(message!=null) {
			Map<String, String> messages = messageUtils.getMessage(message);
			mav.addObject("arlet",messages.get("arlet"));
			mav.addObject("message",messages.get("message"));
		}
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/chinh-sua",method = RequestMethod.GET)
	public ModelAndView editPage(@RequestParam(value = "id",required = false)Long id,
			@RequestParam(value = "message", required = false) String message) {
		BookDTO book = new BookDTO();
		if(id!=null) {
			book = bookService.findOneById(id);
		}
		Map<String, String> categories = categoryService.getCategoryList();
		
		ModelAndView mav = new ModelAndView("admin/formInput");
		mav.addObject("categories",categories);
		mav.addObject("book", book);
		if(message!=null) {
			Map<String, String> messages = messageUtils.getMessage(message);
			mav.addObject("arlet",messages.get("arlet"));
			mav.addObject("message",messages.get("message"));
		}
		return mav;
	}

	@RequestMapping(value = "/quan-tri/xoa-bai-viet")
	public ModelAndView deleteBook(@RequestParam(value = "id") Long id) {
		bookService.deleteBook(id);
		ModelAndView mav  = new ModelAndView("redirect:/quan-tri/danh-sach?page=1&limit=2&message=deleteSuccess");
		return mav;
	}
}
