package com.etc.renting.biz.impl;

import com.etc.renting.biz.HousesBiz;
import com.etc.renting.dao.HousesDao;
import com.etc.renting.dto.HousesAT;
import com.etc.renting.entity.Houses;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HousesBizImpl implements HousesBiz {
    @Resource
    private HousesDao dao ;
//添加房子
    @Override
    public boolean addHouses(Houses houses) {
        return dao.addHouses(houses);
    }
//查询出所有房子信息
    @Override
    public List<Houses> queryAllHouses() {
        return dao.queryAllHouses();
    }
    //    查询出前四条房子信息
    @Override
    public List<Houses> queryFour() {
        return dao.queryFour();
    }
    //    查询出最新添加的四条房子信息
    @Override
    public List<Houses> queryNew() {
        return dao.queryNew();
    }
    //    查询出房子价格最便宜的四条房子信息
    @Override
    public List<Houses> queryCheap() {
        return dao.queryCheap();
    }
    //    通过名称模糊查询房子信息
    @Override
    public Houses queryByName(String houses_name) {
        return dao.queryByName(houses_name);
    }
    //    通过房子ID查询出房子信息
    @Override
    public Houses queryById(Integer houses_id) {
        return dao.queryById(houses_id);
    }




    //查询所有房源信息
    public List<HousesAT> queryAllHouses4() {return dao.queryAllHouses4();}


    //根据房源ID查询所有信息
    public HousesAT queryHousesByID(Integer houses_id) {
        return dao.queryHousesByID(houses_id);
    }


    //根据价格查询房源信息（由低到高）
    @Override
    public List<HousesAT> queryHousesByPrice() {
        return dao.queryHousesByPrice();
    }


    //根据时间查询房源信息（最新）
    @Override
    public List<HousesAT> queryHousesByTime() {
        return dao.queryHousesByTime();
    }

    //根据ID将房源状态修改为0（下架）
    public Boolean deleteHouses(Integer houses_id){
        return dao.deleteHouses(houses_id);
    }

    //根据ID将房源状态修改为1（上架）
    public Boolean reHouses(Integer houses_id){
        return dao.reHouses(houses_id);
    }

    //更新房源信息
    public Boolean updateHouses(Houses houses) {
        return dao.updateHouses(houses);
    }


}
