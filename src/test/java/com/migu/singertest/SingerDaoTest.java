package com.migu.singertest;

import java.util.HashSet;
import java.util.Set;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.migu.dto.Singer;
import com.migu.dto.Song;
import com.migu.service.SingerService;

public class SingerDaoTest {
    
    private ApplicationContext ctx;

    @Test
    public void test1() {
        //Class<SingerDaoImp> clazz = SingerDaoImp.class;
        Class<SingerService> clazz = SingerService.class;
        ctx = new ClassPathXmlApplicationContext( "applicationContext.xml" );
        String className = clazz.getSimpleName();
        String clazzName = className.substring( 0, 1 ).toLowerCase() + className.substring( 1 );
        SingerService sd = (SingerService) ctx.getBean(clazzName);
        
        Song song = new Song();
        song.setWriter("petar_shi");
        
        Singer singer = new Singer();
        singer.setHeight(178);
        singer.setName("zl.shi");
        singer.setWeight(60);
        Set<Song> set = new HashSet<Song>();
        set.add( song );
        singer.setSongs(set);
        sd.saveObject(singer);
    }

}
