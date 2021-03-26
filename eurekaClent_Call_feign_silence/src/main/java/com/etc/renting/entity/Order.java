package com.etc.renting.entity;

public class Order {
    private Integer orders_id;
    private Integer users_id;
    private Integer houses_id;
    private String orders_time;
    private String orders_state;

    public Integer getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(Integer orders_id) {
        this.orders_id = orders_id;
    }

    public Integer getUsers_id() {
        return users_id;
    }

    public void setUsers_id(Integer users_id) {
        this.users_id = users_id;
    }

    public Integer getHouses_id() {
        return houses_id;
    }

    public void setHouses_id(Integer houses_id) {
        this.houses_id = houses_id;
    }

    public String getOrders_time() {
        return orders_time;
    }

    public void setOrders_time(String orders_time) {
        this.orders_time = orders_time;
    }

    public String getOrders_state() {
        return orders_state;
    }

    public void setOrders_state(String orders_state) {
        this.orders_state = orders_state;
    }
}
