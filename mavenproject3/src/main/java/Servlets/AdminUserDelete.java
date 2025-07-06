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

import Functionalities.UserOperation;

/**
 *
 * @author Tian
 */
@WebServlet(name = "AdminUserDelete", urlPatterns = {"/AdminUserDelete"})
public class AdminUserDelete extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String bookdelete = request.getParameter("bookdelete");
        String from = request.getParameter("from");
        request.setAttribute("from", from);

        if("delete".equals(bookdelete)) {
            if("out".equals(from)) {
//                request.getRequestDispatcher("Book/Select/admin_selectUser_output.jsp").forward(request, response);
                request.getRequestDispatcher("Book/Select/admin_selectUser_input.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("Book/Select/admin_selectUser_all.jsp").forward(request, response);
            }
        }else {
            String operation = request.getParameter("operation");
            if("delete".equals(operation)) {
                String account = request.getParameter("account");
                request.setAttribute("account", account);
                UserOperation op = new UserOperation();
                try {
                    op.delete(account);
                    out.print("<script>alert('Delete User Successful');window.location='AdminUserDelete?bookdelete=delete&operation="+operation+"&from="+from+"&account="+account+"';</script>");
                } catch (Exception e) {
                    out.print("<script>alert('Delete User Fail');window.location='AdminUserDelete?bookdelete=delete&operation="+operation+"&from="+from+"&account="+account+"';</script>");
                    e.printStackTrace();
                }
            }
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
