<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<!DOCTYPE html>
<html>
<head>
    <title>Export data</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String exportPath = request.getParameter("exportPath");
        String fileName = request.getParameter("fileName");
        if (!exportPath.endsWith(File.separator)) {
            exportPath += File.separator;
        }
        exportPath += fileName;

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Borrow History");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Bookname");
        headerRow.createCell(1).setCellValue("Author");
        headerRow.createCell(2).setCellValue("Remark");
        headerRow.createCell(3).setCellValue("TimeStamp");
        headerRow.createCell(4).setCellValue("State");

        List<String[]> data = new ArrayList<>();
        BookOperation op = new BookOperation();
        String sid = (String)session.getAttribute("sid");
        List<BorrowRecord> records = op.getBorrowRecord(sid);
        for (BorrowRecord record : records) {
            data.add(new String[]{record.getBookName(), record.getAuthor(), record.getRemark(), record.getTimeStamp(), (record.getState() == 1 ? "Returned" : "Not return")});
        }

        int rowCount = 1;
        for (String[] line : data) {
            Row row = sheet.createRow(rowCount++);
            for (int i = 0; i < line.length; i++) {
                row.createCell(i).setCellValue(line[i]);
            }
        }

        try (FileOutputStream fileOut = new FileOutputStream(exportPath)) {
            workbook.write(fileOut);
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
            out.println("<script>swal('Error', 'Failed to export file. Check the file path and permissions.', 'error');</script>");
        }
    %>

<script type="text/javascript">
    var exportPath = "<%= request.getParameter("exportPath") %>";
    parent.swal("Congratulations!", "The BorrowRecord has been exported at " + exportPath, "success").then(() => {
        parent.window.location.reload(); // Reload the parent page
    });
</script>

</body>
</html>
