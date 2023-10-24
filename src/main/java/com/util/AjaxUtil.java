package com.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AjaxUtil {
	//输出响应到客户端
    public static void printString(HttpServletResponse response,String str){
    	response.setCharacterEncoding("UTF-8");
    	try {
			PrintWriter out=response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
