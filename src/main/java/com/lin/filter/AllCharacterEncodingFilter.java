package com.lin.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

//乱码处理方法
@WebFilter("/*")
public class AllCharacterEncodingFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		// post乱码处理
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		MyHttpServletRequest request2 = new MyHttpServletRequest(req);
		chain.doFilter(request2, response);
	}

	@Override
	public void destroy() {
	}

}

class MyHttpServletRequest extends HttpServletRequestWrapper {
	private HttpServletRequest req;

	MyHttpServletRequest(HttpServletRequest req) {
		super(req);
		this.req = req;
	}

	@Override
	public String getParameter(String name) {// name:参数的别名
		// 获得参数的值：
		String value = req.getParameter(name);
		// System.out.println("getParameter: " + name + ":" + value);
		if (value == null) {// 判断参数值为空，不进行编码处理
			return null;
		}
		String method = req.getMethod();// 获得请求方式
		// System.out.println(method);

		if ("GET".equals(method)) {
			try {
				value = new String(value.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return value;
	}
}
