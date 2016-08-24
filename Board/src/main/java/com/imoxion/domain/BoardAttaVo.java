package com.imoxion.domain;

import java.io.Serializable;
import java.util.Date;

public class BoardAttaVo implements Serializable{
	private String atta_id;
	private int b_num;
	private String atta_name;
	private long atta_size;
	private String atta_path;
	private Date atta_date;
	public String getAtta_id() {
		return atta_id;
	}
	public void setAtta_id(String atta_id) {
		this.atta_id = atta_id;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getAtta_name() {
		return atta_name;
	}
	public void setAtta_name(String atta_name) {
		this.atta_name = atta_name;
	}


	public long getAtta_size() {
		return atta_size;
	}
	public void setAtta_size(long atta_size) {
		this.atta_size = atta_size;
	}
	public String getAtta_path() {
		return atta_path;
	}
	public void setAtta_path(String atta_path) {
		this.atta_path = atta_path;
	}
	public Date getAtta_date() {
		return atta_date;
	}
	public void setAtta_date(Date atta_date) {
		this.atta_date = atta_date;
	}
	@Override
	public String toString() {
		return "boardAttaVo [atta_id=" + atta_id + ", b_num=" + b_num + ", atta_name=" + atta_name + ", atta_size="
				+ atta_size + ", atta_path=" + atta_path + ", atta_date=" + atta_date + "]";
	}
	
	
	
	
}
