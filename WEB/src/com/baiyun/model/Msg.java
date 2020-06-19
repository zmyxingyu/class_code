package com.baiyun.model;

public class Msg {

	public static final int SUCCESS = 1;
	public static final int ERR = 0;

	private int status = ERR;// 0失败，1成功
	private String msg;
	private Object data;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
