
package com.laptrinhweb.controller.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.entity.UserEntity;
import com.laptrinhweb.service.IUserService;
import com.laptrinhweb.util.MD5Utils;
import com.laptrinhweb.util.MessageUtils;
import com.laptrinhweb.util.ValidationCartInfor;

@RestController
public class RegisterController {
	
	@Autowired
	private MessageUtils messageUtils;

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage(@RequestParam(value = "message",required = false) String message) {
		ModelAndView mav = new ModelAndView("/web/register");
		if(message!=null) {
			Map<String, String> messages = messageUtils.getMessage(message);
			mav.addObject("arlet",messages.get("arlet"));
			mav.addObject("message",messages.get("message"));
		}
		return mav;
	}

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/api/register")
	public ResponseEntity<?> addCart(@RequestBody HashMap<String, String> registerRequest) {

		try {
			String keys[] = { "fullname", "username", "email", "phone_number", "password" };
			if (ValidationCartInfor.validationInformation(keys, registerRequest)) {
				if (!registerRequest.get("email").contains("@")) {
					return ResponseEntity.badRequest().body("");
				}
				String password = MD5Utils.getMD5(registerRequest.get("password"));
				if (!userService.checkAccountExists(registerRequest.get("username"), registerRequest.get("email"))) {
					UserEntity userEntity = userService.addUser(registerRequest.get("fullname"), registerRequest.get("username"), password,
							registerRequest.get("email"), registerRequest.get("phone_number"));
					return ResponseEntity.ok(userEntity);
				} else {
					return ResponseEntity.badRequest().body("");
				}

			} else {
				return ResponseEntity.badRequest().body("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().body("");
		}

	}
}
