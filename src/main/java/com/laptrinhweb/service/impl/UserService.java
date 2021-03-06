package com.laptrinhweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhweb.entity.RoleEntity;
import com.laptrinhweb.entity.UserEntity;
import com.laptrinhweb.repository.UserRepository;
import com.laptrinhweb.service.IUserService;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserRepository userRepository;

	public boolean checkAccountExists(String username, String email) {
		if (userRepository.checkAccountExists(email, username).isPresent()) {
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public UserEntity addUser(String fullname, String username, String password, String email, String phonenumber) {
		UserEntity userEntity = new UserEntity();
		List<RoleEntity> roles = new ArrayList<RoleEntity>();
		RoleEntity role = new RoleEntity();
		role.setCode("USER");
		role.setRole("Người dùng");
		roles.add(role);
		userEntity.setFullName(fullname);
		userEntity.setUserName(username);
		userEntity.setPassword(password);
		userEntity.setEmail(email);
		userEntity.setPhoneNumber(phonenumber);
		userEntity.setStatus(1);
		userEntity.setRoles(roles);
		return userRepository.save(userEntity);
	}
}
