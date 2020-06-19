package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ioc.annotation.Bean;
import web.annotation.Handler;

@Bean(id="test")
@Handler(name="test",url="/test")
public class NotMappingController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, String path) {
		
		return "can not find controller to excute";
	}

}
