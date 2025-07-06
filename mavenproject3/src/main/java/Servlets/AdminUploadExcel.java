/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import Elements.*;
import Functionalities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import jakarta.servlet.annotation.MultipartConfig;

/**
 *
 * @author Tian
 */
@WebServlet(name = "AdminUploadExcel", urlPatterns = {"/AdminUploadExcel"})
@MultipartConfig
public class AdminUploadExcel extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            Part filePart = request.getPart("file"); // 获取文件部分
            InputStream fileContent = filePart.getInputStream();

            try (XSSFWorkbook workbook = new XSSFWorkbook(fileContent)) {
                Sheet sheet = workbook.getSheetAt(0); // 获取第一个工作表              
                UserOperation op = new UserOperation();

                for (Row row : sheet) {
                    if (row.getRowNum() == 0) continue; // 跳过标题行

                    // 赋值给变量
                    String id = String.valueOf((int) row.getCell(0).getNumericCellValue());
                    String userName = row.getCell(1).getStringCellValue();
                    String sex = row.getCell(2).getStringCellValue();
                    String major = row.getCell(3).getStringCellValue();
                    int numberOfBorrow = (int) row.getCell(4).getNumericCellValue();
                    String account = row.getCell(5).getStringCellValue();
                    String password = row.getCell(6).getStringCellValue();

                    // 创建 User 对象并插入
                    User u = new User(id, userName, sex, major, account, password, numberOfBorrow);
                    try {
                        op.insert(u); 
                    } catch (SQLException sqlEx) {
                        out.print("<script>alert('Failed to insert user: " + userName + ". SQL Error: " + sqlEx.getMessage() + "'); window.location='/mavenproject3/Book/Import/import.jsp';</script>"); 
                    }
                }
                out.print("<script>alert('User Add Successful');window.location='/mavenproject3/Book/Import/import.jsp';</script>");    
                
            } catch (Exception e) {
                out.print("<script>alert('User Add Fail');window.location='/mavenproject3/Book/Import/import.jsp';</script>");          
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
