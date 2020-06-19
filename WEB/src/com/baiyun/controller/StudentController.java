package com.baiyun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baiyun.dao.StudentDao;
import com.baiyun.model.Student;

import ioc.annotation.Bean;
import ioc.annotation.Inject;
import lang.StringUtils;
import web.annotation.Handler;
import web.controller.Controller;

@Bean(id = "student")
@Handler(name = "student", url = "/student")
public class StudentController implements Controller {

	@Inject(ref = "studentDao")
	StudentDao dao;

	public StudentDao getDao() {
		return dao;
	}

	public void setDao(StudentDao dao) {
		this.dao = dao;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, String path) {
		// path = '' /add /delete
		String action = path;
		System.out.println("action--" + action);
		try {
			if (StringUtils.isEmpty(action)) {
				return listStudent(request, response);
			} else {
				if (action.startsWith("/add")) {
					String id = request.getParameter("no");
					if (StringUtils.isEmpty(id)) {
						return "/WEB-INF/jsp/add.jsp";
					} else {
						return addStudent(request, response);
					}
				} else if (action.startsWith("/delete")) {
					return delete(request, response);
				} else if (action.startsWith("/query")) {
					return query(request, response);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String listStudent(HttpServletRequest request, HttpServletResponse response) {
		List<Student> l = dao.queryStudents("select * from tb_s");
		request.setAttribute("students", l);
		return "/WEB-INF/jsp/index.jsp";
	}

	private String addStudent(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("no");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String sex = request.getParameter("sex");
		int totalCridit = Integer.valueOf(request.getParameter("totalCridit"));

		Student s = new Student();
		s.setId(id);
		s.setName(name);
		s.setDept(dept);
		s.setSex(sex);
		s.setTotalCredit(totalCridit);
		System.out.println(s.toString());
		int flag = dao.add(s);
		if (flag > 0) {
			System.out.println("添加成功");
			return "/student";
		} else {
			request.setAttribute("err", "添加学生失败！");
			return "/WEB-INF/jsp/err.jsp";
		}
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("no");
		System.out.println("删除：" + id);
		int flag = dao.delStudent(id);
		if (flag > 0) {
			return "/student";
		} else {
			request.setAttribute("err", "删除失败！");
			return "/WEB-INF/jsp/err.jsp";
		}
	}

	public String query(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		System.out.println("name:" + name);
		List<Student> list = null;
		if (name != null && name.length() > 0) {
			list = dao.queryStudents("select * from tb_s where sname like '%" + name + "%'");
		}
		if (list != null) {
			request.setAttribute("students", list);
		}
		return "/WEB-INF/jsp/index.jsp";
	}

}
