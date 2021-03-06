package com.laptrinhweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhweb.dto.BookDTO;


public interface IBookService {
	public List<BookDTO> findAll(Pageable pageable);
	public List<BookDTO> findAll();
	public Long getTotalItems();
	public BookDTO saveBookDTO(BookDTO bookDTO);
	public BookDTO findOneById(Long id);
	public void deleteBook(Long id);
	public int getCountBook();
	public List<BookDTO> getNewBooks(int limit, int offset);
	public int getCountByCategoryCode(String categoryCode);
	public List<BookDTO> getBooksByCategoryId(int limit,int offset,Long categoryId);
}
