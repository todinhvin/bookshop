package com.laptrinhweb.util;

import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class ValidationCartInfor {
	public static Boolean validationInformation(String[] keys, HashMap<String, String> request) throws Exception {
		Boolean status = true;
		try {
			for(int start = 0;start<keys.length;start++) {
				if(request.containsKey(keys[start])) {
					if(request.get(keys[start]).equals("")) {
						status = false;
						throw new Exception(keys[start]+" should not be empty");
					}
				}else {
					status = false;
					throw new Exception(keys[start]+" is missing");
				}
			}
		} catch (Exception e) {
			status = false;
			throw new Exception(e.getMessage());
		}
		return status;
	}
}
