package com.service;

import com.po.PageBean;
import com.po.Teacher;

import java.util.List;

/**
 * @Author：韩宜恒
 * @Date：2023/10/23 16:00
 * @Project：webTeacherMaven
 * @Package：com.service
 * @name：TeacherService
 */
public interface ITeacherService {
    public List<Teacher> findPageAll(PageBean pb);
    public int maxRows();
}
