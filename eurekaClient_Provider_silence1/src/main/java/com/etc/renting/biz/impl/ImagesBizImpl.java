package com.etc.renting.biz.impl;

import com.etc.renting.biz.ImagesBiz;
import com.etc.renting.dao.ImagesDao;
import com.etc.renting.dto.HousesInfo;
import com.etc.renting.entity.Images;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ImagesBizImpl implements ImagesBiz {
    @Resource
    private ImagesDao dao;
    //    根据houses_id查询对应房源的所有图片
    @Override
    public List<Images> queryByHousesId(Integer houses_id) {
        return dao.queryByHousesId(houses_id);
    }
    //    根据houses_id查询对应房源的所有信息
    @Override
    public List<HousesInfo> queryByHousesid(Integer houses_id) {
        return dao.queryByHousesid(houses_id);
    }
}
