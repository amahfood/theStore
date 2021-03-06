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


public class addToOrder extends HttpServlet {
    int ID;
    int i;
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
        String userEmail = request.getParameter("userEmail");
        String userID = request.getParameter("userID");
        String orderID = request.getParameter("orderID");
        String prodQuant = request.getParameter("prodQuant");
        String prodID = request.getParameter("prodID");

        System.out.println("Add To Order Servlet: The user is: " + userEmail + userID);
        System.out.println("Add To Order Servlet: The product ID is: " + prodID);
        System.out.println("Add To Order Servlet: The product Quantity is: " + prodQuant);
        System.out.println("Add To Order Servlet: The Order ID is: " + orderID);
              
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
            
            String sql = "insert into contains values (?,?,?,?);";
            String update = "UPDATE product SET prodQuant = product.prodQuant - ? WHERE product.prodID = ? ;";
            String user = "Select * from user Where user.userEmail = ?;";
            String contains = "Select MAX(i) AS maxi from contains Where contains.orderID = ?;";
            
            PreparedStatement prep = null;
            PreparedStatement prep1 = null;
            PreparedStatement prep2 = null;
            PreparedStatement prep3 = null;
            
            try{
                
                prep = connection.prepareStatement(sql);
                prep1 = connection.prepareStatement(update);
                prep2 = connection.prepareStatement(user);
                prep3 = connection.prepareStatement(contains);
            } catch(Exception E){
                System.out.println("Error is: " + E.getMessage());
            }
            
            try{
                prep3.setString(1, orderID);
                ResultSet rs = prep3.executeQuery();
                rs.next();
                i = rs.getInt(1) + 1;
            } catch(Exception E){
                System.out.println("Error is: " + E.getMessage());
                i = 1;
            }
            

            System.out.println("Add To Order Servlet: The i is: " + i);
            
            //Setting the values which we got from the JSP form
            prep1.setString(1, prodQuant);
            prep1.setString(2, prodID);
            prep.setString(1, prodID);
            prep.setString(2, orderID);
            prep.setString(3, prodQuant);
            prep.setInt(4, i);
            prep2.setString(1, userEmail);
            prep.executeUpdate();
            prep1.executeUpdate();
            prep2.executeQuery();
            prep.close();
            prep1.close();
            connection.close();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart.jsp");
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
