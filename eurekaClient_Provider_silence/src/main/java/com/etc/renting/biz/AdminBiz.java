package com.etc.renting.biz;


import com.etc.renting.entity.Admin;

public interface AdminBiz {
    //登录判断
    public Admin checkLogin(Admin admin);
}
