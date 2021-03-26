package com.etc.renting.controller;

import com.etc.renting.entity.Houses;
import com.etc.renting.feigninterface.Call_eureka_client_provider;
import com.etc.renting.feigninterface.Call_eureka_client_provider_houses;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/housesController")
public class HousesController {
    @Resource
    private Call_eureka_client_provider_houses call;  //房源查询等服务的接口


    @RequestMapping("/queryAllHouses")
    @ResponseBody
    public List<Houses> queryAllHouses(){

        return call.queryAllHouses();
    }
//    @ResponseBody
//    public ModelAndView queryAllHouses() {
//        List<Houses> list=call.queryAllHouses();
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("show_houses");
//        mav.addObject("list",list);
//        return mav;
//    }

    @RequestMapping("/queryFour")
    @ResponseBody
    public  List<Houses> queryFour(){
        return call.queryFour();
    }

    @RequestMapping("/queryCheap")
    @ResponseBody
    public  List<Houses> queryCheap(){
        return call.queryCheap();
    }
    @RequestMapping("/queryNew")
    @ResponseBody
    public  List<Houses> queryNew(){
        return call.queryNew();
    }

//    @RequestMapping("/queryById")
//    public  void queryById(Integer houses_id, HttpSession session, HttpServletResponse response) throws Exception{
//        Houses houses= call.queryById(houses_id);
//        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out=response.getWriter();
//        if(houses==null){
//            out.print("<script>alert('查看详情失败！！！');history.go(-1);</script>");
//        }
//        session.setAttribute("houses",houses);
//        out.print("<script>alert('查看详情成功！！！');location.href='../proinfo.jsp';</script>");
//
//    }

    @RequestMapping("/queryById")
    public  String queryById(Integer houses_id, HttpSession session) throws Exception{
        Houses houses= call.queryById(houses_id);
        session.setAttribute("houses",houses);
        return "proinfo";
    }

//    @RequestMapping("/queryById")
//    public  ModelAndView queryById(Integer houses_id, HttpSession session) throws Exception{
//        Houses houses= call.queryById(houses_id);
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("proinfo");
//        mav.addObject("houses");
//        return mav;
//    }
//    @RequestMapping("/queryById")
//    public String queryById(Integer houses_id, Model model){
//        Houses houses= call.queryById(houses_id);
//        System.out.println(houses.getHouses_name());
//        model.addAttribute("houses",houses);
//        return "proinfo";
//    }
    @RequestMapping("/queryById1")
    @ResponseBody
    public  Houses queryById1(Integer houses_id,HttpSession session){
       return call.queryById1(houses_id);
    }


    @RequestMapping("/deleteHouses")
    public void deleteHouses(Integer houses_id,HttpServletResponse response) {
        boolean flag = call.deleteHouses(houses_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (flag) {
                out.print("<script>alert('下架成功');location.href='../adminController/queryAllHouses4';</script>");
            } else {

                out.print("<script>alert('下架失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/reHouses")
    public void reHouses(Integer houses_id, HttpServletResponse response) {
        boolean flag = call.reHouses(houses_id);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (flag) {
                out.print("<script>alert('上架成功');location.href='../adminController/queryAllHouses4';</script>");
            } else {

                out.print("<script>alert('上架失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateHouses")
    public void updateHouses(Integer houses_id,Integer admin_id,Integer area_id,Integer type_id,String houses_name,Double houses_price,String houses_style,String houses_areas,String houses_toward,String houses_storey,String houses_decorate,String houses_image,String houses_addr,String houses_info,String houses_state,HttpServletResponse response){
        Houses houses=new Houses();
        houses.setHouses_id(houses_id);
        houses.setAdmin_id(admin_id);
        houses.setArea_id(area_id);
        houses.setType_id(type_id);
        houses.setHouses_name(houses_name);
        houses.setHouses_price(houses_price);
        houses.setHouses_style(houses_style);
        houses.setHouses_areas(houses_areas);
        houses.setHouses_toward(houses_toward);
        houses.setHouses_storey(houses_storey);
        houses.setHouses_decorate(houses_decorate);
        houses.setHouses_image(houses_image);
        houses.setHouses_addr(houses_addr);
        houses.setHouses_info(houses_info);
        //提交的时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String houses_time = df.format(new Date());
        houses.setHouses_time(houses_time);
        houses.setHouses_state(houses_state);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (call.updateHouses(houses)) {
                out.print("<script>alert('修改成功');location.href='/adminController/queryAllHouses4';;</script>");
            } else {

                out.print("<script>alert('修改失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/addHouses")
    public void addHouses(Integer admin_id,Integer area_id,Integer type_id,String houses_name,Double houses_price,String houses_style,String houses_areas,String houses_toward,String houses_storey,String houses_decorate,String houses_image,String houses_addr,String houses_info,String houses_state,HttpServletResponse response){
        Houses houses=new Houses();
        houses.setAdmin_id(admin_id);
        houses.setArea_id(area_id);
        houses.setType_id(type_id);
        houses.setHouses_name(houses_name);
        houses.setHouses_price(houses_price);
        houses.setHouses_style(houses_style);
        houses.setHouses_areas(houses_areas);
        houses.setHouses_toward(houses_toward);
        houses.setHouses_storey(houses_storey);
        houses.setHouses_decorate(houses_decorate);
        houses.setHouses_image(houses_image);
        houses.setHouses_addr(houses_addr);
        houses.setHouses_info(houses_info);
        //提交的时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String houses_time = df.format(new Date());
        houses.setHouses_time(houses_time);
        houses.setHouses_state(houses_state);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            if (call.addHouses(houses)) {
                out.print("<script>alert('添加成功');location.href='/adminController/queryAllHouses4';</script>");
            } else {

                out.print("<script>alert('添加失败');history.go(-1);</script>");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
