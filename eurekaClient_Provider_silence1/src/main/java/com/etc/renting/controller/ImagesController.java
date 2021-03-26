package com.etc.renting.controller;

import com.etc.renting.biz.ImagesBiz;
import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Images;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/imagesController")
public class ImagesController {
    @Resource
    private ImagesBiz biz;
    //    根据houses_id查询对应房源的所有图片
     @RequestMapping("/queryByHousesId")
     public List<Images> queryByHousesId(@RequestParam Integer houses_id){
         return biz.queryByHousesId(houses_id);
     }
    //    根据houses_id查询对应房源的所有图片
    @RequestMapping("/queryByHousesid")
    public List<HousesInfo> queryByHousesid(@RequestParam Integer houses_id){
        return biz.queryByHousesid(houses_id);
    }
}
