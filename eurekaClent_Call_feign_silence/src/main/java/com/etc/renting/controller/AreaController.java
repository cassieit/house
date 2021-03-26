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
@RequestMapping("/areaController")
public class AreaController {

    @Resource
    private Call_eureka_client_provider call;


    @RequestMapping("/queryArea")
    @ResponseBody
    public List<Area> queryArea() {
        return call.queryAllArea();
    }

    @RequestMapping("/queryAllArea")
    @ResponseBody
    public ModelAndView queryAllArea() {
        List<Area> list=call.queryAllArea();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("show_area");
        mav.addObject("list",list);
        return mav;
    }

    @RequestMapping("/addArea")
    public void addArea(String area_name,HttpServletResponse response) {
        Area area = new Area();
        area.setArea_name(area_name);
        boolean flag=call.addArea(area);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('添加成功！！！');location.href='areaController/queryAllArea';</script>");
            }else{
                out.print("<script>alert('添加失败！！！');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateArea")
    public void updateArea(Integer area_id,String area_name,HttpServletResponse response) {
        Area area = new Area();
        area.setArea_id(area_id);
        area.setArea_name(area_name);
        boolean flag=call.updateArea(area);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('修改成功！！！');location.href='areaController/queryAllArea';</script>");
            }else{
                out.print("<script>alert('修改失败！！！');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/deleteArea")
    public void deleteArea(Integer area_id,HttpServletResponse response) {
        boolean flag=call.deleteArea(area_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if(flag){
                out.print("<script>alert('删除成功！！！');location.href='areaController/queryAllArea';</script>");
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
