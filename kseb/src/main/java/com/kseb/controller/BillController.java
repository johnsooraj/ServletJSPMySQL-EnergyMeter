package com.kseb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kseb.service.BillGeneratorService;
import com.kseb.service.impl.AddTransformer;
import com.kseb.service.impl.BillPayment;
import com.kseb.service.impl.BulbControl;
import com.kseb.service.impl.ContinuesMeterReading;
import com.kseb.service.impl.GetBulbStatus;
import com.kseb.service.impl.GetHomeControlPage;
import com.kseb.service.impl.HomeRedirection;
import com.kseb.service.impl.LoginUser;
import com.kseb.service.impl.Logout;
import com.kseb.service.impl.PrintBill;
import com.kseb.service.impl.RegisterCustomer;
import com.kseb.service.impl.RegisterPageView;
import com.kseb.service.impl.TransformarRegistration;
import com.kseb.service.impl.UserExistenceChecker;
import com.kseb.service.impl.ViewConsumers;
import com.kseb.service.impl.ViewCurrentBill;
import com.kseb.service.impl.ViewPreviousBills;
import com.kseb.service.impl.ViewTransformers;

public class BillController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Map<String, Object> tasks = new HashMap<String, Object>();

	public BillController() {
		super();
		tasks.put("paybill", new BillPayment());
		tasks.put("logout", new Logout());
		tasks.put("indexpage", new HomeRedirection());
		tasks.put("loginuser", new LoginUser());
		tasks.put("home", new HomeRedirection());
		tasks.put("adminhome", new HomeRedirection());
		tasks.put("viewcurrentbill", new ViewCurrentBill());
		tasks.put("previousbills", new ViewPreviousBills());
		tasks.put("printbill", new PrintBill());
		tasks.put("registercustomer", new RegisterCustomer());
		tasks.put("addcustomer", new RegisterPageView());
		tasks.put("meterreading", new ContinuesMeterReading());
		tasks.put("addTransformer", new AddTransformer());
		tasks.put("transformarRegistration", new TransformarRegistration());
		tasks.put("viewconsumers", new ViewConsumers());
		tasks.put("viewtransformars", new ViewTransformers());
		tasks.put("fullnamevalidation", new UserExistenceChecker());
		tasks.put("transectionname", new RegisterPageView());
		tasks.put("paymyBill", new BillPayment());
		tasks.put("bulbControl", new BulbControl());
		tasks.put("bulbstatus", new GetBulbStatus());
		tasks.put("getpageHomeControl", new GetHomeControlPage());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BillGeneratorService generator = (BillGeneratorService) tasks.get(request.getParameter("hidden"));
		response.getWriter().print(generator.excute(request, response));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			BillGeneratorService action = (BillGeneratorService) tasks.get(request.getParameter("hidden"));
			request.getRequestDispatcher(action.excute(request, response)).forward(request, response);
		} catch (Throwable throwable) {
			request.getRequestDispatcher("errorpage.jsp").forward(request, response);
			throwable.printStackTrace();
		}
	}

}
