package com.lin.util;

import java.io.Serializable;

/**
 * 分页
 */
public class PageUtil implements Serializable {
	/*
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long pageNow = 1; // 当前页数
	private long pageSize = 4; // 每页显示记录的条数
	private long totalCount; // 总的记录条数
	private long totalPageCount; // 总的页数
	@SuppressWarnings("unused")
	private long startPos; // 开始位置，从0开始
	@SuppressWarnings("unused")
	private boolean hasFirst;// 是否有首页
	@SuppressWarnings("unused")
	private boolean hasPre;// 是否有前一页
	@SuppressWarnings("unused")
	private boolean hasNext;// 是否有下一页
	@SuppressWarnings("unused")
	private boolean hasLast;// 是否有最后一页

	// 通过构造函数传入总记录数和当前页
	public PageUtil(long totalCount, long pageNow) {
		this.totalCount = totalCount;
		this.pageNow = pageNow;
	}

	// 取得总页数，总页数=总记录数/总页数
	public long getTotalPageCount() {
		totalPageCount = getTotalCount() / getPageSize();
		return (totalCount % pageSize == 0) ? totalPageCount : totalPageCount + 1;
	}

	public void setTotalPageCount(long totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public long getPageNow() {
		return pageNow;
	}

	public void setPageNow(long pageNow) {
		this.pageNow = pageNow;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	// 取得选择记录的初始位置
	public long getStartPos() {
		return (pageNow - 1) * pageSize;
	}

	public void setStartPos(long startPos) {
		this.startPos = startPos;
	}

	// 是否是第一页
	public boolean isHasFirst() {
		return (pageNow == 1) ? false : true;
	}

	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	// 是否有首页
	public boolean isHasPre() {
		// 如果有首页就有前一页，因为有首页就不是第一页
		return isHasFirst() ? true : false;
	}

	public void setHasPre(boolean hasPre) {

		this.hasPre = hasPre;

	}

	// 是否有下一页
	public boolean isHasNext() {
		// 如果有尾页就有下一页，因为有尾页表明不是最后一页
		return isHasLast() ? true : false;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	// 是否有尾页
	public boolean isHasLast() {
		// 如果不是最后一页就有尾页
		return (pageNow == getTotalCount()) ? false : true;
	}

	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}

}
