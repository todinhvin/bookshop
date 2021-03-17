package com.laptrinhweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtils {

	public Map<String, String> getMessage(String type){
		Map<String, String> messages = new HashMap<String, String>();
		if(type.equals("addSuccess")) {
			messages.put("arlet", "success");
			messages.put("message","Add success");
		}
		else if(type.equals("updateSuccess")) {
			messages.put("arlet", "success");
			messages.put("message","Update success");
		}
		else if(type.equals("addError")) {
			messages.put("arlet", "danger");
			messages.put("message","Add error");
		}
		else if(type.equals("updateError")) {
			messages.put("arlet", "danger");
			messages.put("message","Update error");
		}
		else if(type.equals("deleteSuccess")) {
			messages.put("arlet", "success");
			messages.put("message","Delete success");
		}else if(type.equals("registerSuccess")) {
			messages.put("arlet", "success");
			messages.put("message","Đăng ký thành công");
		}else if(type.equals("registerError")) {
			messages.put("arlet", "danger");
			messages.put("message","Đăng ký không thành công");
		}
		return messages;
	}
}
