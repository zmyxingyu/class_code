package test;

import ioc.annotation.Bean;
import ioc.annotation.Inject;

@Bean(id = "post2")
public class Post {
	@Inject(val = "hello")
	String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	
}
