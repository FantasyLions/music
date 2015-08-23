package com.migu.dao.Imp;


import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.migu.dao.SingerDao;
import com.migu.dto.Singer;
import com.migu.utils.dao.HibernateDao;

@Repository("singerDao")
public class SingerDaoImp extends HibernateDao<Singer> implements SingerDao{

    @Override
    public Singer saveObject(Singer singer) {
        Serializable id = this.save( singer );
        return this.get(id);
    }

    @Override
    public void removeObject(Serializable id) {
        this.remove(id);
    }

    @Override
    public void updateObject(Singer t) {
        this.updateObject(t);
    }

    @Override
    public Singer getObject(Serializable id) {
        return this.getObject(id);
    }

    @Override
    public List<Singer> listObjects(Singer t) {
        return this.listObjects(t);
    }


    


}
