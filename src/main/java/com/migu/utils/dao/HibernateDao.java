package com.migu.utils.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.migu.dto.Singer;

public class HibernateDao<T> extends HibernateDaoSupport{
    
    @SuppressWarnings("unchecked")
    private Class<T> entityClass = getSuperClassGenricType( this.getClass(),0 );
    
    public Serializable save( T entity ) {
        return this.getHibernateTemplate().save(entity);
    }
    
    public T get( Serializable id ) {
        return this.getHibernateTemplate().get(entityClass, id);
    }
    
    public void update( T entity ) {
        this.getHibernateTemplate().update(entity);
    }
    
    public void remove( Serializable id ) {
        T entity = this.get(id);
        this.remove(entity);
    }
    
    public void remove( T entity ) {
        this.getHibernateTemplate().delete(entity);
    }
    
    @SuppressWarnings("unchecked")
    public List<T> find( String hql, Object... values ) {
        return (List<T>)this.getHibernateTemplate().find(hql, values);
    }
    
    @SuppressWarnings("unchecked")
    public List<T> pageObject( T t, Integer pageIndex, Integer pageSize ) {
        List<Object> values = new ArrayList<Object>();
        String hql = getHqlFindStr( t.getClass().getSimpleName(), t, values );
        Query query = this.getSession().createQuery( hql );
        int firstRow = ( pageIndex - 1 ) * pageSize;
        query.setFirstResult( firstRow );
        query.setMaxResults( pageSize );
        if (values != null) {
            for (int i = 0; i < values.size(); i++) {
                query.setParameter(i, values.get(i));
            }
        }
        return (List<T>)query.list();
    }
    
