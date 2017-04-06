package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kseb.service.BillGeneratorService;

public class AddTransformer implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		return "addtransformer.jsp";
	}

}
