package com.laptrinhweb.api;

import java.util.Base64;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.dto.ImageDTO;
import com.laptrinhweb.entity.BookEntity;
import com.laptrinhweb.service.IBookService;
import com.laptrinhweb.util.UploadFileUtils;

@RestController
public class BookAPI {
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@Autowired
	private IBookService bookService;
	
	@PostMapping(value = "/api/image")
	public ResponseEntity<ImageDTO> saveImage(@RequestBody ImageDTO imageDTO,HttpServletRequest req) {
		byte[] bytes = Base64.getDecoder().decode(imageDTO.getBase64().getBytes());
		uploadFileUtils.writeOrUpdate(bytes, imageDTO.getName(),req);
		return ResponseEntity.ok(imageDTO);
	}
	
	@PostMapping(value="/api/book")
	public BookDTO addNewBook(@RequestBody BookDTO bookDTO) {
		return bookService.saveBookDTO(bookDTO);
	}
	
	@PutMapping(value = "/api/book")
	public BookDTO updateBook(@RequestBody BookDTO updateBook) {
		return bookService.saveBookDTO(updateBook);
	}
	
	

}
