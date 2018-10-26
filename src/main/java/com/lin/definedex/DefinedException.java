package com.lin.definedex;

@SuppressWarnings("serial")
public class DefinedException extends RuntimeException{
	private String exceptionMsg;

	public DefinedException(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

	public String getExceptionMsg() {
		return exceptionMsg;
	}

	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

}
