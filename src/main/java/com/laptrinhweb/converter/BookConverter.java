package com.laptrinhweb.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhweb.dto.BookDTO;
import com.laptrinhweb.entity.BookEntity;
import com.laptrinhweb.entity.CategoryEntity;
import com.laptrinhweb.repository.CategoryRepository;

@Component
public class BookConverter {

	@Autowired CategoryRepository categoryRepository;
	
	public BookDTO toDTO(BookEntity entity) {
		 BookDTO bookDTO = new BookDTO();
		 bookDTO.setId(entity.getId());
		 bookDTO.setTitle(entity.getTitle());
		 bookDTO.setThumbnail(entity.getThumbnail());
		 bookDTO.setContent(entity.getContent());
		 bookDTO.setPrice(entity.getPrice());
		 bookDTO.setCategoryCode(entity.getCategory().getCode());
		return bookDTO;
	}
	
	public BookEntity toEntity(BookDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode()); 
		BookEntity entity = new BookEntity();
		entity.setTitle(dto.getTitle());
		entity.setThumbnail(dto.getThumbnail());
		entity.setContent(dto.getContent());
		entity.setPrice(dto.getPrice());	
		entity.setCategory(category);
		return entity;
	}
	
	public BookEntity toEntity(BookEntity entity,BookDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode()); 
		entity.setTitle(dto.getTitle());
		entity.setThumbnail(dto.getThumbnail());
		entity.setContent(dto.getContent());
		entity.setPrice(dto.getPrice());	
		entity.setCategory(category);
		return entity;
	}
}
