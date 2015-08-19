package com.migu.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.migu.dao.SingerDao;
import com.migu.dto.Singer;

@Service("singerService")
public class SingerService implements BaseService{

    @Resource(name="singerDao")
    private SingerDao singerDao;
    
    public void setSingerDao(SingerDao singerDao) {
        this.singerDao = singerDao;
    }
    
    @Override
    public void saveObject(Singer singer) {
        singerDao.saveObject(singer);
    }

    @Override
    public Singer getSinger(Serializable id) {
        return singerDao.getObject(id);
    }

    @Override
    public void updateSinger(Singer singer) {
        singerDao.updateObject(singer);
    }

    @Override
    public void removeSinger(Serializable id) {
        singerDao.removeObject(id);
    }

    @Override
    public List<Singer> pageSinger(Singer singer, Integer pageIndex, Integer pageSize) {
        return singerDao.pageObject( singer, pageIndex, pageSize);
    }
    
}
