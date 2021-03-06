package com.laptrinhweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhweb.converter.CategoryConverter;
import com.laptrinhweb.dto.CategoryDTO;
import com.laptrinhweb.entity.CategoryEntity;
import com.laptrinhweb.repository.CategoryRepository;
import com.laptrinhweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	@Override
	public Map<String, String> getCategoryList() {
		List<CategoryEntity> categoryList =categoryRepository.findAll();
		Map<String, String> results = new HashMap<String, String>();
		for(CategoryEntity entity : categoryList) {
			results.put(entity.getCode(), entity.getName());
		}
		return results;
	}
	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryEntity> categoryList =categoryRepository.findAll();
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		for(CategoryEntity entity : categoryList) {
			list.add(categoryConverter.toDTO(entity));
		}
		return list;
	}
	@Override
	public CategoryDTO findOneByCategoryCode(String categoryCode) {
		return categoryConverter.toDTO(categoryRepository.findOneByCode(categoryCode));
	}

}
