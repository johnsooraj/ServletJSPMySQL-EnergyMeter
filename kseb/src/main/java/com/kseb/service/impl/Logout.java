package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kseb.service.BillGeneratorService;

public class Logout implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		HttpSession session = httpServletRequest.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "index.jsp";
	}

}
