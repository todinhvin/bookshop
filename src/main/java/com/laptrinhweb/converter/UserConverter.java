package com.laptrinhweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhweb.dto.UserDTO;
import com.laptrinhweb.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDTO(UserEntity entity) {
		UserDTO userDTO = new UserDTO();
		userDTO.setId(entity.getId());
		userDTO.setEmail(entity.getEmail());
		userDTO.setFullName(entity.getFullName());
		userDTO.setPhoneNumber(entity.getPhoneNumber());
		userDTO.setUserName(entity.getUserName());
		return userDTO;
	}
}
