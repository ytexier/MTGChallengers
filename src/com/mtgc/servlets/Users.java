package com.mtgc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mtgc.beans.User;

public class Users extends HttpServlet{
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	    
		String paramAuteur = request.getParameter( "auteur" );
	    String message = "Transmission de variables : OK ! " + paramAuteur;
		
		/* Création du bean */
		User userBean = new User();
		/* Initialisation de ses propriétés */
		userBean.setGivenName("Yohan");
		userBean.setFamilyName("TEXIER");
			
		/* Stockage du message et du bean dans l'objet request */
		request.setAttribute( "test", message );
		request.setAttribute( "user", userBean );
	    
	    this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );
	}
}
