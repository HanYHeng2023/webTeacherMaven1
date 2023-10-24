package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.po.PageBean;
import com.po.Teacher;
import com.service.ITeacherService;
import com.util.AjaxUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Author：韩宜恒
 * @Date：2023/10/23 16:43
 * @Project：webTeacherMaven
 * @Package：com.controller
 * @name：teacherController
 */
@Controller
public class teacherController {
    @Resource(name="TeacherServiceImpl")
    private ITeacherService service;

    public ITeacherService getService() {
        return service;
    }

    public void setService(ITeacherService service) {
        this.service = service;
    }

    @RequestMapping(value="findPageAll.do")
    public String findPageAll(HttpServletRequest request, HttpServletResponse response,Integer page, Integer rows) {
        PageBean pb=new PageBean();
        //判断前端是否传值
        page=page==null||page<1?pb.getPage():page;
        rows=rows==null||rows<1?pb.getRows():rows;

        if(rows>20)rows=10;
        pb.setPage(page);
        pb.setRows(rows);
        List<Teacher> teList=service.findPageAll(pb);
        int maxPage=1;
        int maxRows=service.maxRows();
        if(maxRows>0){
            maxPage=maxRows%rows==0?maxRows/rows:maxRows/rows+1;
        }
        pb.setMaxPage(maxPage);
        pb.setPageList(teList);

        String jsonstr= JSONObject.toJSONString(pb);
        AjaxUtil.printString(response,jsonstr);

        return null;
    }
}
