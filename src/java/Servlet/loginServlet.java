/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abby
 */
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            String email = request.getParameter("userEmail");
            String pass = request.getParameter("userPass");

            if(Validate.checkUser(email, pass))
            {
                RequestDispatcher rs = request.getRequestDispatcher("Welcome");
                rs.forward(request, response);
            }
            else
            {
               out.println("Username or Password incorrect");
               RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
               rs.include(request, response);
            }
        }  
}

    