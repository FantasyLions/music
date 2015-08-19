package com.migu.singertest;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.migu.dto.Singer;
import com.migu.dto.Song;
import com.migu.service.BaseService;
import com.migu.service.SingerService;
import com.migu.utils.dao.HibernateDao;

public class SingerDaoTest {
    
    private ApplicationContext ctx;

//    @Test
    public void test1() {
        //Class<SingerDaoImp> clazz = SingerDaoImp.class;
        Class<BaseService> clazz = BaseService.class;
        ctx = new ClassPathXmlApplicationContext( "applicationContext.xml" );
        String className = clazz.getSimpleName();
        String clazzName = className.substring( 0, 1 ).toLowerCase() + className.substring( 1 );
        BaseService sd = (BaseService) ctx.getBean(clazzName);
        
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
    
//    @Test
    public void test2() {
        Singer singer = new Singer();
        singer.setBirthday("asdf");
        singer.setBirthplace("asdfwer");
        singer.setGender("asdf");
        singer.setName("sdf");
//        listObjects(singer);
//        Field[] filds = singer.getClass().getDeclaredFields();
//        for (Field fild : filds) {
//            System.out.println("filds:"+fild.getName());
//        }
    }
    
//    @Test
    public void test3() {
        Singer singer = new Singer();
        singer.setBirthday("asdf");
        singer.setBirthplace("asdfwer");
        singer.setGender("asdf");
        singer.setName("sdf");
        singer.getAlbumses();
        HibernateDao<Singer> h = new HibernateDao<Singer>();
        List<Object> values = new ArrayList<Object>();
        String hql = h.getHqlFindStr("Singer", singer, values);
        System.out.println("hql="+hql);
        
        for (Object o : values ) {
            System.out.println(o);
        }
    }
    
//    @Test
    public void testDml() {
        Class<BaseService> clazz = BaseService.class;
        ctx = new ClassPathXmlApplicationContext( "applicationContext.xml" );
        String className = clazz.getSimpleName();
        String clazzName = className.substring( 0, 1 ).toLowerCase() + className.substring( 1 );
        BaseService sd = (BaseService) ctx.getBean(clazzName);
        
        Singer singer = new Singer();
        singer.setBirthday("asdf");
        singer.setBirthplace("asdfwer");
        singer.setGender("asdf");
        singer.setName("sdf");
        
        sd.saveObject(singer);
        sd.saveObject(singer);
        sd.saveObject(singer);
        sd.saveObject(singer);
        sd.saveObject(singer);
        
        singer.setBirthday("地球");
        singer.setSingerid(20);
        sd.updateSinger(singer);
        
        sd.removeSinger(19);
        
       
    }
    
    @Test
    public void test() {
        ctx = new ClassPathXmlApplicationContext( "applicationContext.xml" );
        BaseService sd = (BaseService)ctx.getBean("singerService");
        Singer singer = new Singer();
        singer.setBirthday("asdf");
        singer.setBirthplace("asdfwer");
        singer.setGender("asdf");
        singer.setName("sdf");
        List<Singer> singers = sd.pageSinger( singer, 1, 3 );
        System.out.println( singers );
    }

}
