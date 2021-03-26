package com.etc.renting.dao;


import com.etc.renting.entity.User;

import java.util.List;

public interface UserDao {

    //登录判断
    public User checkLogin(String user_name, String user_pwd);

    //添加用户（注册）
    public boolean addUser(User user);

    //修改用户信息
    public boolean updateUser(User user);

    //删除用户（将用户的状态置为0）
    public boolean deleteUser(Integer user_id);
    //启用用户（将用户的状态置为1）
    public boolean reUser(Integer user_id);

    //查询所有用户
    public List<User> queryAll();

    //根据用户ID查询用户个人信息
    public User queryByID(Integer user_id);

    //根据用户名查询用户个人信息
    public User queryByName(String user_name);

    //根据身份证查询用户个人信息
    public User queryByCard(String user_card);

    //根据电话号码查询用户个人信息
    public User queryByTel(String user_tel);


}
