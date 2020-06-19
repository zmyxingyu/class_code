package test;

import ioc.BeanFactory;

public class Main {

	public static void main(String[] args) {
		BeanFactory.loadPackage("test");
		TestBean tb = (TestBean) BeanFactory.get("MyTestBean");
		System.out.println(tb.getPost().getStr());
	}

}
