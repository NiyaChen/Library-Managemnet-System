package com.library.dao;
import com.library.po.ClassInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import java.util.List;
import org.apache.ibatis.annotations.Select;
@Component("classDao")
public interface ClassInfoDao {
    /**
     * 查询所有的图书类型信息
     */
//    @Select("select * from class_info")
//    List<ClassInfo> queryClassInfoAll();
    List<ClassInfo> queryClassInfoAll(@Param(value="name")String name);
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
    void deleteTypeByIds(List<Integer> id);

}

