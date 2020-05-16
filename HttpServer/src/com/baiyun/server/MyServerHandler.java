package com.baiyun.server;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baiyun.dao.StudentDao;
import com.baiyun.model.Student;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

public class MyServerHandler implements HttpHandler {

	@Override
	public void handle(HttpExchange he) throws IOException {

		URI uri = he.getRequestURI();

		System.out.println(uri.getQuery());

		Map parms = getParms(uri.getQuery());
		System.out.println(parms.get("no"));

		System.out.println(parms.get("name"));

		StringBuffer response = new StringBuffer();
		response.append("<!DOCTYPE html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n"
				+ "</head>");
		response.append("    <table border=\"1\" style=\" margin: 0 auto;border-collapse: collapse;width: 40%;text-align: center;\">\r\n"
				+ "        <tr>\r\n"
				+ "            <th>学号</th>\r\n"
				+ "            <th>姓名</th>\r\n" + "        </tr>");

		response.append(queryStudentById(parms.get("no").toString()));

		response.append("</table>");

		he.sendResponseHeaders(200, 0);
		Headers headers = he.getResponseHeaders();
		headers.set("Content-Type", "text/html;charset=UTF-8");
		OutputStream os = he.getResponseBody();
		os.write(response.toString().getBytes());
		os.flush();
		os.close();

	}

	private String queryStudentById(String id) {
		StringBuffer sb = new StringBuffer();
		StudentDao sDao = new StudentDao();
		List<Student> list = sDao.queryStudents("select * from tb_s where sno="
				+ id);
		for (Student stu : list) {
			sb.append(" <tr>");
			sb.append("<td>").append(stu.getId()).append("</td>");
			sb.append("<td>").append(stu.getName()).append("</td>");
			sb.append("</tr>");
		}

		return sb.toString();
	}

	private String getStudents() {
		StringBuffer sb = new StringBuffer();
		StudentDao sDao = new StudentDao();
		List<Student> list = sDao.queryStudents("select * from tb_s");
		for (Student stu : list) {
			sb.append(" <tr>");
			sb.append("<td>").append(stu.getId()).append("</td>");
			sb.append("<td>").append(stu.getName()).append("</td>");
			sb.append("</tr>");
		}

		return sb.toString();
	}

	private Map getParms(String str) {
		Map map = new HashMap<>();
		if (str != null && str.length() > 2) {
			String[] args = str.split("&");
			for (String p : args) {
				getParms(map, p);
			}
		}
		return map;
	}

	private void getParms(Map map, String str) {
		if (str != null && str.length() > 2) {
			String[] args = str.split("=");
			map.put(args[0], args[1]);
		}
	}

}
