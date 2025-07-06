package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Elements.*;
import Functionalities.*;

/**
 *
 * @author Tian
 */
@WebServlet(name = "UserRegister", urlPatterns = {"/UserRegister"})
public class UserRegister extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    public UserRegister() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out =response.getWriter();
        String loginjudge = request.getParameter("loginjudge");
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
        UserOperation op = new UserOperation();
        
        if("wrong".equals(loginjudge)) {
                request.getRequestDispatcher("Book/Login/user_register.jsp").forward(request, response);
        }
        else if("right".equals(loginjudge)) {
                request.getRequestDispatcher("Book/Login/user_login.jsp").forward(request, response);
        }
        else {
            if(account != null && !account.isEmpty()){
                String id = request.getParameter("id");
                String user_name = request.getParameter("user_name");
                String sex = request.getParameter("sex");
                String major = request.getParameter("major");
                User new_user = new User(id, user_name, sex, major, account, password, 0);
                try {
                    op.insert(new_user);
                    out.print("<script>alert('Register Success');window.location='UserRegister?loginjudge=right';</script>");
                } catch (Exception e) {
                    out.print("<script>alert('Register Fail');window.location='UserRegister?loginjudge=wrong';</script>");
                    e.printStackTrace();
                }
            }
            else {
                out.print("<script>alert('Need Account');window.location='UserRegister?loginjudge=wrong';</script>");
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
