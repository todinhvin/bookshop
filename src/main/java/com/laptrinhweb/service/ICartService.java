
package com.laptrinhweb.service;

import java.util.HashMap;
import java.util.List;

import com.laptrinhweb.dto.CartDTO;
import com.laptrinhweb.dto.CheckoutDTO;

public interface ICartService {
	
	public HashMap<Long, CartDTO> addCart(long book_id, Integer quantity, double price, HashMap<Long, CartDTO> cart);
	public HashMap<Long, CartDTO> removeCart(long book_id, HashMap<Long, CartDTO> cart);
	public double getTotalPrice(HashMap<Long, CartDTO> cart);
	List<CheckoutDTO> saveProductForCheckout(List<CheckoutDTO> list) throws Exception;
	int getCountCheckoutCart();
	public List<CheckoutDTO> getCheckoutCart(Long userId);
	public List<CheckoutDTO> getAllCheckoutCart();
}
