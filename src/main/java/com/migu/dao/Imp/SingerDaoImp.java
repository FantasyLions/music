package com.migu.dao.Imp;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.migu.dao.SingerDao;
import com.migu.dto.Singer;
import com.migu.utils.dao.HibernateDao;

@Repository("singerDao")
public class SingerDaoImp extends HibernateDao<Singer> implements SingerDao{


    @Override
    public Singer saveObject(Singer singer) {
        save( singer );
        return null;
    }

    @Override
    public void removeObject(Serializable id) {
        remove(id);
    }

    @Override
    public void updateObject(Singer singer) {
        update( singer );
    }

    @Override
    public Singer getObject(Serializable id) {
        return get( id );
    }

    @Override
    public List<Singer> listObjects(Singer singer) {
        List<Object> values = new ArrayList<Object>();
        String hql = getHqlFindStr( "Singer", singer, values );
        return find( hql, values );
    }

//    @Override
//    public List<Singer> pageObject(Singer singer, Integer pageIndex, Integer pageSize) {
//        return pageObject( singer, pageIndex, pageSize );
//    }

}
