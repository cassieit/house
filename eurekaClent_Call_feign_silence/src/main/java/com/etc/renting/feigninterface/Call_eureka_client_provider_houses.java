package com.etc.renting.feigninterface;

import com.etc.renting.dto.HousesAT;
import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Houses;
import com.etc.renting.entity.Images;
import com.etc.renting.hystrix.Call_eureka_client_provider_hystrix;
import com.etc.renting.hystrix.Call_eureka_client_provider_hystrix_houses;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider-silence1")  //填入的是要调用的服务的名字

public interface Call_eureka_client_provider_houses {

    //接口中方法结构和名字与 对应的服务提供者控制器方法的结构和名字一致
    //添加房子
    @RequestMapping("/housesController/addHouses")
    public Boolean addHouses(@RequestBody Houses houses);
    //查询出所有房子信息
    @RequestMapping("/housesController/queryAllHouses")
    public List<Houses> queryAllHouses();
    //    查询出前四条房子信息
    @RequestMapping("/housesController/queryFour")
    public List<Houses> queryFour();
    //    查询出最新添加的四条房子信息
    @RequestMapping("/housesController/queryNew")
    public List<Houses> queryNew();
    //    查询出房子价格最便宜的四条房子信息
    @RequestMapping("/housesController/queryCheap")
    public List<Houses> queryCheap();
    //    通过名称模糊查询房子信息
    @RequestMapping("/housesController/queryByName")
    public Houses queryByName(@RequestParam String houses_name);
    //    通过房子ID查询出房子信息
    @RequestMapping("/housesController/queryById")
    public Houses queryById(@RequestParam Integer houses_id);
//测试用的
    @RequestMapping("/housesController/queryById1")
    public Houses queryById1(@RequestParam Integer houses_id);
    //    根据houses_id查询对应房源的所有图片
    @RequestMapping("/imagesController/queryByHousesId")
    public List<Images> queryByHousesId(@RequestParam Integer houses_id);

    //    根据houses_id查询对应房源的所有图片
    @RequestMapping("/imagesController/queryByHousesid")
    public List<HousesInfo> queryByHousesid(@RequestParam Integer houses_id);

    //查询所有房源信息
    @RequestMapping("/housesController/queryAllHouses4")
    public List<HousesAT> queryAllHouses4();


    //根据房源ID查询所有信息
    @RequestMapping("/housesController/queryHousesByID")
    public HousesAT queryHousesByID(@RequestParam Integer houses_id) ;

    //根据价格查询房源信息（由低到高）
    @RequestMapping("/housesController/queryHousesByPrice")
    public List<HousesAT> queryHousesByPrice();


    //根据时间查询房源信息（最新）
    @RequestMapping("/housesController/queryHousesByTime")
    public List<HousesAT> queryHousesByTime();

    //根据ID将房源状态修改为0（下架）
    @RequestMapping("/housesController/deleteHouses")
    public Boolean deleteHouses(@RequestParam Integer houses_id);

    //根据ID将房源状态修改为1（上架）
    @RequestMapping("/housesController/reHouses")
    public Boolean reHouses(@RequestParam Integer houses_id);

    //更新房源信息
    @RequestMapping("/housesController/updateHouses")
    public Boolean updateHouses(@RequestBody Houses houses);



}
