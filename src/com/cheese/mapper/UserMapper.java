package com.cheese.mapper;

import com.cheese.bean.User;

public interface UserMapper {
	void insertUser(User user);
	User selectUser(String uid);
}