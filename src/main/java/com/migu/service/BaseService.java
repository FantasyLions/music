package com.migu.service;

import java.io.Serializable;
import java.util.List;

import com.migu.dto.Singer;

public interface BaseService<T> {

    public void saveObject( T t );
    
    public T getObject( Serializable id );
    
    public void updateObject( T t );
    
    public void removeObject( Serializable id );
    
    public List<T> pageObject(T t, Integer pageIndex, Integer pageSize);
}
