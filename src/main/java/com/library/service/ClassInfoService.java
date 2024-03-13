package com.library.service;

import com.library.po.ClassInfo;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ClassInfoService {
    /**
     * 查询所有记录
     */
    public PageInfo<ClassInfo> queryClassInfoAll(String name,int page,int limit);

    /**
     * 添加图书类型
     */
    void addTypeSubmit(ClassInfo info);
    /**
     * 修改
     */
    ClassInfo queryClassInfoById(Integer id);
    /**
     * 修改提交
     */
    void updateTypeSubmit(ClassInfo info);
    /**
     * 根据ids删除记录信息
     */
    void deleteTypeByIds(List<String> id);

}
