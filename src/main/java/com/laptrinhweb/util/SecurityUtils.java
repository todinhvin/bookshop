package com.laptrinhweb.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhweb.dto.MyUser;
import com.laptrinhweb.entity.UserEntity;

public class SecurityUtils {
	
	public static MyUser getPrincipal() {
		MyUser myUser = (MyUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return myUser;
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities(){
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		List<String> roles  =new ArrayList<>();
		for(GrantedAuthority authority  : authorities) {
			roles.add(authority.getAuthority());
		}
		return roles;
	}
	
	public static boolean isLogged() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return null != authentication && !("anonymousUser").equals(authentication.getName());
	}
}
