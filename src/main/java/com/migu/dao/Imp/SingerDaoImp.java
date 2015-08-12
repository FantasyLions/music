package com.migu.dao.Imp;


import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.migu.dao.SingerDao;
import com.migu.dto.Singer;

@Repository("singerDao")
public class SingerDaoImp extends HibernateDaoSupport implements SingerDao{

    public void insertSinger( Object o ) {
        getHibernateTemplate().save( o );
        //return false;
    }

    public boolean delSinger( Singer singer ) {
        // TODO Auto-generated method stub
        return false;
    }

    public boolean getSinger(int singerId) {
        // TODO Auto-generated method stub
        return false;
    }
    
    @Resource(name="sessionFactory")
    public void setSessionFactory0(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }

}
