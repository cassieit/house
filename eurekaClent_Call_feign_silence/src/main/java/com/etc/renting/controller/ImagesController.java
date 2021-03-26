package com.etc.renting.controller;


import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Images;
import com.etc.renting.feigninterface.Call_eureka_client_provider;
import com.etc.renting.feigninterface.Call_eureka_client_provider_houses;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/imagesController")
public class ImagesController {
    @Resource
    private Call_eureka_client_provider_houses call;  //调用房源查询等服务的接口

    //    根据houses_id查询对应房源的所有图片
    @RequestMapping("/queryByHousesId")
    @ResponseBody
    public List<Images> queryByHousesId(Integer houses_id) {
        List<Images> list = call.queryByHousesId(houses_id);
        System.out.println("houses_id");
        return list;
    }


    //    根据houses_id查询对应房源的所有图片
    @RequestMapping("/queryByHousesId1")
    public String queryByHousesId1(Integer houses_id, Model model, HttpServletResponse response) {
        response.setContentType("text/html");
        List<Images> images = call.queryByHousesId(houses_id);
        model.addAttribute("images", images);
        System.out.println(houses_id);
        return "proinfo";
    }


    //    根据houses_id查询对应房源的所有信息
//    @RequestMapping("/queryByHousesid")
//    @ResponseBody
//    public String queryByHousesid(Integer houses_id, Model model, HttpServletResponse response){
//        response.setContentType("text/html");
//        List<HousesInfo> housesinfo= call.queryByHousesid(houses_id);
//        model.addAttribute("housesinfo", housesinfo);
//        System.out.println(houses_id);
//        return "proinfo";
//
//    }
    //    根据houses_id查询对应房源的所有信息
    @RequestMapping("/queryByHousesid")
    public String queryByHousesid(Integer houses_id, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html");
        List<HousesInfo> housesinfo = call.queryByHousesid(houses_id);
        session.setAttribute("housesinfo", housesinfo);
        System.out.println(houses_id);
        return "proinfo";

    }



    //    根据houses_id查询对应房源的所有信息
    @RequestMapping("/queryByHousesid3")
    @ResponseBody
    public List<HousesInfo> queryByHousesid3(Integer houses_id, Model model, HttpServletResponse response) {
        response.setContentType("text/html");
        System.out.println(houses_id);
        return call.queryByHousesid(houses_id);

    }
}
