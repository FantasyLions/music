package com.migu.service.Imp;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.migu.dao.SingerDao;
import com.migu.dto.Singer;
import com.migu.service.SingerService;

@Service("singerService")
public class SingerServiceImp implements SingerService{

    @Resource(name="singerDao")
    private SingerDao singerDao;
    
    public void setSingerDao(SingerDao singerDao) {
        this.singerDao = singerDao;
    }
    
    @Override
    public void saveObject(Singer singer) {
        singerDao.insertSinger(singer);
    }
    
}
