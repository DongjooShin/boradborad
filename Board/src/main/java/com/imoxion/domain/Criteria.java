package com.imoxion.domain;

public class Criteria {
	private int totalRow; // 총 게시글 수
	private int rowPerPage; // 페이지당 개수
	private int totalPage; // 전체 체이지수
	private int startRow; // 시작 글번호
	private int endRow; // 마지막 글 번호
	private int cpage; // 현제 페이지
	private int blockNum = 5;
	private int startBlock;
	private int endBlock;
	private int nextIcon;
	private int preIcon;

	public void calPaging() {
		this.totalPage = (totalRow / rowPerPage) + ((totalRow % rowPerPage) == 0 ? 0 : 1);
		this.startRow = (cpage - 1) * rowPerPage;
		this.endRow = rowPerPage;
		
		this.startBlock =((cpage%blockNum) == 0 ? 5*(cpage/blockNum)-blockNum+1 : 5*(cpage/blockNum)+1 );
		this.endBlock = ((startBlock+blockNum-1) < totalPage ? (startBlock+blockNum-1) : totalPage);
		
		this.nextIcon = ((endBlock <totalPage) ? 0 : 1);
		this.preIcon =  ((startBlock - 1) != 0? 0 :1);
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getBlockNum() {
		return blockNum;
	}

	public void setBlockNum(int blockNum) {
		this.blockNum = blockNum;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getNextIcon() {
		return nextIcon;
	}

	public void setNextIcon(int nextIcon) {
		this.nextIcon = nextIcon;
	}

	public int getPreIcon() {
		return preIcon;
	}

	public void setPreIcon(int preIcon) {
		this.preIcon = preIcon;
	}
 
	

	
}
