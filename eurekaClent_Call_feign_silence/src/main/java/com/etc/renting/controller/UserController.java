package com.etc.renting.controller;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Houses;
import com.etc.renting.entity.User;
import com.etc.renting.feigninterface.Call_eureka_client_provider;
import com.etc.renting.feigninterface.Call_eureka_client_provider_houses;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/userController")
public class UserController {

    @Resource
    private Call_eureka_client_provider call;

    @Resource
    private Call_eureka_client_provider_houses callh;


    /**
     * 用户登录
     * @param user_name
     * @param user_pwd
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkLogin")
    public void checkLogin(String user_name, String user_pwd, HttpSession session, HttpServletResponse response) throws IOException {
       User loginUser=  call.checkLogin(user_name,user_pwd);
       response.setContentType("text/html;charset=utf-8");
       PrintWriter out=response.getWriter();
       if(loginUser!=null){
        //登录成功
          session.setAttribute("loginUser",loginUser);
          out.print("<script>alert('登录成功！！！');location.href='../index.jsp';</script>");
      }else{
         //登录失败
           out.print("<script>alert('登录失败！用户名或者密码错误！');history.go(-1);</script>");
      }
         out.flush();
         out.close();
    }


    /**
     * 用户注册
     * @param user_name
     * @param user_pwd
     * @param user_sex
     * @param user_tel
     * @param user_card
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("/register")
    public void register(String user_name, String user_pwd, String user_sex,String user_tel,String user_card, HttpSession session, HttpServletResponse response) throws IOException {

        User user=new User();
        user.setUser_name(user_name);
        user.setUser_pwd(user_pwd);
        user.setUser_sex(user_sex);
        user.setUser_tel(user_tel);
        user.setUser_card(user_card);
        boolean flag= call.addUser(user);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        if(flag){
//            User loginUser= call.checkLogin(user_name,user_pwd);
//            session.setAttribute("loginUser",loginUser);
            out.print("<script>alert('注册成功！！！去登录！！！');location.href='../login.jsp';</script>");
        }else{
            out.print("<script>alert('注册失败！！！');history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/isRegister")
    @ResponseBody
    public String isRegister(String user_name){
      User user= call.queryByName(user_name);
       if(user!=null){
           //说明已经存在
           return "register";
       }else{
           return "noregister";
       }
    }

    @RequestMapping("/isCard")
    @ResponseBody
    public String isCard(String user_card){
        User user= call.queryByCard(user_card);
        if(user!=null){
            //说明已经存在
            return "card";
        }else{
            return "nocard";
        }
    }

    @RequestMapping("/isTel")
    @ResponseBody
    public String isTel(String user_tel){
        User user= call.queryByTel(user_tel);
        if(user!=null){
            //说明已经存在
            return "tel";
        }else{
            return "notel";
        }
    }

    @RequestMapping("/checkyan")
    @ResponseBody
    public String checkyan(String yanzheng,HttpSession session){
      String yanzheng2= (String) session.getAttribute("rand");
        if(yanzheng.equals(yanzheng2)){
            return "success";
        }else{
            return "fail";
        }
    }

    /**
     * 更新用户信息
     * @param user_id
     * @param user_name
     * @param user_pwd
     * @param user_sex
     * @param user_tel
     * @param user_card
     * @param request
     * @param response
     */
    @RequestMapping("/updateuser")
    public void updateuser(Integer user_id,String user_name, String user_pwd, String user_sex,String user_tel, String user_card, HttpServletRequest request,HttpServletResponse response){

         User user=new User();
         user.setUser_id(user_id);
         user.setUser_name(user_name);
         user.setUser_pwd(user_pwd);
         user.setUser_sex(user_sex);
         user.setUser_tel(user_tel);
         user.setUser_card(user_card);
         response.setContentType("text/html;charset=utf-8");
         try {
             PrintWriter out = response.getWriter();
             if (call.updateUser(user)) {
                 out.print("<script>alert('修改成功');location.href='userController/queryByName';</script>");
             } else {

                 out.print("<script>alert('修改失败');history.go(-1);</script>");
             }
             out.flush();
             out.close();
         } catch (Exception e) {
             e.printStackTrace();
         }

    }

