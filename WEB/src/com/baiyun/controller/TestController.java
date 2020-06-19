package com.baiyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ioc.annotation.Bean;
import web.annotation.Handler;
import web.controller.Controller;

@Bean(id="test")
@Handler(name="test",url="/test")
public class TestController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, String path) {
		
		return "hello";
	}

}
