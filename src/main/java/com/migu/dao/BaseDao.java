package com.migu.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
    
    public T saveObject( T t );

    public void removeObject( Serializable id );
    
    public void updateObject( T t );
    
    public T getObject( Serializable id );
    
    public List<T> listObjects( T t );
    
    public List<T> pageObject( T t, Integer pageIndex, Integer pageSize );
}
