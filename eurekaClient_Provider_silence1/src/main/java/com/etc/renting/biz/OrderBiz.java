package com.etc.renting.biz;

import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;

import java.util.List;

public interface OrderBiz {
    //根据订单ID查询订单
    public Order findById(Integer orders_id);
    //查询全部订单
    public List<Order> findList();
    //根据用户ID查询订单
    public List<Order> findByUserId(Integer users_id);
    //添加进订单列表
    public boolean addOrder(Order order);
    //修改订单信息
    public boolean updateOrder(Order order);
    //删除订单
    public boolean deleteByid(Integer orders_id);

    //根据用户iD查询订单信息
    public List<OrderInfo> findByUserid(Integer users_id);
    //查询所有订单信息
    public List<OrderInfo> findAllOrder();
}
