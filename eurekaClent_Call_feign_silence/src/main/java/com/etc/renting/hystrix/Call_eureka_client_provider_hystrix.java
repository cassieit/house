package com.etc.renting.hystrix;

import com.etc.renting.entity.Admin;
import com.etc.renting.entity.Area;
import com.etc.renting.entity.Type;
import com.etc.renting.entity.User;
import com.etc.renting.feigninterface.Call_eureka_client_provider;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Call_eureka_client_provider_hystrix implements Call_eureka_client_provider {

    @Override
    public User checkLogin(String user_name, String user_pwd) {
        System.out.println("远程服务checkLogin不可用，请稍后再试");
        return null;
    }


    @Override
    public Boolean addUser(User user) {
        System.out.println("adduser服务不可用，请稍后再试");
        return false;
    }

    @Override
    public Boolean updateUser(User user) {
        System.out.println("updateuser服务不可用，请稍后再试");
        return null;
    }

    @Override
    public Boolean deleteUser(Integer user_id) {
        System.out.println("deleteuser服务不可用，请稍后再试");
        return null;
    }

    @Override
    public Boolean reUser(Integer user_id) {
        return null;
    }

    @Override
    public List<User> queryAllUser() {
        System.out.println("queryAllUser服务不可用，请稍后再试");
        return null;
    }

    @Override
    public User queryByID(Integer user_id) {
        return null;
    }

    @Override
    public User queryByName(String user_name) {
        System.out.println("queryByName服务不可用，请稍后再试");
        return null;
    }

    @Override
    public User queryByCard(String user_card) {
        System.out.println("queryByCard服务不可用，请稍后再试");
        return null;
    }

    @Override
    public User queryByTel(String user_tel) {
        System.out.println("queryByTel服务不可用，请稍后再试");
        return null;
    }

    @Override
    public Admin checkLogin(Admin admin){
        System.out.println("checkLogin服务不可用，请稍后再试");
        return null;
    }

    @Override
    public Area queryAreaByID(Integer area_id) {
        return null;
    }

    @Override
    public List<Area> queryAllArea() {
        return null;
    }

    @Override
    public boolean addArea(Area area) {
        return false;
    }

    @Override
    public boolean updateArea(Area area) {
        return false;
    }

    @Override
    public boolean deleteArea(Integer area_id) {
        return false;
    }

    @Override
    public Type queryTypeByID(Integer type_id) {
        return null;
    }

    @Override
    public List<Type> queryAllType() {
        return null;
    }

    @Override
    public boolean addType(Type type) {
        return false;
    }

    @Override
    public boolean updateType(Type type) {
        return false;
    }

    @Override
    public boolean deleteType(Integer type_id) {
        return false;
    }
}
