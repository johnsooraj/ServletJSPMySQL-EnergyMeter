package com.kseb.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kseb.model.ElectricityData;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class RegisterPageView implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		if (httpServletRequest.getParameter("hidden").equals("addcustomer")) {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			Session session = sessionFactory.openSession();
			String hql = "from ElectricityData";
			Query query = session.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<ElectricityData> transformardata = query.list();

			System.out.println(transformardata);

			System.out.println(transformardata.stream().distinct().collect(Collectors.toList()));
			httpServletRequest.getSession().setAttribute("transformardata", transformardata.stream()
					.map((a) -> a.getTrasformerSection()).distinct().collect(Collectors.toList()));

			return "registration.jsp";
		} else if (httpServletRequest.getParameter("hidden").equals("transectionname")) {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			Session session = sessionFactory.openSession();
			String hql = "FROM ElectricityData eledata WHERE eledata.trasformerSection =:name";
			Query query = session.createQuery(hql);
			query.setParameter("name", httpServletRequest.getParameter("fullname"));
			@SuppressWarnings("unchecked")
			List<ElectricityData> transformardata = query.list();
			System.out.println(transformardata);
			try {
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonData = objectMapper.writeValueAsString(transformardata);
				System.out.println(jsonData);
				return jsonData;
			} catch (IOException e) {
				e.printStackTrace();
			}

			return "registration.jsp";
		} else {
			return "registration.jsp";
		}

	}

}
