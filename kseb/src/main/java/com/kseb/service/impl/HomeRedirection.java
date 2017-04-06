package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kseb.service.BillGeneratorService;

public class HomeRedirection implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		if (httpServletRequest.getParameter("hidden").equals("adminhome")) {
			return "adminhome.jsp";
		} else if (httpServletRequest.getParameter("hidden").equals("indexpage")) {
			return "index.jsp";
		} else {
			return "userhome.jsp";
		}
	}

}
