package com.laptrinhweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhweb.converter.BookConverter;
import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.entity.BookEntity;
import com.laptrinhweb.entity.CategoryEntity;
import com.laptrinhweb.repository.BookRepository;
import com.laptrinhweb.repository.CategoryRepository;
import com.laptrinhweb.service.IBookService;

@Service
public class BookService implements IBookService {

	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private BookConverter bookConverter;

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<BookDTO> findAll(Pageable pageable) {
		List<BookEntity> entityList = bookRepository.findAll(pageable).getContent();
		List<BookDTO> resultList = new ArrayList<BookDTO>();
		for (BookEntity entity : entityList) {
			resultList.add(bookConverter.toDTO(entity));
		}
		return resultList;
	}

	@Override
	public Long getTotalItems() {
		return bookRepository.count();
	}

	@Transactional
	@Override
	public BookDTO saveBookDTO(BookDTO bookDTO) {
		CategoryEntity category = categoryRepository.findOneByCode(bookDTO.getCategoryCode());
		BookEntity entity = new BookEntity();
		if (bookDTO.getId() != null) {
			BookEntity oldBook = bookRepository.findOneById(bookDTO.getId());
			entity = bookConverter.toEntity(oldBook, bookDTO);
			entity.setCategory(category);
		} else {
			entity = bookConverter.toEntity(bookDTO);
			entity.setCategory(category);
		}
		bookRepository.save(entity);
		return bookConverter.toDTO(entity);
	}

	@Override
	public BookDTO findOneById(Long id) {
		BookEntity entity = bookRepository.findOneById(id);
		return bookConverter.toDTO(entity);
	}

	@Override
	public void deleteBook(Long id) {
		BookEntity entity = bookRepository.findOneById(id);
		bookRepository.delete(entity);
		;

	}

	@Override
	public List<BookDTO> findAll() {
		List<BookEntity> entityList = bookRepository.findAll();
		List<BookDTO> resultList = new ArrayList<BookDTO>();
		for (BookEntity entity : entityList) {
			resultList.add(bookConverter.toDTO(entity));
		}
		return resultList;
	}

	@Override
	public int getCountBook() {
		return bookRepository.getCountBook();
	}

	@Override
	public List<BookDTO> getNewBooks(int limit, int offset) {
		List<BookEntity> entityList = bookRepository.getNewBooks(limit, offset);
		List<BookDTO> resultList = new ArrayList<BookDTO>();
		for (BookEntity entity : entityList) {
			resultList.add(bookConverter.toDTO(entity));
		}
		return resultList;
	}

	@Override
	public int getCountByCategoryCode(String categoryCode) {
		return bookRepository.getCountBookByCategory(categoryCode);
	}

	@Override
	public List<BookDTO> getBooksByCategoryId(int limit,int offset,Long categoryId) {
		List<BookEntity> entityList = bookRepository.getBooksByCategoryCode(limit,offset,categoryId);
		List<BookDTO> resultList = new ArrayList<BookDTO>();
		for (BookEntity entity : entityList) {
			resultList.add(bookConverter.toDTO(entity));
		}
		return resultList;
	}


}
