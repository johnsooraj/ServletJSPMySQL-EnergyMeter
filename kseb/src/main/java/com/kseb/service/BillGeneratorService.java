package com.kseb.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BillGeneratorService {

	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse);

}
