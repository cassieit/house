package com.etc.renting.feigninterface;


import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;
import com.etc.renting.hystrix.Call_eureka_client_provider_hystrix_order;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider-silence1")  //填入的是要调用的服务的名字
public interface Call_eureka_client_provider_order {

    //根据订单ID查询订单
    @RequestMapping("/orderController/findById")
    public Order findById(@RequestParam Integer orders_id);

    //根据用户ID查询订单相关所有信息
    @RequestMapping("/orderController/findByUserid")
    public List<OrderInfo> findByUserid(@RequestParam Integer users_id);
    //查询全部订单
    @RequestMapping("/orderController/findList")
    public List<Order> findList();

    //根据用户ID查询订单
    @RequestMapping("/orderController/findByUserId")
    public List<Order> findByUserId(@RequestParam Integer users_id);
    //添加进订单列表
    @RequestMapping("/orderController/addOrder")
    public boolean addOrder(@RequestBody Order order, @RequestParam Integer users_id, @RequestParam Integer houses_id);
    //修改订单信息
    @RequestMapping("/orderController/updateOrder")
    public boolean updateOrder(@RequestBody Order order, @RequestParam Integer orders_id, @RequestParam String orders_state);
    //删除已撤销的订单
    @RequestMapping("/orderController/deleteByid")
    public boolean deleteByid(@RequestParam Integer orders_id);

    //查询所有订单信息
    @RequestMapping("/orderController/findAllOrder")
    public List<OrderInfo> findAllOrder();

}
