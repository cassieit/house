package com.etc.renting.hystrix;

import com.etc.renting.dto.OrderInfo;
import com.etc.renting.entity.Order;
import com.etc.renting.feigninterface.Call_eureka_client_provider_order;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class Call_eureka_client_provider_hystrix_order implements Call_eureka_client_provider_order {


    @Override
    public Order findById(Integer orders_id) {
        return null;
    }

    @Override
    public List<OrderInfo> findByUserid(Integer users_id) {
        return null;
    }

    @Override
    public List<Order> findList() {
        return null;
    }

    @Override
    public List<Order> findByUserId(Integer users_id) {
        return null;
    }

    @Override
    public boolean addOrder(Order order, Integer users_id, Integer houses_id) {
        return false;
    }

    @Override
    public boolean updateOrder(Order order, Integer orders_id, String orders_state) {
        return false;
    }

    @Override
    public boolean deleteByid(Integer orders_id) {
        return false;
    }

    @Override
    public List<OrderInfo> findAllOrder() {
        return null;
    }
}
