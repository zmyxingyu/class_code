package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ioc.BeanFactory;
import web.HandleMapping;
import web.controller.Controller;
import web.controller.ControllerAdapter;
import web.info.Mapping;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String contextConfigLocation = "applicationContext.xml";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DispatcherServlet() {
		super();
	}

	@Override
	public void init() throws ServletException {
		super.init();
		contextConfigLocation = getServletConfig().getInitParameter("contextConfigLocation");
		BeanFactory.loadXMLFile(contextConfigLocation);

		String apk = (String) getServletContext().getInitParameter("handlePackage");
		System.out.println(apk);
		BeanFactory.loadPackage(apk);
		HandleMapping.getInstance().init(apk, null);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String app = request.getContextPath();
		getServletContext().setAttribute("APP", app);
		System.out.println("请求路径：" + request.getRequestURI());
		String action = request.getRequestURI().substring(app.length());
		System.out.println("action:" + action);
		// /LStudentMVC/user/login
		ControllerAdapter cont = null;
		cont = (ControllerAdapter) HandleMapping.getInstance().handMapping(action);

		String view = "";
		try {
			view = cont.execute(request, response, action.substring(cont.getUrl().length()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (view.endsWith(".jsp") || view.startsWith("/")) {
			request.getRequestDispatcher(view).forward(request, response);
		} else {
			response.getWriter().append(view).flush();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
