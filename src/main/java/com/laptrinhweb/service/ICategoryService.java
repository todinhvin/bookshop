package com.laptrinhweb.service;

import java.util.List;
import java.util.Map;

import com.laptrinhweb.dto.CategoryDTO;

public interface ICategoryService {
	
	public Map<String, String> getCategoryList();
	public List<CategoryDTO> findAll();
	public CategoryDTO findOneByCategoryCode(String categoryCode);

}
