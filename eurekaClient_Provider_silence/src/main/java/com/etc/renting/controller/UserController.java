package com.etc.renting.controller;

import com.etc.renting.biz.UserBiz;
import com.etc.renting.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/userController")
public class UserController {

    @Resource
    private UserBiz userBiz;

    @RequestMapping("/checkLogin")
    public User checkLogin(@RequestParam String user_name,@RequestParam String user_pwd) {

        return userBiz.checkLogin(user_name,user_pwd);
    }


    @RequestMapping("/addUser")
    public Boolean addUser(@RequestBody User user){

        return userBiz.addUser(user);
    }

    @RequestMapping("/updateUser")
    public Boolean updateUser(@RequestBody User user) {

        return userBiz.updateUser(user);
    }

    @RequestMapping("/deleteUser")
    public Boolean deleteUser(@RequestParam Integer user_id) {

        return userBiz.deleteUser(user_id);
    }

    @RequestMapping("/reUser")
    public Boolean reUser(@RequestParam Integer user_id) {

        return userBiz.reUser(user_id);
    }

    @RequestMapping("/queryAllUser")
    public List<User> queryAllUser(){

        return userBiz.queryAll();
    }

    @RequestMapping("/queryByID")
    public User queryByID(@RequestParam  Integer user_id){

        return userBiz.queryByID(user_id);
    }
    @RequestMapping("/queryByName")
    public User queryByName(@RequestParam  String user_name){

        return userBiz.queryByName(user_name);
    }

    @RequestMapping("/queryByCard")
    public User queryByCard(@RequestParam  String user_card){

        return userBiz.queryByCard(user_card);
    }

    @RequestMapping("/queryByTel")
    public User queryByTel(@RequestParam  String user_tel){

        return userBiz.queryByTel(user_tel);
    }

}




