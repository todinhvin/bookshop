
package com.laptrinhweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhweb.converter.CheckoutConverter;
import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.dto.CartDTO;
import com.laptrinhweb.dto.CheckoutDTO;
import com.laptrinhweb.entity.CheckoutEntity;
import com.laptrinhweb.repository.CheckoutRepository;
import com.laptrinhweb.service.IBookService;
import com.laptrinhweb.service.ICartService;

@Service
public class CartService implements ICartService {

	@Autowired
	private IBookService bookService;
	
	@Autowired
	private CheckoutRepository checkoutRepo;
	
	@Autowired
	private CheckoutConverter checkoutConverter;

	@Override
	public HashMap<Long, CartDTO> addCart(long book_id, Integer quantity, double price, HashMap<Long, CartDTO> cart) {
		BookDTO book = bookService.findOneById(book_id);
		CartDTO cartDTO = new CartDTO();
		if (cart.containsKey(book_id)) {
			cartDTO = cart.get(book_id);
			cartDTO.setPrice(price);
			cartDTO.setQuantity(quantity);
		} else {
			cartDTO.setBook_id(book_id);
			cartDTO.setPrice(price);
			cartDTO.setQuantity(quantity);
			cartDTO.setBookDTO(book);
			cart.put(book_id, cartDTO);
		}
		return cart;
	}

	@Override
	public HashMap<Long, CartDTO> removeCart(long book_id, HashMap<Long, CartDTO> cart) {
		if (cart == null) {
			return cart;
		}
		cart.remove(book_id);
		return cart;
	}

	@Override
	public double getTotalPrice(HashMap<Long, CartDTO> cart) {
		double totalPrice = 0;
		for (Map.Entry<Long, CartDTO> item : cart.entrySet()) {
			totalPrice += item.getValue().getPrice() * item.getValue().getQuantity();
		}
		return totalPrice;
	}

	@Override
	public List<CheckoutDTO> saveProductForCheckout(List<CheckoutDTO> list) throws Exception {
		try {
			long userId = list.get(0).getUser_id();
			for (CheckoutDTO dto : list) {
				checkoutRepo.save(checkoutConverter.toEntity(dto));
			}
			List<CheckoutEntity> checkOutList = checkoutRepo.getCheckoutCartByUserId(userId);
			List<CheckoutDTO> results = new ArrayList<CheckoutDTO>();
			for (CheckoutEntity entity : checkOutList) {
				results.add(checkoutConverter.toDTO(entity));
			}
			return results;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public int getCountCheckoutCart() {
		return checkoutRepo.countCheckoutCart();
	}

	@Override
	public List<CheckoutDTO> getCheckoutCart(Long userId) {
		List<CheckoutEntity> entityList = checkoutRepo.getCheckoutCartByUserId(userId);
		List<CheckoutDTO> results = new ArrayList<CheckoutDTO>();
		for (CheckoutEntity entity : entityList) {
			results.add(checkoutConverter.toDTO(entity));
		}
		return results;
	}

	@Override
	public List<CheckoutDTO> getAllCheckoutCart() {
		List<CheckoutEntity> entityList = checkoutRepo.getAllCheckoutCart();
		List<CheckoutDTO> results = new ArrayList<CheckoutDTO>();
		for (CheckoutEntity entity : entityList) {
			results.add(checkoutConverter.toDTO(entity));
		}
		return results;
	}

	/*
	 * @Autowired private CartRepository cartRepository;
	 * 
	 * @Autowired private CartConverter cartConverter;
	 * 
	 * @Autowired private CheckoutRepository checkoutRepo;
	 * 
	 * @Autowired private UserRepository userRepository;
	 * 
	 * @Autowired private CheckoutConverter checkoutConverter;
	 * 
	 * @Override public List<CartDTO> addCartByUserIdAndProductId(long productId,
	 * long userId, Integer quantity, double price) throws Exception { try { if
	 * (cartRepository.getCartByUserIdAndProductId(userId, productId).isPresent()) {
	 * // throw new // Exception("Product is // already exist"); // CartEntity
	 * cartEntity // = cartRepository.getcartByUserIdAndProductId(userId,
	 * productId); cartEntity.setQuantity(quantity); cartEntity.setPrice(price);
	 * cartRepository.save(cartEntity); } else { CartEntity cartEntity = new
	 * CartEntity(); cartEntity.setBook_id(productId); //
	 * cartEntity.setUserEntity(userRepository.findOne(userId));
	 * cartEntity.setQuantity(quantity); cartEntity.setPrice(price);
	 * cartRepository.save(cartEntity); } return this.getCartByUserId(userId); }
	 * catch (Exception e) { throw new Exception(e.getMessage()); }
	 * 
	 * }
	 * 
	 * @Override public List<CartDTO> getCartByUserId(long userId) {
	 * 
	 * List<CartEntity> list = cartRepository.getCartByUserId(userId); List<CartDTO>
	 * listCart = new ArrayList<CartDTO>(); for (CartEntity cart : list) {
	 * listCart.add(cartConverter.toDTO(cart)); } return listCart; }
	 * 
	 * @Override public List<CartDTO> removeCartByUserId(long cartId, long userId) {
	 * cartRepository.deleteCartByIdAndUserId(userId, cartId); return
	 * this.getCartByUserId(userId); }
	 * 
	 * @Override public List<CheckoutDTO> saveProductForCheckout(List<CheckoutDTO>
	 * list) throws Exception { try { long userId = list.get(0).getUser_id(); for
	 * (CheckoutDTO dto : list) {
	 * checkoutRepo.save(checkoutConverter.toEntity(dto)); }
	 * cartRepository.deleteAllCartByUserId(userId); List<CheckoutEntity>
	 * checkOutList = checkoutRepo.getCheckoutCartByUserId(userId);
	 * List<CheckoutDTO> results = new ArrayList<CheckoutDTO>(); for (CheckoutEntity
	 * entity : checkOutList) { results.add(checkoutConverter.toDTO(entity)); }
	 * return results; } catch (Exception e) { throw new Exception(e.getMessage());
	 * } }
	 * 
	 * @Override public int getCountCheckoutCart() { return
	 * checkoutRepo.countCheckoutCart(); }
	 */

}
