package com.laptrinhweb.controller.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.dto.CartDTO;
import com.laptrinhweb.dto.CategoryDTO;
import com.laptrinhweb.service.IBookService;
import com.laptrinhweb.service.ICartService;
import com.laptrinhweb.service.ICategoryService;
import com.laptrinhweb.service.impl.BookService;
import com.laptrinhweb.util.MessageUtils;
import com.laptrinhweb.util.SecurityUtils;

@Controller
public class ShopController {

	@Autowired
	private IBookService bookService;

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private ICartService cartService;

	@Autowired
	private MessageUtils messageUtils;

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam(value = "page", required = true) Integer page,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "theloai", required = false) String theloai) {
		BookDTO book = new BookDTO();
		book.setPage(page);
		book.setLimit(12);
		Pageable pageable = new PageRequest(page - 1, 12);
		ModelAndView mav = new ModelAndView("web/shop");
		if (theloai == null) {
			book.setList(bookService.findAll(pageable));
			book.setTotalPages((int) Math.ceil((double) bookService.getTotalItems() / 12));
		} else {
			CategoryDTO category = categoryService.findOneByCategoryCode(theloai);
			book.setList(bookService.getBooksByCategoryId(12, (page - 1) * 12, category.getId()));
			book.setTotalPages((int) Math.ceil((double) bookService.getCountByCategoryCode(theloai) / 12));
		}
		Map<CategoryDTO, Integer> category = new HashMap<>();
		List<CategoryDTO> categoryList = categoryService.findAll();
		for (CategoryDTO dto : categoryList) {
			category.put(dto, bookService.getCountByCategoryCode(dto.getCode()));
		}
		mav.addObject("theloai", theloai);
		mav.addObject("book", book);
		mav.addObject("category", category);
		if (message != null) {
			Map<String, String> messages = messageUtils.getMessage(message);
			mav.addObject("arlet", messages.get("arlet"));
			mav.addObject("message", messages.get("message"));
		}
		return mav;
	}

	@RequestMapping(value = "/shop-details", method = RequestMethod.GET)
	public ModelAndView bookDetails(@RequestParam(value = "id", required = true) Long id) {
		BookDTO bookDTO = bookService.findOneById(id);
		ModelAndView mav = new ModelAndView("web/product_details");
		mav.addObject("book", bookDTO);
		return mav;
	}

	@RequestMapping(value = "/checkout-cart", method = RequestMethod.GET)
	public ModelAndView checkoutCart(HttpSession session) {
		if(!SecurityUtils.isLogged()) {
			ModelAndView mav = new ModelAndView("redirect:/dang-nhap");
			return mav;
		}
		HashMap<Long,CartDTO> cartList=(HashMap<Long,CartDTO>)session.getAttribute("myCart");
		if(cartList ==null) {
			ModelAndView mav = new ModelAndView("redirect:/shop?page=1");
			return mav;
		}
		ModelAndView mav = new ModelAndView("web/checkout");
		return mav;
	}

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView Cart() {
		ModelAndView mav = new ModelAndView("web/cart");
		return mav;
	}

}
