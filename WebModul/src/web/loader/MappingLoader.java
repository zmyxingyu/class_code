package web.loader;

import java.util.List;

import web.info.Mapping;

/**
 * 加载url映射信息
 * 
 * @author xwz
 */
public interface MappingLoader {
	public void load(String param, List<Mapping> handlers);
}
