package com.etc.renting.biz.impl;

import com.etc.renting.biz.OrderBiz;
import com.etc.renting.dao.ImagesDao;
import com.etc.renting.dao.OrderDao;
import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OderBizImpl implements OrderBiz {
    @Resource
    private OrderDao dao;
    //根据订单ID查询订单
    @Override
    public Order findById(Integer orders_id) {
        return dao.findById(orders_id);
    }
    //查询全部订单
    @Override
    public List<Order> findList() {
        return dao.findList();
    }
    //根据用户ID查询订单
    @Override
    public List<Order> findByUserId(Integer users_id) {
        return dao.findByUserId(users_id);
    }
    //添加进订单列表
    @Override
    public boolean addOrder(Order order) {
        return dao.addOrder(order);
    }
    //修改订单信息
    @Override
    public boolean updateOrder(Order order) {
        return dao.updateOrder(order);
    }
    //删除订单
    @Override
    public boolean deleteByid(Integer orders_id) {
        return dao.deleteByid(orders_id);
    }

    @Override
    public List<OrderInfo> findByUserid(Integer users_id) {
        return dao.findByUserid(users_id);
    }

    @Override
    public List<OrderInfo> findAllOrder() {
        return dao.findAllOrder();
    }
}
