package com.imoxion.domain;

import java.io.Serializable;
import java.util.Date;

public class ReplyVO implements Serializable {

	
	private int r_num;
	private int b_num;
	private int r_level;
	private String r_text;
	private Date r_date;
	private int r_group;
	private int r_step;
	
	
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getR_level() {
		return r_level;
	}
	public void setR_level(int r_level) {
		this.r_level = r_level;
	}
	public String getR_text() {
		return r_text;
	}
	public void setR_text(String r_text) {
		this.r_text = r_text;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_group() {
		return r_group;
	}
	public void setR_group(int r_group) {
		this.r_group = r_group;
	}
	public int getR_step() {
		return r_step;
	}
	public void setR_step(int r_step) {
		this.r_step = r_step;
	}
	@Override
	public String toString() {
		return "ReplyVO [r_num=" + r_num + ", b_num=" + b_num + ", r_level=" + r_level + ", r_text=" + r_text
				+ ", r_date=" + r_date + ", r_group=" + r_group + ", r_step=" + r_step + "]";
	}
	
	
	
	
	
	
	
	
	
}
