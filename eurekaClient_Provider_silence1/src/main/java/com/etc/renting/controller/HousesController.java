package com.etc.renting.controller;

import com.etc.renting.biz.HousesBiz;
import com.etc.renting.dto.HousesAT;
import com.etc.renting.entity.Houses;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/housesController")
public class HousesController {

    @Resource
    private HousesBiz biz;
    //添加房子
    @RequestMapping("/addHouses")
    public Boolean addHouses(@RequestBody Houses houses){

        return biz.addHouses(houses);
    }

    //    查询出所有房子
    @RequestMapping("/queryAllHouses")
    public List<Houses> queryAllHouses(){

        return biz.queryAllHouses();
    }
    //    查询出前四条房子信息
    @RequestMapping("/queryFour")
    public List<Houses> queryFour(){

        return biz.queryFour();
    }
    //    查询出最新添加的四条房子信息
    @RequestMapping("/queryNew")
    public List<Houses> queryNew(){

        return biz.queryNew();
    }
    //    查询出房子价格最便宜的四条房子信息
    @RequestMapping("/queryCheap")
    public List<Houses> queryCheap(){

        return biz.queryCheap();
    }
    //    通过名称模糊查询房子信息
    @RequestMapping("/queryByName")
    public Houses queryByName(@RequestParam String houses_name){

        return biz.queryByName(houses_name);
    }
    //    通过房子ID查询出房子信息
    @RequestMapping("/queryById")
    public Houses queryById(@RequestParam Integer houses_id){

        return biz.queryById(houses_id);
    }

    //    通过房子ID查询出房子信息
    @RequestMapping("/queryById1")
    public Houses queryById1(@RequestParam Integer houses_id){

        return biz.queryById(houses_id);
    }

    //查询所有房源信息
    @RequestMapping("/queryAllHouses4")
    public List<HousesAT> queryAllHouses4() {
        return biz.queryAllHouses4();
    }

    //根据房源ID查询所有信息
    @RequestMapping("/queryHousesByID")
    public HousesAT queryHousesByID(@RequestParam Integer houses_id) {
        return biz.queryHousesByID(houses_id);
    }


    //根据价格查询房源信息（由低到高）
    @RequestMapping("/queryHousesByPrice")
    public List<HousesAT> queryHousesByPrice(){
        return biz.queryHousesByPrice();
    }

    //根据时间查询房源信息（最新）
    @RequestMapping("/queryHousesByTime")
    public List<HousesAT> queryHousesByTime(){
        return biz.queryHousesByTime();
    }


    //根据ID将房源状态修改为0（下架）
    @RequestMapping("/deleteHouses")
    public Boolean deleteHouses(@RequestParam Integer houses_id){
        return biz.deleteHouses(houses_id);
    }

    //根据ID将房源状态修改为1（上架）
    @RequestMapping("/reHouses")
    public Boolean reHouses(@RequestParam Integer houses_id){
        return biz.reHouses(houses_id);
    }

    //更新房源信息
    @RequestMapping("/updateHouses")
    public Boolean updateHouses(@RequestBody Houses houses) {
        return biz.updateHouses(houses);
    }


}
