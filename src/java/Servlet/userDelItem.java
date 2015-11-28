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
public class userDelItem extends HttpServlet {

    String quant;
    String prodID;

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
        String orderIndex = request.getParameter("orderIndex");

        System.out.println("UserDelItem Servlet: The user is: " + userEmail + userID);
        System.out.println("UserDelItem Servlet: The order ID is: " + orderID);
        System.out.println("UserDelItem Servlet: The Order Index is: " + orderIndex);

        //Declaring classes required for Database support
        try {
            Connection connection = null;
            //Creating a connection to the required DB
            try {
                connection = DriverManager.getConnection("jdbc:mysql://72.196.117.187:3306/mudkip?zeroDateTimeBehavior=convertToNull", "admin", "root");
            } catch (Exception E) {
                System.out.println("Error is: " + E.getMessage());
            }

            //Getting Quantity to Add Back to Store
            String contains = "Select quant from contains Where orderID = ? AND i = ?;";
            //Getting Product ID
            String FindprodID = "Select prodID from contains Where orderID = ? AND i = ?;";

            //Deleting Item from User's Cart
            String sql = "DELETE FROM contains WHERE orderID = ? AND i = ?;";

            //Adding Back to Store
            String update = "UPDATE product SET prodQuant = product.prodQuant + ? WHERE product.prodID = ? ;";
            //Maintaining User Logged In Information
            String user = "Select * from user Where user.userEmail = ?;";

            PreparedStatement prep = null;
            PreparedStatement prep1 = null;
            PreparedStatement prep2 = null;
            PreparedStatement prep3 = null;
            PreparedStatement prep4 = null;

            try {

                prep = connection.prepareStatement(sql);
                prep1 = connection.prepareStatement(update);
                prep2 = connection.prepareStatement(user);
                prep3 = connection.prepareStatement(contains);
                prep4 = connection.prepareStatement(FindprodID);
            } catch (Exception E) {
                System.out.println("Error is: " + E.getMessage());
            }

            //Finding Quantity
            prep3.setString(1, orderID);
            prep3.setString(2, orderIndex);
            ResultSet rs = prep3.executeQuery();
            rs.next();
            quant = rs.getString(1);

            //Finding Product ID
            prep4.setString(1, orderID);
            prep4.setString(2, orderIndex);
            ResultSet rs1 = prep4.executeQuery();
            rs1.next();
            prodID = rs1.getString(1);

            System.out.println("UserDelItem Servlet: The Order quant is: " + quant);
            System.out.println("UserDelItem Servlet: The Order prodID is: " + prodID);

            //Setting the values which we got from the JSP form
            //Adding items back to store
            prep1.setString(1, quant);
            prep1.setString(2, prodID);
            //Deleting from user's cart
            prep.setString(1, orderID);
            prep.setString(2, orderIndex);
            //Maintaining User Log in Informaiton
            prep2.setString(1, userEmail);
            prep.executeUpdate();
            prep1.executeUpdate();
            prep2.executeQuery();
            prep.close();
            prep1.close();
            connection.close();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception E) {
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
