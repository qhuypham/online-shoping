package com.iuh.shopingbackend.dao;

import java.util.List;

import com.iuh.shopingbackend.dto.Category;


public interface CategoryDAO {

	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
}
