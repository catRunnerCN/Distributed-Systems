package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Elements.User;
import Functionalities.*;
import jakarta.servlet.http.Cookie;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author muzum
 */
@WebServlet(name = "UserValidation", urlPatterns = {"/UserValidation"})
public class UserValidation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
 */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String EncryptAccount = request.getParameter("account");
        String EncryptPassword = request.getParameter("password");
        String account = "", password = "";
        try{
            account = UserOperation.decrypt(EncryptAccount);
            password = UserOperation.decrypt(EncryptPassword);
        } catch (Exception ex) {
            out.print("<script>alert('Decrypt Error!');window.location='UserLogin?loginjudge=wrong';</script>");
            Logger.getLogger(UserValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
            
//            out.println("account = " + account);
//            out.println("password = " + password);
            account = Hash.getHashValue(account);
            password = Hash.getHashValue(password);
//            out.println("hash account = " + account);
//            out.println("hash password = " + password);
            
        int res = -2;
        try {
            res = User.exist(account, password);
        } catch (Exception ex) {
            out.print("<script>alert('User checker Error!');window.location='UserLogin?loginjudge=wrong';</script>");
        }

        switch (res) {
            case 1:
                // Set cookie
                Cookie accountCookie = new Cookie("account", account);
                accountCookie.setMaxAge(60 * 60 * 24);  // 1 day
                accountCookie.setPath("/");
                response.addCookie(accountCookie);
                out.print("<script>alert('Login Successfully');window.location='UserLogin?loginjudge=right&account="+account+"';</script>");
                break;
            case 0:
                out.print("<script>alert('User does not exist!');window.location='UserLogin?loginjudge=wrong&account="+account+"';</script>");
                break;
            case -1:
                out.print("<script>alert('Incorrect Password!');window.location='UserLogin?loginjudge=wrong&account="+account+"';</script>");
                break;
            default:
                out.print("<script>alert('User checker Error!');window.location='UserLogin?loginjudge=wrong&account="+account+"';</script>");
                break;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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