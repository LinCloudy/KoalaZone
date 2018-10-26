package com.lin.util;

import org.junit.Test;

public class TextUtilTest {
	TextUtil text1=new TextUtil();
	@Test
	public void testHtmltoText() {
		System.out.println(text1.HtmltoText("<p>&nbsp;&nbsp;&nbsp;&nbsp;鄱阳湖里的几根子草，成了南昌人桌子上的宝</p><p>&nbsp;&nbsp;&nbsp;&nbsp;鄱阳湖里的几根子草，成了抚州人桌子上的宝</p><p>&nbsp;&nbsp;&nbsp;&nbsp;鄱阳湖里的几根子草，成了临川人桌子上的宝</p>"));
	}

}
