package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kseb.model.ElectricityBill;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;

public class PrintBill implements BillGeneratorService {

	@SuppressWarnings("unchecked")
	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		List<ElectricityBill> bill = (List<ElectricityBill>) httpServletRequest.getSession()
				.getAttribute("billDetails");
		LoginCredentials credentials = (LoginCredentials) httpServletRequest.getSession().getAttribute("userdetails");
		httpServletRequest.getSession().setAttribute("userdetails", credentials);
		httpServletRequest.getSession().setAttribute("billDetails", bill);

		return "invoice-print.jsp";
	}

}
