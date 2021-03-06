/*
 * package com.laptrinhweb.converter;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Component;
 * 
 * import com.laptrinhweb.dto.CartDTO; import com.laptrinhweb.entity.CartEntity;
 * import com.laptrinhweb.repository.UserRepository;
 * 
 * @Component public class CartConverter {
 * 
 * @Autowired private UserRepository userRepository;
 * 
 * public CartDTO toDTO(CartEntity entity) { CartDTO cart = new CartDTO();
 * cart.setId(entity.getId()); cart.setBook_id(entity.getBook_id());
 * cart.setUser_id(entity.getUserEntity().getId());
 * cart.setQuantity(entity.getQuantity()); cart.setPrice(entity.getPrice());
 * return cart; }
 * 
 * public CartEntity toEntity(CartDTO dto) { CartEntity cart = new CartEntity();
 * cart.setBook_id(dto.getBook_id());
 * cart.setUserEntity(userRepository.findOne(dto.getUser_id()));
 * cart.setQuantity(dto.getQuantity()); cart.setPrice(dto.getPrice()); return
 * cart; } }
 */