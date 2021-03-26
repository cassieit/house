package com.etc.renting.biz.impl;

import com.etc.renting.biz.TypeBiz;
import com.etc.renting.dao.TypeDao;
import com.etc.renting.entity.Type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TypeBizImpl implements TypeBiz {

    @Resource
    private TypeDao typeDao;

    @Override
    public Type queryTypeByID(Integer type_id) {
        return typeDao.queryTypeByID(type_id);
    }

    @Override
    public List<Type> queryAllType() {
        return typeDao.queryAllType();
    }

    @Override
    public boolean addType(Type type) {
        return typeDao.addType(type);
    }

    @Override
    public boolean updateType(Type type) {
        return typeDao.updateType(type);
    }

    @Override
    public boolean deleteType(Integer type_id) {
        return typeDao.deleteType(type_id);
    }
}
