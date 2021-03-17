package com.laptrinhweb.util;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/thumbnail/*")
public class DisplayImageUtils extends HttpServlet {

	private static final long serialVersionUID = 1178590824946395019L;

	/*
	 * private String imagePath = "";
	 * 
	 * @Override public void init() throws ServletException { imagePath =
	 * "/src/main/webapp" + File.separator + "thumbnail"; }
	 */

	@SuppressWarnings("unused")

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestImage = req.getPathInfo();
		if (requestImage == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String imagePath = req.getServletContext().getRealPath("/thumbnail");
		File image = new File(imagePath, URLDecoder.decode(requestImage, "UTF-8"));
		if (image == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String contentType = getServletContext().getMimeType(image.getName());
		if (contentType == null || !contentType.startsWith("image")) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		resp.reset();
		resp.setContentType(contentType);
		resp.setHeader("Content-Length", String.valueOf(image.length()));
		Files.copy(image.toPath(), resp.getOutputStream());

	}

	/*
	 * private String imagePath ="";
	 * 
	 * @Override public void init() throws ServletException { imagePath =
	 * System.getProperty("catalina.home")+File.separator + "thumbnail"; }
	 * 
	 * @SuppressWarnings("unused")
	 * 
	 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { String requestImage =
	 * req.getPathInfo(); if(requestImage==null) {
	 * resp.sendError(HttpServletResponse.SC_NOT_FOUND); return; } File image = new
	 * File(imagePath,URLDecoder.decode(requestImage,"UTF-8")); if(image==null) {
	 * resp.sendError(HttpServletResponse.SC_NOT_FOUND); return; } String
	 * contentType = getServletContext().getMimeType(image.getName());
	 * if(contentType==null||!contentType.startsWith("image")) {
	 * resp.sendError(HttpServletResponse.SC_NOT_FOUND); return; } resp.reset();
	 * resp.setContentType(contentType); resp.setHeader("Content-Length",
	 * String.valueOf(image.length())); Files.copy(image.toPath(),
	 * resp.getOutputStream());
	 * 
	 * }
	 */

}
