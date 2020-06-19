package web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class APPContextListener
 *
 */
@WebListener
public class APPContextListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public APPContextListener() {
		// TODO Auto-generated constructor stub
		System.out.println("APP new");
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		sce.getServletContext().setAttribute("APP", sce.getServletContext().getContextPath());
	}

}
