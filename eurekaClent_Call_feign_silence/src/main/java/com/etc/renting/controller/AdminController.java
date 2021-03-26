package com.etc.renting.controller;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.entity.Admin;
import com.etc.renting.entity.Area;
import com.etc.renting.entity.Type;
import com.etc.renting.feigninterface.Call_eureka_client_provider;
import com.etc.renting.feigninterface.Call_eureka_client_provider_houses;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/adminController")
public class AdminController {

    @Resource
    private Call_eureka_client_provider call;
    @Resource
    private Call_eureka_client_provider_houses callh;


    /**
     * 判断管理员登录
     * @param admin_name
     * @param admin_pwd
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkLogin")
    public void checkLogin(String admin_name, String admin_pwd, HttpSession session, HttpServletResponse response) throws IOException {
       Admin admin = new Admin();
       admin.setAdmin_name(admin_name);
       admin.setAdmin_pwd(admin_pwd);
       Admin loginAdmin=call.checkLogin(admin);
       response.setContentType("text/html;charset=utf-8");
       PrintWriter out=response.getWriter();
       if(loginAdmin!=null){
        //登录成功
          session.setAttribute("loginAdmin",loginAdmin);
          out.print("<script>alert('登录成功！！！');location.href='../admin_index.jsp';</script>");
      }else{
         //登录失败
           out.print("<script>alert('登录失败！用户名或者密码错误！');history.go(-1);</script>");
      }
         out.flush();
         out.close();
    }


    @RequestMapping("/queryAllHouses4")
    @ResponseBody
    public ModelAndView queryAllHouses() {
        List<HousesAT> list=callh.queryAllHouses4();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("show_houses");
        mav.addObject("list",list);
        return mav;
    }
//
//    @RequestMapping("/queryAllArea")
//    @ResponseBody
//    public ModelAndView queryAllArea() {
//        List<Area> list=call.queryAllArea();
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("show_area");
//        mav.addObject("list",list);
//        return mav;
//    }

//    @RequestMapping("/queryAllType")
//    @ResponseBody
//    public ModelAndView queryAllType() {
//        List<Type> list=call.queryAllType();
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("show_type");
//        mav.addObject("list",list);
//        return mav;
//    }



}
