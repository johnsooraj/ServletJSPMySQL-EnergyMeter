package com.kseb.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.kseb.service.impl.AutoGenerationBill;

@WebListener
public class EnergyMeter implements ServletContextListener {

	public EnergyMeter() {
	}

	public void contextDestroyed(ServletContextEvent arg0) {
	}

	public void contextInitialized(ServletContextEvent arg0) {
		AutoGenerationBill.getInstance();
	}

}
