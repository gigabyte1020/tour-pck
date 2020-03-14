<%-- 
    Document   : approve1
    Created on : Mar 2, 2019, 9:27:49 AM
    Author     : user
--%>

<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
             
     ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs;
        
           
        String qry="INSERT INTO `request`( `pck_id`, `g_id`, `status`) VALUES ('"+request.getParameter("id")+"','"+session.getAttribute("l_id")+"','null') ";
               obj.InsertUpdate(qry);                                       
        out.println("<script type=\"text/javascript\">");
       out.println("alert('Added');");
       out.println("window.location.href ='guidehead.jsp';");
       out.println("</script>");
       // response.sendRedirect("admin_head.jsp");
        
        %>
    </body>
</html>

