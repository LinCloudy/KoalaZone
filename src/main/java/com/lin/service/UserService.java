package com.lin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lin.dao.UserDao;
import com.lin.entity.User;

@Service
public class UserService {
	@Resource
	private UserDao userDao;
	
	public boolean login(String username, String password) {
		User user = userDao.getUser(username, password);
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

}
