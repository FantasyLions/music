package com.migu.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    //读取hibernate.cfg.xml文件  
    static Configuration cfg = new Configuration().configure();
    //建立SessionFactory  
    static SessionFactory factory = cfg.buildSessionFactory();
    
    private HibernateUtils() {}
    
    /**
     * 插入数据
     * @param object
     */
    public static void insertObject( Object object ) {
        //取得session  
        Session session = null;
        try {
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
            //保存对象  
            session.save( object );  
            //提交事务  
            session.getTransaction().commit();  
        } catch(Exception e) {
            e.printStackTrace();
            //回滚事务  
            session.getTransaction().rollback();
        }finally {
            if (session != null) {
                if (session.isOpen()) {
                    //关闭session
                    session.close();
                }
            }
        }
    }
    
    public static Object getObject( Class clazz, int id ) {
      //取得session  
        Session session = null;
        Object object = null;
        try {
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
            //保存对象  
            object = session.get(clazz, id);
              
        }catch(Exception e) {
            e.printStackTrace();
            //回滚事务  
            session.getTransaction().rollback();
        }finally {
            if (session != null) {
                if (session.isOpen()) {
                    //关闭session
                    session.close();
                }
            }
        }
        return object;
    }
}
