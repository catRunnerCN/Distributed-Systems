/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import Functionalities.*;

import Elements.Admin;

/**
 *
 * @author Tian
 */
@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet {

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

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out =response.getWriter();
        String loginjudge=request.getParameter("loginjudge");
        String EncryptAccount = request.getParameter("account");
        String EncryptPassword = request.getParameter("password");
        String account = "";
        String password = "";
        try{
            account = UserOperation.decrypt(EncryptAccount);
            password = UserOperation.decrypt(EncryptPassword);
            request.setAttribute("account", account);
            
            account = Hash.getHashValue(account);
            password = Hash.getHashValue(password);
        } catch (Exception ex) {
            out.print("<script>alert('Decrypt Error!');window.location='UserLogin?loginjudge=wrong';</script>");
        }
//        out.println("account = " + account);
//        out.println("password = " + password);
        Admin mm=new Admin(account,password);
        
        if("wrong".equals(loginjudge)) {
            request.getRequestDispatcher("Book/Login/admin_login.jsp").forward(request, response);
        }else if("right".equals(loginjudge)) {
            request.getRequestDispatcher("Book/Menu/admin_menu.jsp").forward(request, response);
        }

        try {
            if(mm.judge(mm.getAccount(),mm.getPassword()))
                out.print("<script>alert('Administrator Login Successful');window.location='AdminLogin?loginjudge=right';</script>");
            else
                out.print("<script>alert('Administrator Login Fail');window.location='AdminLogin?loginjudge=wrong';</script>");
            
        } catch (ClassNotFoundException | SQLException e) {
            out.print("<script>alert('Administrator Login Fail');window.location='AdminLogin?loginjudge=wrong';</script>");
        } catch (Exception e) {
            out.print("<script>alert('Administrator Login Fail');window.location='ManagerLogin?loginjudge=wrong';</script>");
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
