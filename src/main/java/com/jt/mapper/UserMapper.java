package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jt.pojo.User;
//@Mapper	//将接口交给Spring容器管理,并且为其创建代理对象
public interface UserMapper extends BaseMapper<User>{
	
	//1.查询所有的用户表记录
	@Select("select id,name,age,sex from user")
	List<User> findAll();
	
	
	
	
	
	
	
	
	
}
