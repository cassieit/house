package com.etc.renting.biz;

import com.etc.renting.entity.Type;

import java.util.List;

public interface TypeBiz {
    //查询
    public Type queryTypeByID(Integer type_id);

    //查询所有
    public List<Type> queryAllType();
    //添加
    public boolean addType(Type type);

    //修改
    public boolean updateType(Type type);

    //删除
    public boolean deleteType(Integer type_id);
}
