package com.iuh.shopingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.iuh.shopingbackend.dao.CategoryDAO;
import com.iuh.shopingbackend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {

	private static List<Category> categories = new ArrayList<Category>();
	
	static {
		Category category = new Category();
		category.setId(1);
		category.setName("Television");
		category.setDescription("This is some description for television");
		category.setImageURL("CAT_1.png");
		categories.add(category);
		
		Category category1 = new Category();
		category1.setId(2);
		category1.setName("Mobile");
		category1.setDescription("This is some description for mobile");
		category1.setImageURL("CAT_2.png");
		categories.add(category1);
		
		
		Category category2 = new Category();
		category2.setId(3);
		category2.setName("Laptop");
		category2.setDescription("This is some description for laptop");
		category2.setImageURL("CAT_3.png");
		categories.add(category2);
	}
	
	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}

	@Override
	public Category get(int id) {
		for(Category category : categories) {
			if(category.getId()==id) return category;
		}
		return null;
	}

}
