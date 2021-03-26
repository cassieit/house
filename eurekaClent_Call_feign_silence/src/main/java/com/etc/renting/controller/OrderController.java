package com.etc.renting.controller;

import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;
import com.etc.renting.entity.User;
import com.etc.renting.feigninterface.Call_eureka_client_provider_order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/orderController")
public class OrderController {
    @Resource
    private Call_eureka_client_provider_order callO;  //房源、订单查询等服务的接口

    //根据订单ID查询订单
    @RequestMapping("/findById")
    @ResponseBody
    public Order findById(Integer orders_id) {
        return callO.findById(orders_id);
    }

    //查询全部订单
    @RequestMapping("/findList")
    @ResponseBody
    public List<Order> findList() {
        return callO.findList();
    }

    //根据用户ID查询订单
//    @RequestMapping("/findByUserid")
//    @ResponseBody
//    public List<OrderInfo> findByUserid(Integer users_id){
//        System.out.println("he");
//        System.out.println(users_id);
//        return callO.findByUserid(users_id);
//    }
//根据用户ID查询订单
//    @RequestMapping("/findByUserid")
//    public String findByUserid(Integer users_id, HttpSession session, HttpServletResponse response) {
//
//        response.setContentType("text/html");
//        List<OrderInfo> orderInfos = callO.findByUserid(users_id);
//        session.setAttribute("orderInfos", orderInfos);
//        return "myOrder";
//    }
    //根据用户ID查询订单
    @RequestMapping("/findByUserid")
    public String findByUserid( HttpSession session, HttpServletResponse response) {
        User loginUser = (User) session.getAttribute("loginUser");
        Integer user_id1=loginUser.getUser_id();
        response.setContentType("text/html");
        List<OrderInfo> orderInfos = callO.findByUserid(user_id1);
        session.setAttribute("orderInfos", orderInfos);
        return "myOrder";
    }


    //添加进订单列表 测试
    @RequestMapping("/addOrder")
    public void addOrder(Order order, Integer users_id, Integer houses_id, HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        boolean mess = callO.addOrder(order, users_id, houses_id);
        if (mess) {
            //登录成功
            out.print("<script>alert('预定成功！！！');location.href='../orderController/findByUserid';</script>");
        } else {
            //登录失败
            out.print("<script>alert('预定失败！);history.go(-1);</script>");
        }
        out.flush();
        out.close();

    }

    //    //修改订单信息
//    @RequestMapping("/updateOrder")
//    @ResponseBody
//    public boolean updateOrder( Order order){
//        return callO.updateOrder(order);
//    }
//    //修改订单信息  测试
//    @RequestMapping("/updateOrder")
//    @ResponseBody
//    public boolean updateOrder( Order order,Integer orders_id,String orders_state){
//
//        return callO.updateOrder(order,orders_id,orders_state);
//    }
//修改订单信息  测试
    @RequestMapping("/updateOrder")
    public void updateOrder(Order order, Integer orders_id, String orders_state, HttpSession session, HttpServletResponse response) throws IOException {
        User loginUser = (User) session.getAttribute("loginUser");
        Integer user_id=loginUser.getUser_id();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        boolean mes = callO.updateOrder(order, orders_id, orders_state);
        if (mes) {
            //登录成功
            out.print("<script>alert('操作成功！！！');location.href='../orderController/findByUserid';</script>");
        } else {
            //登录失败
            out.print("<script>alert('操作失败！);history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    //删除已撤销的订单
    @RequestMapping("/deleteByid")
    public void deleteByid(Integer orders_id, HttpSession session, HttpServletResponse response) throws IOException{
        User loginUser = (User) session.getAttribute("loginUser");
        Integer user_id=loginUser.getUser_id();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
       boolean mesa=callO.deleteByid(orders_id);
        if (mesa) {
            //登录成功
            out.print("<script>alert('删除成功！！！');location.href='../orderController/findByUserid';</script>");
        } else {
            //登录失败
            out.print("<script>alert('删除失败！);history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/findAllOrder")
    @ResponseBody
    public ModelAndView findAllOrder() {
        List<OrderInfo> list = callO.findAllOrder();
        ModelAndView mav=new ModelAndView();
        mav.setViewName("show_order");
        mav.addObject("list",list);
        return mav;
    }
}
