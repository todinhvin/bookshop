
package com.laptrinhweb.controller.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhweb.dto.CartDTO;
import com.laptrinhweb.dto.CheckoutDTO;
import com.laptrinhweb.service.impl.CartService;
import com.laptrinhweb.util.SecurityUtils;
import com.laptrinhweb.util.ValidationCartInfor;

@RestController

@RequestMapping("api/order")
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private ValidationCartInfor validation;

	@RequestMapping("checkout_order")
	public ResponseEntity<?> addCheckoutCart(@RequestBody HashMap<String, String> checkoutRequest,HttpSession session) {

		try {
			String keys[] = {"deliveryAddress", "note" };
			Long userId = SecurityUtils.getPrincipal().getUserId();
			if (validation.validationInformation(keys, checkoutRequest)) {
				HashMap<Long,CartDTO> cartList=(HashMap<Long,CartDTO>)session.getAttribute("myCart");
				List<CheckoutDTO> checkoutList = new ArrayList<>();
				for (Map.Entry<Long, CartDTO> item : cartList.entrySet()) {
					String orderId = "" + getOrderId();
					CheckoutDTO checkoutDTO = new CheckoutDTO();
					checkoutDTO.setUser_id(userId);
					checkoutDTO.setOrder_id(orderId);
					checkoutDTO.setDelivery_address(checkoutRequest.get("deliveryAddress"));
					checkoutDTO.setNote(checkoutRequest.get("note"));
					checkoutDTO.setProduct_id(item.getValue().getBook_id());
					checkoutDTO.setPrice(item.getValue().getPrice());
					checkoutDTO.setQuantity(item.getValue().getQuantity());
					checkoutDTO.setOrder_date(new Date());
					checkoutList.add(checkoutDTO);
				}
				cartService.saveProductForCheckout(checkoutList);
				session.removeAttribute("myCart");
				session.removeAttribute("totalPrice");
				return ResponseEntity.ok(cartList);
			} else {
				return ResponseEntity.badRequest().body("");
			}


		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().body("");
		}

	}

	public int getOrderId() {
		Random r = new Random(System.currentTimeMillis());
		return 10000 + r.nextInt(20000);
	}

}
