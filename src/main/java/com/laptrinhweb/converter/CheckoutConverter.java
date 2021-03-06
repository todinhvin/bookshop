
package com.laptrinhweb.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhweb.dto.CheckoutDTO;
import com.laptrinhweb.entity.CheckoutEntity;
import com.laptrinhweb.repository.UserRepository;
import com.laptrinhweb.service.IBookService;

@Component
public class CheckoutConverter {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private IBookService bookService;

	public CheckoutDTO toDTO(CheckoutEntity entity) {
		CheckoutDTO checkoutDTO = new CheckoutDTO();
		checkoutDTO.setId(entity.getId());
		checkoutDTO.setDelivery_address(entity.getDelivery_address());
		checkoutDTO.setNote(entity.getNote());
		checkoutDTO.setOrder_id(entity.getOrder_id());
		checkoutDTO.setOrder_date(entity.getOrder_date());
		checkoutDTO.setProduct_id(entity.getProduct_id());
		checkoutDTO.setQuantity(entity.getQuantity());
		checkoutDTO.setPrice(entity.getPrice());
		checkoutDTO.setUser_id(entity.getUserEntity1().getId());
		checkoutDTO.setUserDTO(userConverter.toDTO(entity.getUserEntity1()));
		checkoutDTO.setBookDTO(bookService.findOneById(entity.getProduct_id()));
		return checkoutDTO;
	}

	public CheckoutEntity toEntity(CheckoutDTO dto) {
		CheckoutEntity entity = new CheckoutEntity();
		entity.setDelivery_address(dto.getDelivery_address());
		entity.setNote(dto.getNote());
		entity.setOrder_id(dto.getOrder_id());
		entity.setOrder_date(dto.getOrder_date());
		entity.setProduct_id(dto.getProduct_id());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setUserEntity(userRepository.findOne(dto.getUser_id()));
		return entity;
	}
}
