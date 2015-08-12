package com.migu.dao;

import com.migu.dto.Singer;

public interface SingerDao {
    
    public abstract void insertSinger( Object singer );
    
    public abstract boolean delSinger( Singer singer);
    
    public abstract boolean getSinger( int singerId );
}
