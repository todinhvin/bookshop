package com.laptrinhweb.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.laptrinhweb.util.SecurityUtils;

public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		String targetUrl = determineTargetUrl();
		if(response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	
	public String determineTargetUrl() {
		String url="";
		List<String> roles = SecurityUtils.getAuthorities();
		if(roles.contains("ADMIN")) {
			url ="/quan-tri/trang-chu";
		}else if(roles.contains("USER")) {
			url ="/trang-chu";
		}
		return url;
	}
}
