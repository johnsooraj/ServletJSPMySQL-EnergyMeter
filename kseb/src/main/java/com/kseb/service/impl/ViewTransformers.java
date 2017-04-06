package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.kseb.model.ElectricityData;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class ViewTransformers implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();

		String myQuery = "FROM ElectricityData";
		Query query = session.createQuery(myQuery);
		@SuppressWarnings("unchecked")
		List<ElectricityData> transformerDetails = query.list();

		httpServletRequest.getSession().setAttribute("transData", transformerDetails);

		return "viewtransformar.jsp";
	}

}
