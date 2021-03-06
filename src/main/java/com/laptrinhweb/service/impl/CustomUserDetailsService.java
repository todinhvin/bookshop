package com.laptrinhweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhweb.constant.SystemConstant;
import com.laptrinhweb.dto.MyUser;
import com.laptrinhweb.entity.RoleEntity;
import com.laptrinhweb.entity.UserEntity;
import com.laptrinhweb.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity user = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE);
		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		} else {
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			for (RoleEntity role : user.getRoles()) {
				authorities.add(new SimpleGrantedAuthority(role.getCode()));
			}
			MyUser myUser = new MyUser(user.getUserName(), user.getPassword(), true, true, true, true, authorities);
			myUser.setUserId(user.getId());
			myUser.setFullName(user.getFullName());
			myUser.setPhoneNumber(user.getPhoneNumber());
			myUser.setEmail(user.getEmail());
			return myUser;
		}
	}

}
