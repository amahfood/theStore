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


public class storeServlet extends HttpServlet {
    int ID;
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
        String mudkipfirst = request.getParameter("userName");
        String mudkipsecond = request.getParameter("userEmail");
        String mudkipthird = request.getParameter("userAddr");
        String mudkipfifth = request.getParameter("userPass");
        String mudkipfourth = request.getParameter("staff");

        
        System.out.println("The username is: " + mudkipfirst);
        System.out.println("The staff is: " + mudkipfourth);
        
        
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
            
            String maxID = "SELECT MAX(userID) AS maxID FROM user;";
            String sql = "insert into user values (?,?,?,?,?,?,?);";
            PreparedStatement prep = null;
            PreparedStatement prep1 = null;
            try{
                prep = connection.prepareStatement(sql);
                prep1 = connection.prepareStatement(maxID);
            } catch(Exception E){
                System.out.println("Error is: " + E.getMessage());
            }
            
            System.out.println("OK1");
            ResultSet rs = prep1.executeQuery();
            System.out.println("OK2");
            rs.next();
            ID = rs.getInt(1) + 1;
            System.out.println("ID = " + ID);
            
            //Setting the values which we got from the JSP form
            prep.setInt(1, ID);
            prep.setString(2, mudkipfirst);
            prep.setString(3, "");
            prep.setString(4, mudkipsecond);
            prep.setString(5, mudkipfifth);
            prep.setString(6, mudkipthird);
            prep.setString(7, mudkipfourth);
            prep.executeUpdate();
            prep.close();
            connection.close();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/profile.jsp");
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
