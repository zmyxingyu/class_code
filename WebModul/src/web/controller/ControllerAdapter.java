package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerAdapter implements Controller {

	private Controller controller;
	private String url;

	public ControllerAdapter(Controller controller, String url) {
		super();
		this.controller = controller;
		this.url = url;
	}

	public String getUrl() {
		return this.url;
	}

	public Controller getController() {
		return this.controller;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, String path) {
		return this.controller.execute(request, response, path);
	}
}
