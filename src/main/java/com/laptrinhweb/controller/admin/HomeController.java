
package com.laptrinhweb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.dto.CheckoutDTO;
import com.laptrinhweb.service.ICartService;


@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@Autowired
	private ICartService cartService;
	
	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		List<CheckoutDTO> checkoutList = cartService.getAllCheckoutCart();
		int totalOrder = cartService.getCountCheckoutCart();
		ModelAndView mav = new ModelAndView("admin/dashboard");
		mav.addObject("checkoutList",checkoutList);
		mav.addObject("totalOrder",totalOrder);
		return mav;
	}
}