    /**
     * 
     * @param ClassName     类名
     * @param entity        实体类实例
     * @param values        各个属性值
     * @return              hql(String)
     */
    public String getHqlFindStr( String ClassName, T entity, List<Object> values ) {
        StringBuilder hql = new StringBuilder("from "+ClassName+" o where 1 = 1 ");
        Field[] fields = entity.getClass().getDeclaredFields();
        Method[] methods = entity.getClass().getMethods();
        try {
            Object returnValue = null;String fieldsName = null;
            for ( Field field : fields ) {
                fieldsName = field.getName();
                returnValue = findGeter( methods, fieldsName ).invoke(entity, null);
                if ( returnValue != null ) {
                    hql.append("and o."+fieldsName+" = ? ");
                    values.add( returnValue );
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
//        int lastComma = hql.lastIndexOf(",");
//        hql.replace(lastComma, lastComma+1, "");
        return hql.toString();
    }
    
    public Method findGeter( Method[] methods, String fildsName ) {
        for (Method method : methods ) {
            if ( method.getName().equalsIgnoreCase("get"+fildsName) ) {
                return method;
            }
        }
        return null;
    }
    
    /**
     * eg:from className o where 1 = 1 and o.filed1 = ? and o.filed2 = ?;
     * @param ClassName     类名
     * @param entity        实体类实例
     * @param values        各个属性值
     * @return              hql(String)
     */
    public String getHqlFindStr( String ClassName, T entity, List<Object> values ) {
    	StringBuilder hql = getHqlStr( entity, values, true, "o" );
    	return hql.toString();
    }
    
    /**
     * eg:update className o set o.filed1 = ?, o.filed2 = ?;
     * @param ClassName     类名
     * @param entity        实体类实例
     * @param values        各个属性值
     * @return              hql(String)
     */
    public String getHqlUpdateStr( String ClassName, T entity, List<Object> values ) {
    	StringBuilder hql = getHqlStr( entity, values, false, "o" );
    	return hql.toString();
    }
    
    /**
     * get any entity hql
     * eg1-update: update className o set filed1 = ?, filed2 = ?
     * eg2-find  : from className o where 1 = 1 and filed1 = ? and filed2 = ?
     * {@link #getPartStr(Class, Object, List, StringBuilder, String, boolean)} 
     * @param entity
     * @param values
     * @param bFind
     * @param alias
     * @return
     */
    public StringBuilder getHqlStr( T entity, List<Object> values, boolean bFind, String alias ) {
    	if ( alias == null || alias.isEmpty() ) 
    		alias = "o";
    	StringBuilder hql = bFind ? new StringBuilder("from "+entity.getClass().getSimpleName()+" " + alias + "where 1 = 1") : 
    			new StringBuilder("update "+entity.getClass().getSimpleName()+" " + alias + "set ");
    	StringBuilder hqlStr = bFind ? getPartFindStr( entity, values, alias ) : getPartUpdateStr(entity, values, alias);
    	hql.append(hqlStr);
    	return hql;
    }
    
    /**
     * {@link #getPartStr(Class, Object, List, StringBuilder, String, boolean)}
     * @param entity
     * @param values
     * @param alias
     * @return
     */
    public StringBuilder getPartFindStr( T entity, List<Object> values, String alias ) {
    	StringBuilder hql = new StringBuilder();
    	Class clazz = entity.getClass();
    	return getPartStr( clazz, entity, values, hql, alias, true );
    }
    
    /**
     * {@link #getPartStr(Class, Object, List, StringBuilder, String, boolean)}
     * @param entity
     * @param values
     * @param alias
     * @return
     */
    public StringBuilder getPartUpdateStr( T entity, List<Object> values, String alias ) {
    	StringBuilder hql = new StringBuilder();
    	Class clazz = entity.getClass();
    	return getPartStr( clazz, entity, values, hql, alias, false );
    }
    
    /**
     * part hql 
     * eg1-update:filed1 = ?, filed2 = ?
     * eg2-find  :filed1 = ? and filed2 = ?  
     * {@link #getPartStr(Class, Object, List, StringBuilder, String, boolean)}
     * @param clazz
     * @param entity
     * @param values
     * @param hql
     * @param alias
     * @param bFind
     * @return
     */
    public StringBuilder getPartStr( Class clazz, T entity, List<Object> values, StringBuilder hql, String alias, boolean bFind ) {
    	Field[] fields = clazz.getDeclaredFields();
        try {
            Object returnValue = null;String fieldsName = null ,preStr = null ,subStr = null;
            if ( bFind ) {
            	preStr = "and "+alias+".";
            	subStr = " = ? ";
            } else {
            	preStr = alias+".";
            	subStr = " = ? ,";
            }
            for ( Field field : fields ) {
                fieldsName = field.getName();
                returnValue = findGetter( clazz, fieldsName ).invoke(entity, null);
                if ( returnValue != null ) {
                    hql.append( preStr + fieldsName + subStr );
                    values.add( returnValue );
                }
            }
            Class superClass = clazz.getSuperclass();
            if ( superClass != null ) {
            	getPartStr( superClass, entity, values, hql, alias, bFind );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if ( bFind && !values.isEmpty() ) {
        	int lastComma = hql.lastIndexOf(",");
        	hql.replace(lastComma, lastComma+1, "");
        }
        return values.isEmpty() ? null : hql;
    }
    
//    public Method findGetter( Method[] methods, String fildsName ) {
//        for (Method method : methods ) {
//            if ( method.getName().equalsIgnoreCase("get"+fildsName) ) {
//                return method;
//            }
//        }
//        return null;
//    }
    
    /**
     * get filed getter
     * @param clazz
     * @param fildsName
     * @return
     */
    public Method findGetter( Class<T> clazz, String fildsName ) {
		Method method= null;
	    try{
		  method = clazz.getMethod( "get"+fildsName );
		} catch( Exception e) {
		  
		}
        return method;
    }
    
    
    @Resource(name="sessionFactory")
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);  
    }
    
    /**
     * 通过反射,获得定义Class时声明的父类的范型参数的类型. 如public BookManager extends GenricManager<Book>
     *
     * @param clazz clazz The class to introspect
     * @param index the Index of the generic declaration,start from 0.
     * @return the index generic declaration, or <code>Object.class</code> if cannot be determined
     */
    @SuppressWarnings("rawtypes")
    public static Class getSuperClassGenricType(Class clazz, int index) {

        Type genType = clazz.getGenericSuperclass();    //获取clazz的直接超类
        /*判断是否继承自此类*/
        if (!(genType instanceof ParameterizedType)) {
            //log.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        /*判断传的参数：index 是否合法*/
        if (index >= params.length || index < 0) {
            //log.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
//                    + params.length);
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
