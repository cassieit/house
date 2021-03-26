package com.etc.renting.controller;

import com.etc.renting.biz.OrderBiz;
import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;



@RestController
@RequestMapping("/orderController")
public class OrderController {
    @Resource
    private OrderBiz biz;
    private Order order;

    //根据订单ID查询订单
    @RequestMapping("/findById")
    public Order findById(@RequestParam Integer orders_id){
        return biz.findById(orders_id);
    }
    //查询全部订单
    @RequestMapping("/findList")
    public List<Order> findList(){
        return biz.findList();
    }

    //根据用户ID查询订单
    @RequestMapping("/findByUserId")
    public List<Order> findByUserId(@RequestParam Integer users_id){
        return biz.findByUserId(users_id);
    }

    //根据用户ID查询订单相关所有信息
    @RequestMapping("/findByUserid")
    public List<OrderInfo> findByUserid(@RequestParam Integer users_id){
        return biz.findByUserid(users_id);
    }
    //添加进订单列表
    @RequestMapping("/addOrder")
    public boolean addOrder(@RequestBody Order order,@RequestParam Integer users_id,@RequestParam Integer houses_id){
        Order order1=new Order();
        order1.setUsers_id(users_id);
        order1.setHouses_id(houses_id);
        return biz.addOrder(order1);
    }

//添加订单信息
@RequestMapping("/addOrder2")
public boolean addOrder2(Order order,Integer users_id,Integer houses_id){
    Order order2=new Order();
    order2.setUsers_id(users_id);
    order2.setHouses_id(houses_id);
    return biz.addOrder(order2);
}
    //修改订单信息  测试
    @RequestMapping("/updateOrder")
    public boolean updateOrder(@RequestBody Order order,@RequestParam Integer orders_id,@RequestParam String orders_state) {
        Order order2 = new Order();
        order2.setOrders_id(orders_id);
        order2.setOrders_state(orders_state);
        return biz.updateOrder(order2);
    }
    //删除已撤销的订单
    @RequestMapping("/deleteByid")
    public boolean deleteByid(@RequestParam Integer orders_id){
        return biz.deleteByid(orders_id);
    }


    //查询所有订单信息
    @RequestMapping("/findAllOrder")
    public List<OrderInfo> findAllOrder(){
        return biz.findAllOrder();
    }
}
