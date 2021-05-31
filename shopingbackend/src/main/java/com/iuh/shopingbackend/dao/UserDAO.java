package com.iuh.shopingbackend.dao;

import java.util.List;

import com.iuh.shopingbackend.dto.Address;
import com.iuh.shopingbackend.dto.User;


public interface UserDAO {

	// user related operation
	User getByEmail(String email);
	User get(int id);

	boolean add(User user);
	
	// adding and updating a new address
	Address getAddress(int addressId);
	boolean addAddress(Address address);
	boolean updateAddress(Address address);
	Address getBillingAddress(int userId);
	List<Address> listShippingAddresses(int userId);
	

	
}
