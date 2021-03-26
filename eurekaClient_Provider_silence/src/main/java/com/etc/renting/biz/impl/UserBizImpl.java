package com.etc.renting.biz.impl;


import com.etc.renting.biz.UserBiz;
import com.etc.renting.dao.UserDao;
import com.etc.renting.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserBizImpl implements UserBiz {
    @Resource
    private UserDao userDao ;

    @Override
    public User checkLogin(String user_name, String user_pwd) {
        return userDao.checkLogin(user_name,user_pwd);
    }

    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(Integer user_id) {
        return userDao.deleteUser(user_id);
    }

    @Override
    public boolean reUser(Integer user_id) {
        return userDao.reUser(user_id);
    }

    @Override
    public List<User> queryAll() {
        return userDao.queryAll();
    }

    @Override
    public User queryByID(Integer user_id) {
        return userDao.queryByID(user_id);
    }

    @Override
    public User queryByName(String user_name) {
        return userDao.queryByName(user_name);
    }

    @Override
    public User queryByCard(String user_card) {
        return userDao.queryByCard(user_card);
    }

    @Override
    public User queryByTel(String user_tel) {
        return userDao.queryByTel(user_tel);
    }
}
