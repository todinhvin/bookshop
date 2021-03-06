package com.laptrinhweb.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
@Component
public class UploadFileUtils {
	public void writeOrUpdate(byte[] bytes, String name,HttpServletRequest req) {	
		String imagePath = req.getServletContext().getRealPath("/thumbnail");
		File dir = new File(imagePath);
		if(!dir.exists()) {
			dir.mkdir();
		}
		File serverFile = new File(dir.getAbsolutePath()+File.separator+name);
		try {
			BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(serverFile));
			outputStream.write(bytes);
			outputStream.close();
		} catch (Exception e) {
		}
	}

}
