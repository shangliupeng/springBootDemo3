package com.jt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jt.mapper.UserMapper;
import com.jt.pojo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	
	/**
	 * 查询user表的记录
	 * 1.url地址: localhost:8090/findAll
	 * 2.参数: 无
	 * 3.返回值结果: 页面逻辑名称
	 * 
	 * jsp中页面取值信息 : ${userList}  同步查询
	 * 
	 * 2.作业2.利用ajax形式动态展现页面数据.
	 * 
	 * 说明: 
	 * 		1. @Controller  + 返回值 String  表示跳转页面   
	 * 					必然经过视图解析器  拼接前缀和后缀
	 * 		
	 *      2. @RestController +任意返回值   直接返回JSON数据,不经过视图解析器.
	 *         或者  
	 *         @Controller +@ ResponseBody 
	 */
	
	@RequestMapping("/findAll")
	public String  findAll(Model model) {
		List<User>  userList = userMapper.selectList(null);
		model.addAttribute("userList", userList);
		return "userList"; //jsp html js 
		//  /WEB-INF/userList.jsp  拼接页面真实路径
	}
	
	/**
	 * 实现页面跳转
	 */
	@RequestMapping("/ajax")
	public String ajax() {
		
		return "ajax";
	}
	
	//利用ajax形式获取数据
	@RequestMapping("/findAjax")
	@ResponseBody	//将返回值结果转化为JSON
	public List<User> findAjax(){
		
		return userMapper.selectList(null);
	}
	
	
	
	
	
}
