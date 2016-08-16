package com.imoxion.domain;

import java.io.Serializable;
import java.util.Date;

public class BoardVO implements Serializable {

	private int b_num;
	private String m_id;
	private String b_title;
	private String b_content;
	private int b_count;
	private Date b_date;
	private int b_group;
	private int b_step;
	private int b_depth;
	private int b_flag;
	
	
	public int getB_group() {
		return b_group;
	}
	public void setB_group(int b_group) {
		this.b_group = b_group;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	
	
	public int getB_flag() {
		return b_flag;
	}
	public void setB_flag(int b_flag) {
		this.b_flag = b_flag;
	}
	@Override
	public String toString() {
		return "BoardVO [b_num=" + b_num + ", m_id=" + m_id + ", b_title=" + b_title + ", b_content=" + b_content
				+ ", b_count=" + b_count + ", b_date=" + b_date + ", b_group=" + b_group + ", b_step=" + b_step
				+ ", b_depth=" + b_depth + ", b_flag=" + b_flag + "]";
	}

	
	
}
