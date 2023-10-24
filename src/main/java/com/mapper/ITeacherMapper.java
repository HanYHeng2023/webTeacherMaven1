package com.mapper;

import com.po.PageBean;
import com.po.Teacher;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author：韩宜恒
 * @Date：2023/10/23 15:51
 * @Project：webTeacherMaven
 * @Package：com.mapper
 * @name：ITeacherMapper
 */
@Service("ITeacherMapper")
public interface ITeacherMapper {
    public List<Teacher> findPageAll(PageBean pb);
    public int maxRows();
}
