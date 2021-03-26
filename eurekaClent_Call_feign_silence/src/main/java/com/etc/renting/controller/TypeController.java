package com.etc.renting.controller;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.entity.Admin;
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
@RequestMapping("/typeController")
public class TypeController {

    @Resource
    private Call_eureka_client_provider call;


    @RequestMapping("/queryAllType")
    @ResponseBody
    public ModelAndView queryAllType() {
        List<Type> list=call.queryAllType();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("show_type");
        mav.addObject("list",list);
        return mav;
    }


    @RequestMapping("/addType")
    public void addType(String type_name,HttpServletResponse response) {
        Type type = new Type();
        type.setType_name(type_name);
        boolean flag=call.addType(type);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('添加成功！！！');location.href='typeController/queryAllType';</script>");
            }else{
                out.print("<script>alert('添加失败！！！');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateType")
    public void updateType(Integer type_id,String type_name,HttpServletResponse response) {
        Type type = new Type();
        type.setType_id(type_id);
        type.setType_name(type_name);
        boolean flag=call.updateType(type);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('修改成功！！！');location.href='typeController/queryAllType';</script>");
            }else{
                out.print("<script>alert('修改失败！！！');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/deleteType")
    public void deleteType(Integer type_id,HttpServletResponse response) {
        boolean flag=call.deleteType(type_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('删除成功！！！');location.href='typeController/queryAllType';</script>");
            }else{
                out.print("<script>alert('删除失败！！！');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
