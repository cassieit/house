package com.etc.renting.biz.impl;

import com.etc.renting.biz.AreaBiz;
import com.etc.renting.dao.AreaDao;
import com.etc.renting.entity.Area;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AreaBizImpl implements AreaBiz {

    @Resource
    private AreaDao areaDao;

    @Override
    public Area queryAreaByID(Integer area_id) {
        return areaDao.queryAreaByID(area_id);
    }

    @Override
    public List<Area> queryAllArea() {
        return areaDao.queryAllArea();
    }


    @Override
    public boolean addArea(Area area) {
        return areaDao.addArea(area);
    }

    @Override
    public boolean updateArea(Area area) {
        return areaDao.updateArea(area);
    }

    @Override
    public boolean deleteArea(Integer area_id) {
        return areaDao.deleteArea(area_id);
    }
}
