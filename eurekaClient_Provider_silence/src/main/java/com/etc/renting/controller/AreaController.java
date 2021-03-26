package com.etc.renting.controller;

import com.etc.renting.biz.AreaBiz;
import com.etc.renting.entity.Area;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/areaController")
public class AreaController {

    @Resource
    private AreaBiz areaBiz;

    @RequestMapping("/queryAreaByID")
    public Area queryAreaByID(@RequestParam Integer area_id){
        return areaBiz.queryAreaByID(area_id);
    }

    @RequestMapping("/queryAllArea")
    public List<Area> queryAllArea(){
        return areaBiz.queryAllArea();
    }


    @RequestMapping("/addArea")
    public Boolean addArea(@RequestBody Area area){

        return areaBiz.addArea(area);
    }

    @RequestMapping("/updateArea")
    public Boolean updateArea(@RequestBody Area area) {

        return areaBiz.updateArea(area);
    }

    @RequestMapping("/deleteArea")
    public Boolean deleteArea(@RequestParam Integer area_id) {

        return areaBiz.deleteArea(area_id);
    }


}




