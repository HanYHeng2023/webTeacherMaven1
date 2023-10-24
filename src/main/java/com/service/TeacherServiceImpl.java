package com.service;

import com.mapper.ITeacherMapper;
import com.po.PageBean;
import com.po.Teacher;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author：韩宜恒
 * @Date：2023/10/23 16:01
 * @Project：webTeacherMaven
 * @Package：com.service
 * @name：TeacherServiceImpl
 */
@Service("TeacherServiceImpl")
public class TeacherServiceImpl implements ITeacherService {
    @Resource(name="ITeacherMapper")
     private ITeacherMapper mapper;

    public ITeacherMapper getMapper() {
        return mapper;
    }

    public void setMapper(ITeacherMapper mapper) {
        this.mapper = mapper;
    }

    public List<Teacher> findPageAll(PageBean pb) {
        return mapper.findPageAll(pb);
    }

    @Override
    public int maxRows() {
        return mapper.maxRows();
    }
}
