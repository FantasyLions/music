package com.migu.utils.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class HibernateDao<T> extends HibernateDaoSupport {
    
    private Class<T> entityClass = null;
    
    public HibernateDao() {
        initEntityClass();
    }
    
    public T getObject( Serializable id ) {
        return (T)this.getHibernateTemplate().get(entityClass, id);
    }
    
    public void removeObject( T o ) {
        this.getHibernateTemplate().delete( o );
    }
    
    public void removeObject(  Serializable id ) {
        removeObject( getObject( id ) );
    }
    
    public void find( String hql, Object... values ) {
        this.getHibernateTemplate().find(hql, values);
    }
    
    
    public void initEntityClass() {
        entityClass = getSuperClassGenricType( getClass(), 0 );
    }
    
    public static Class getSuperClassGenricType(Class clazz, int index) {

        Type genType = clazz.getGenericSuperclass();    //获取clazz的直接超类
        /*判断是否继承自此类*/
        if (!(genType instanceof ParameterizedType)) {
            //loger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        /*判断传的参数：index 是否合法*/
        if (index >= params.length || index < 0) {
            //log.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
            //        + params.length);
            return Object.class;
        }
        /*判断是否是真正的类型，因为可能是 泛化类型 T */
        if (!(params[index] instanceof Class)) {
            //log.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
            return Object.class;
        }
        return (Class) params[index];
    }
}
