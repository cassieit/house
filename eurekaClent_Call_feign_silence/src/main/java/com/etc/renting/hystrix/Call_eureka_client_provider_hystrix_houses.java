package com.etc.renting.hystrix;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Houses;
import com.etc.renting.entity.Images;
import com.etc.renting.feigninterface.Call_eureka_client_provider_houses;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Call_eureka_client_provider_hystrix_houses implements Call_eureka_client_provider_houses {

    @Override
    public Boolean addHouses(Houses houses) {
        System.out.println("addhouses服务不可用，请稍后再试");
        return false;
    }

    @Override
    public List<Houses> queryAllHouses() {
        System.out.println("queryAllhouses服务不可用，请稍后再试");
        return null;
    }
    @Override
    public List<Houses> queryFour() {
        System.out.println("queryFour服务不可用，请稍后再试");
        return null;
    }
    @Override
    public List<Houses> queryNew() {
        System.out.println("queryNew服务不可用，请稍后再试");
        return null;
    }
    @Override
    public List<Houses> queryCheap() {
        System.out.println("queryCheap服务不可用，请稍后再试");
        return null;
    }
    @Override
    public Houses queryByName(String houses_name) {
        System.out.println("queryByName服务不可用，请稍后再试");
        return null;
    }
    @Override
    public Houses queryById(Integer houses_id) {
        System.out.println("queryById服务不可用，请稍后再试");
        return null;
    }
    @Override
    public Houses queryById1(Integer houses_id) {
        System.out.println("queryById1服务不可用，请稍后再试");
        return null;
    }

    @Override
    public List<Images> queryByHousesId(Integer houses_id) {
        System.out.println("queryByHousesId服务不可用，请稍后再试");
        return null;
    }

    @Override
    public List<HousesInfo> queryByHousesid(Integer houses_id) {
        System.out.println("queryByHousesid服务不可用，请稍后再试");
        return null;
    }

    @Override
    public List<HousesAT> queryAllHouses4() {
        System.out.println("queryAllHouses4服务不可用，请稍后再试");
        return null;
    }

    @Override
    public HousesAT queryHousesByID(Integer houses_id) {
        return null;
    }


    @Override
    public List<HousesAT> queryHousesByPrice() {
        return null;
    }

    @Override
    public List<HousesAT> queryHousesByTime() {
        return null;
    }

    @Override
    public Boolean deleteHouses(Integer houses_id) {
        return null;
    }

    @Override
    public Boolean reHouses(Integer houses_id) {
        return null;
    }

    @Override
    public Boolean updateHouses(Houses houses) {
        return null;
    }
}
