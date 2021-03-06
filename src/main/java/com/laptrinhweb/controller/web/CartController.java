
package com.laptrinhweb.controller.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhweb.dto.CartDTO;
import com.laptrinhweb.service.impl.CartService;
import com.laptrinhweb.util.ValidationCartInfor;

@RestController

@RequestMapping("api")
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private ValidationCartInfor validation;

	@RequestMapping("addCart")
	public HashMap<Long, CartDTO> addCart(@RequestBody HashMap<String, String> addCartRequest, HttpSession session) {
		try {
			HashMap<Long, CartDTO> cartList = (HashMap<Long, CartDTO>) session.getAttribute("myCart");
			if (cartList == null) {
				cartList = new HashMap<Long, CartDTO>();
			}

			String keys[] = { "book_id", "quantity", "price" };
			if (validation.validationInformation(keys, addCartRequest)) {
				long book_id = Long.parseLong(addCartRequest.get("book_id"));
				Integer quantity = Integer.parseInt(addCartRequest.get("quantity"));
				double price = Double.parseDouble(addCartRequest.get("price"));
				cartList = cartService.addCart(book_id, quantity, price, cartList);
				session.setAttribute("myCart", cartList);
				session.setAttribute("totalPrice", cartService.getTotalPrice(cartList));
				return cartList;
			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("removeCart/{book_id}")
	public ResponseEntity<?> removeCart(@PathVariable("book_id") Long book_id, HttpSession session) {
		try {
			HashMap<Long, CartDTO> cartList = (HashMap<Long, CartDTO>) session.getAttribute("myCart");
			cartList = cartService.removeCart(book_id, cartList);
			session.setAttribute("myCart", cartList);
			session.setAttribute("totalPrice", cartService.getTotalPrice(cartList));
			return ResponseEntity.ok(cartList);
	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
