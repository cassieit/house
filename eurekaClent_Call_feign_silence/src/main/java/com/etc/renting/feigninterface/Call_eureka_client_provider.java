package com.etc.renting.feigninterface;

import com.etc.renting.entity.Admin;
import com.etc.renting.entity.Area;
import com.etc.renting.entity.Type;
import com.etc.renting.entity.User;
import com.etc.renting.hystrix.Call_eureka_client_provider_hystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider-silence",fallback = Call_eureka_client_provider_hystrix.class)  //填入的是要调用的服务的名字
public interface Call_eureka_client_provider {

    //接口中方法结构和名字与 对应的服务提供者控制器方法的结构和名字一致


    @RequestMapping("/userController/checkLogin")
    public User checkLogin(@RequestParam String user_name,@RequestParam String user_pwd);

    @RequestMapping("/userController/updateUser")
    public Boolean updateUser(@RequestBody User user);

    @RequestMapping("/userController/deleteUser")
    public Boolean deleteUser(@RequestParam Integer user_id);

    @RequestMapping("/userController/reUser")
    public Boolean reUser(@RequestParam Integer user_id);

    @RequestMapping("/userController/addUser")
    public Boolean addUser(@RequestBody User user);


    @RequestMapping("/userController/queryAllUser")
    public List<User> queryAllUser();

    @RequestMapping("/userController/queryByID")
    public User queryByID(@RequestParam Integer user_id);

    @RequestMapping("/userController/queryByName")
    public User queryByName(@RequestParam String user_name);

    @RequestMapping("/userController/queryByCard")
    public User queryByCard(@RequestParam String user_card);

    @RequestMapping("/userController/queryByTel")
    public User queryByTel(@RequestParam  String user_tel);

    @RequestMapping("/adminController/checkLogin")
    public Admin checkLogin(@RequestBody Admin admin);



    @RequestMapping("/areaController/queryAreaByID")
    public Area queryAreaByID(Integer area_id);

    @RequestMapping("/areaController/queryAllArea")
    public List<Area> queryAllArea();

    @RequestMapping("/areaController/addArea")
    public boolean addArea(Area area);

    @RequestMapping("/areaController/updateArea")
    public boolean updateArea(Area area);

    @RequestMapping("/areaController/deleteArea")
    public boolean deleteArea(Integer area_id);


    @RequestMapping("/typeController/queryTypeByID")
    public Type queryTypeByID(Integer type_id);

    @RequestMapping("/typeController/queryAllType")
    public List<Type> queryAllType();

    @RequestMapping("/typeController/addType")
    public boolean addType(Type type);

    @RequestMapping("/typeController/updateType")
    public boolean updateType(Type type);

    @RequestMapping("/typeController/deleteType")
    public boolean deleteType(Integer type_id);

}
