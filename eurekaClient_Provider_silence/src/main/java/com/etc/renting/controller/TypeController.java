package com.etc.renting.controller;

import com.etc.renting.biz.TypeBiz;
import com.etc.renting.entity.Type;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/typeController")
public class TypeController {

    @Resource
    private TypeBiz typeBiz;

    @RequestMapping("/queryTypeByID")
    public Type queryTypeByID(@RequestParam Integer type_id){
        return typeBiz.queryTypeByID(type_id);
    }

    @RequestMapping("/queryAllType")
    public List<Type> queryAllType(){
        return typeBiz.queryAllType();
    }


    @RequestMapping("/addType")
    public Boolean addType(@RequestBody Type type){

        return typeBiz.addType(type);
    }

    @RequestMapping("/updateType")
    public Boolean updateType(@RequestBody Type type) {

        return typeBiz.updateType(type);
    }

    @RequestMapping("/deleteType")
    public Boolean deleteType(@RequestParam Integer type_id) {

        return typeBiz.deleteType(type_id);
    }


}




