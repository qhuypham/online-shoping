package com.iuh.shopingbackend.dao;

import java.util.List;

import com.iuh.shopingbackend.dto.Category;

public interface CategoryDAO {

	List<Category> list();
	Category get(int id);
}
