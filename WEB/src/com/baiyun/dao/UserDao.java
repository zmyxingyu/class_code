package com.baiyun.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baiyun.model.Msg;
import com.baiyun.model.Student;
import com.baiyun.model.User;
import com.baiyun.tools.ConnDB;

import ioc.annotation.Bean;

@Bean(id="userDao")
public class UserDao {

	private ConnDB connDB;

	public UserDao() {
		connDB = new ConnDB();
	}

	public int addUser(User user) {
		return 0;
	}

	public Msg login(User user) {
		Msg flag = new Msg();

		if (user != null) {
			StringBuffer sb = new StringBuffer("SELECT * FROM tb_user where name='");
			sb.append(user.getName()).append("' and password='").append(user.getPassword()).append("'");
			System.out.println(sb);
			ResultSet re = connDB.executeQuery(sb.toString());
			try {
				if (re.next()) {
					flag.setStatus(Msg.SUCCESS);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				flag.setMsg("login err:" + e.getMessage());
			} finally {
				connDB.close();
			}

		}
		return flag;
	}

	public Msg regist(User user) {
		Msg msg = null;
		String sqlP = "SELECT * FROM tb_user where name = '%s'";
		msg = checkUser(String.format(sqlP, user.getName()));
		if (msg.getStatus() == 1) {
			sqlP = "insert into tb_user values('%s','%s','dba')";
			return save(String.format(sqlP, user.getName(), user.getPassword()));
		} else {
			return msg;
		}
	}

	/**
	 * 功能：保存用户注册信息
	 * 
	 * @param sql
	 * @return
	 */
	public Msg save(String sql) {
		Msg msg = new Msg();
		int rtn = connDB.executeUpdate(sql); // 执行更新语句
		if (rtn > 0) {
			msg.setStatus(Msg.SUCCESS);
			msg.setMsg("用户注册成功！");
		} else {
			msg.setStatus(Msg.ERR);
			msg.setMsg("保存用户信息异常，用户注册失败！");
		}
		connDB.close(); // 关闭数据库的连接
		return msg; // 返回执行结果
	}

	public Msg checkUser(String sql) {
		Msg msg = new Msg();
		ResultSet re = connDB.executeQuery(sql);
		try {
			if (re.next()) {
				msg.setStatus(Msg.ERR);
				msg.setMsg("用户已经存在");
				return msg;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connDB.close();
		}
		msg.setStatus(Msg.SUCCESS);
		return msg;
	}

}
