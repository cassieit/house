package com.etc.renting.dao;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.entity.Houses;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface HousesDao {
    //添加房子
    public boolean addHouses(Houses houses);
//    查询出所有房子
    public List<Houses> queryAllHouses();
//    查询出前四条房子信息
    public List<Houses> queryFour();
//    查询出最新添加的四条房子信息
    public List<Houses> queryNew();
    //    查询出房子价格最便宜的四条房子信息
    public List<Houses> queryCheap();

//    通过名称模糊查询房子信息
    public Houses queryByName(String houses_name);
//    通过房子ID查询出房子信息
    public Houses queryById(Integer houses_id);

    //查询所有房源信息
    public List<HousesAT> queryAllHouses4();

    //根据房源ID查询所有信息
    public HousesAT queryHousesByID(Integer houses_id);

    //根据价格查询房源信息（由低到高）
    public List<HousesAT> queryHousesByPrice();

    //根据时间查询房源信息（最新）
    public List<HousesAT> queryHousesByTime();

    //根据ID将房源状态修改为0（下架）
    public Boolean deleteHouses(Integer houses_id);

    //根据ID将房源状态修改为1（上架）
    public Boolean reHouses(Integer houses_id);

    //更新房源信息
    public Boolean updateHouses(Houses houses);



}
