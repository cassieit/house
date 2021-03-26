package com.etc.renting.dao;

import com.etc.renting.entity.Area;

import java.util.List;

public interface AreaDao {
    //查询
    public Area queryAreaByID(Integer area_id);

    //查询
    public List<Area> queryAllArea();

    //添加
    public boolean addArea(Area area);

    //修改
    public boolean updateArea(Area area);

    //删除
    public boolean deleteArea(Integer area_id);
}
