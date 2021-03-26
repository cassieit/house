package com.etc.renting.biz.impl;


import com.etc.renting.biz.AdminBiz;
import com.etc.renting.dao.AdminDao;
import com.etc.renting.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminBizImpl implements AdminBiz {

    @Resource
    private AdminDao adminDao;

    @Override
    public Admin checkLogin(Admin admin) {
        return adminDao.checkLogin(admin);
    }
}
