package web;

import java.util.ArrayList;
import java.util.List;

import ioc.BeanFactory;
import lang.StringUtils;
import web.controller.Controller;
import web.controller.ControllerAdapter;
import web.controller.NotMappingController;
import web.info.Mapping;
import web.loader.AnnotationMappingLoader;
import web.loader.MappingLoader;
import web.loader.XMLMappingLoader;

public class HandleMapping {

	private String handlePackage;
	private String handleXml;

	public static final String SPLIT = ",";
	/** url映射信息 */
	private List<Mapping> mappings;

	private HandleMapping() {

	}

	public void init(String handlePackage, String handleXml) {
		this.handlePackage = handlePackage;
		this.handleXml = handleXml;

		mappings = new ArrayList<Mapping>();
		if (StringUtils.isNotEmpty(handleXml)) {
			MappingLoader lodader = new XMLMappingLoader();
			for (String fileName : handleXml.split(SPLIT)) {
				lodader.load(fileName.trim(), mappings);
			}
		}
		if (StringUtils.isNotEmpty(handlePackage)) {
			MappingLoader lodader = new AnnotationMappingLoader();
			for (String rootPackageName : handlePackage.split(SPLIT)) {
				lodader.load(rootPackageName.trim(), mappings);
			}
		}
	}

	public static final HandleMapping instance = new HandleMapping();

	public static HandleMapping getInstance() {
		return instance;
	}

	public Controller handMapping(String path) {
		String url = "";
		Controller controller;
		if (!StringUtils.isEmpty(path) && path.startsWith("/") && path.length() > 1) {
			String[] actions = path.split("/");
			if (!StringUtils.isEmpty(actions[1])) {
				url = "/" + actions[1];
				Mapping mapping = null;
				for (Mapping m : mappings) {
					boolean b = m.getUrlPattern().matcher(url).find();
					if (b) {
						mapping = m;
						break;
					}
				}
				if (mapping != null) {
					controller = (Controller) BeanFactory.get(mapping.getName());
					if (controller == null) {
						System.out.println("检测id与name是否一致");
						controller = new ControllerAdapter(new NotMappingController(), url);
					} else {
						System.out.println("获取" + url + "路径的controller成功：");
						Controller c = new ControllerAdapter(controller, url);
						controller = c;
					}

					return controller;
				}
			}
		}

		return new ControllerAdapter(new NotMappingController(), "");
	}
}
