package com.laptrinhweb.service;

import com.laptrinhweb.entity.UserEntity;

public interface IUserService {

	public boolean checkAccountExists(String username, String email);
	public UserEntity addUser(String fullname, String username, String password, String email, String phonenumber);

}
