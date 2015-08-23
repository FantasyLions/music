package com.migu.control;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.migu.service.BaseService;

@Scope("prototype")
@Controller
@RequestMapping
public class IndexController {
    @Resource(name="singerService")
    private BaseService singerService;

    public void setSingerService(BaseService singerService) {
        this.singerService = singerService;
    }
    
    
    @RequestMapping("/toIndex")
    public String welcomePage() {
        System.out.println("do it!");
        return "index";
    }
    
    
}
