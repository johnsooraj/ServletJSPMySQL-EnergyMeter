package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.jboss.logging.Logger;

import com.kseb.model.CustomerData;
import com.kseb.model.CustomerTransformarDetails;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class RegisterCustomer implements BillGeneratorService {

	private static final Logger logger = Logger.getLogger(RegisterCustomer.class);


	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		System.out.println("Registration Starts");
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		CustomerData customerData = new CustomerData();
		LoginCredentials credentials = new LoginCredentials();
		CustomerTransformarDetails customerTransformarDetails = new CustomerTransformarDetails();

		customerData.setFullName(httpServletRequest.getParameter("fullname"));
		customerData.setHouseName(httpServletRequest.getParameter("housename"));
		customerData.setHouseNumber(Long.parseLong(httpServletRequest.getParameter("housenumber")));
		customerData.setPostOffice(httpServletRequest.getParameter("postoffice"));
		customerData.setLandmark(httpServletRequest.getParameter("landmark"));
		customerData.setPincode(Long.parseLong(httpServletRequest.getParameter("pincode")));
		customerData.setEmail(httpServletRequest.getParameter("email"));
		customerData.setPhone(httpServletRequest.getParameter("mobphone"));
		customerData.setLandPhone(httpServletRequest.getParameter("landnumber"));

		credentials.setLoginType(httpServletRequest.getParameter("usertype"));
		credentials.setUsername(httpServletRequest.getParameter("username"));
		credentials.setPassword(httpServletRequest.getParameter("password"));
		credentials.setMeterId(httpServletRequest.getParameter("serialnumber"));

		customerTransformarDetails.setTransformarNumber(httpServletRequest.getParameter("sectionname"));
		customerTransformarDetails.setTransformarSection(httpServletRequest.getParameter("trannumber"));

		customerData.setCredentials(credentials);
		customerData.setTransformarDetails(customerTransformarDetails);
		credentials.setCustomerData(customerData);

		session.save(customerTransformarDetails);
		session.save(customerData);
		session.save(credentials);
		transaction.commit();

		logger.info("ALL DATA SAVED SUCESSFULLY");
		logger.info(customerData);
		logger.info(customerTransformarDetails);
		logger.info(credentials);

		return "adminhome.jsp";
	}

}
