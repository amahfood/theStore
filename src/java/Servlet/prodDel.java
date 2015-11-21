/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abby
 */


public class prodDel extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Get user_name and password from jsp page
        String prodID = request.getParameter("prodID");
        String userEmail = request.getParameter("userEmail");


        System.out.println("ProdDel Servlet: The prodID is: " + prodID);
              
        //Declaring classes required for Database support
        
        
        try{
            Connection connection = null;
            //Creating a connection to the required DB
            try{
                connection = DriverManager.getConnection("jdbc:mysql://72.196.117.187:3306/mudkip?zeroDateTimeBehavior=convertToNull", "admin", "root");
            } catch(Exception E){
                System.out.println("Error is: " + E.getMessage());
            }
            
            
            //Add the data into the database
            
            String sql = "DELETE FROM product WHERE prodID = ?;";
            String user = "Select * from user Where user.userEmail = ?;";
            PreparedStatement prep = null;
            PreparedStatement prep1 = null;
            try{
                prep = connection.prepareStatement(sql);
                prep1 = connection.prepareStatement(user);
            } catch(Exception E){
                System.out.println("Error is: " + E.getMessage());
            }
            
            prep1.setString(1, userEmail);
            ResultSet rs = prep1.executeQuery();
            rs.next();

            //Setting the values which we got from the JSP form
            prep.setString(1, prodID);
            prep.executeUpdate();
            prep.close();
            prep1.close();
            connection.close();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/manage.jsp");
            requestDispatcher.forward(request, response);
                    
        } catch(Exception E){
            System.out.println("The Error is ==" + E.getMessage());
        }
        
              
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