    /**
     * 重置密码
     * @param user_pwd
     * @param user_tel
     * @param response
     */
    @RequestMapping("/repassword")
    public void repassword(String user_pwd,String user_tel,HttpServletResponse response) {
       //根据电话号码找到这个用户
        User usertmp=call.queryByTel(user_tel);
        Integer user_id=usertmp.getUser_id();
        String user_name=usertmp.getUser_name();
        String user_sex=usertmp.getUser_sex();
        String tel=usertmp.getUser_tel();
        String user_card=usertmp.getUser_card();

        User user=new User();
        user.setUser_id(user_id);
        user.setUser_name(user_name);
        user.setUser_pwd(user_pwd);
        user.setUser_sex(user_sex);
        user.setUser_tel(tel);
        user.setUser_card(user_card);

        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            Boolean flag=call.updateUser(user);
            if (flag) {
                out.print("<script>alert('重置成功');location.href='../login.jsp';</script>");
            } else {

                out.print("<script>alert('重置失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @RequestMapping("/queryAllUser")
    @ResponseBody
    public ModelAndView queryAllUser() {
       List<User> list=call.queryAllUser();
       ModelAndView mav = new ModelAndView();
        mav.setViewName("show_user");
        mav.addObject("list",list);
       return mav;
    }

    @RequestMapping("/queryByName")
    public void queryByName(HttpSession session,HttpServletResponse response){
        User loginUser = (User) session.getAttribute("loginUser");
        String user_name=loginUser.getUser_name();
        User user = call.queryByName(user_name);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (user!=null) {
                out.print("<script>location.href='../user.jsp';</script>");
            } else {

                out.print("<script>history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/deleteUser")
    public void deleteUser(Integer user_id,HttpServletResponse response) {
        boolean flag = call.deleteUser(user_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (flag) {
                User user=call.queryByID(user_id);
                out.print("<script>alert('禁用成功');location.href='../userController/queryAllUser';</script>");
            } else {

                out.print("<script>alert('禁用失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/reUser")
    public void reUser(Integer user_id,HttpServletResponse response) {
        boolean flag = call.reUser(user_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (flag) {
                User user=call.queryByID(user_id);
                out.print("<script>alert('启用成功');location.href='../userController/queryAllUser';</script>");
            } else {

                out.print("<script>alert('启用失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    //用户点击租房，跳转到pro_zu.jsp 在该页面，默认显示从数据库查询出的所有房源信息
//    @RequestMapping("/queryAllHouses4")
//    public ModelAndView queryAllHouses4() {
//        List<HousesAT> list = callh.queryAllHouses4();
//        ModelAndView mav=new ModelAndView();
//        mav.setViewName("pro_zu");
//        mav.addObject("list",list);
//        return mav;
//    }

    //用户点击租房，跳转到pro_zu.jsp 在该页面，默认显示从数据库查询出的所有房源信息
    @RequestMapping("/queryAllHouses4")
    @ResponseBody
    public List<HousesAT> queryAllHouses4() {
        return callh.queryAllHouses4();

    }

    //根据房源ID查询所有信息
    @RequestMapping("/queryHousesByID")
    public ModelAndView queryHousesByID(Integer houses_id) {
        HousesAT houses = callh.queryHousesByID(houses_id);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("update_houses");
        mav.addObject("houses",houses);
        return mav;
    }

    //根据房源价格查询所有信息
    @RequestMapping("/queryHousesByPrice")
    public ModelAndView queryHousesByPrice() {
        List<HousesAT> list = callh.queryHousesByPrice();
        ModelAndView mav=new ModelAndView();
        mav.setViewName("pro_zu");
        mav.addObject("list",list);
        return mav;
    }

    //根据房源价格查询所有信息
    @RequestMapping("/queryHousesByTime")
    public ModelAndView queryHousesByTime() {
        List<HousesAT> list = callh.queryHousesByTime();
        ModelAndView mav=new ModelAndView();
        mav.setViewName("pro_zu");
        mav.addObject("list",list);
        return mav;
    }
}
