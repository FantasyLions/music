package com.migu.service;

import java.io.Serializable;
import java.util.List;

import com.migu.dto.Singer;

public interface BaseService {

    public void saveObject( Singer singer );
    
    public Singer getSinger( Serializable id );
    
    public void updateSinger( Singer singer );
    
    public void removeSinger( Serializable id );
    
    public List<Singer> pageSinger(Singer singer, Integer pageIndex, Integer pageSize);
}
