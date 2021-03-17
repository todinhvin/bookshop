package com.laptrinhweb.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MD5Utils {
	public static String getMD5(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(password);
	}
}
