package com.etc.renting.dao;

import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Images;

import java.util.List;

public interface ImagesDao {
//    根据houses_id查询对应房源的所有图片
    public List<Images> queryByHousesId(Integer houses_id);

//根据houses_id查询对应房源的所有信息
    public List<HousesInfo> queryByHousesid(Integer houses_id);
}
