package ioc.loader;

import java.util.Map;

import ioc.info.BeanInfo;

public interface Loader {
	public void load(String param, Map<String, BeanInfo> beans);
}