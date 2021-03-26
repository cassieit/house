package com.etc.renting.controller;

import com.etc.renting.biz.AdminBiz;
import com.etc.renting.entity.Admin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/adminController")
public class AdminController {

    @Resource
    private AdminBiz adminBiz;

    @RequestMapping("/checkLogin")
    public Admin checkLogin(@RequestBody Admin admin) {

        return adminBiz.checkLogin(admin);
    }




}




