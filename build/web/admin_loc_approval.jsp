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
        
           
        String qry="UPDATE `locationmapper` SET `stat`='admin_approved' WHERE `lo_id`='"+request.getParameter("id")+"'";
               obj.InsertUpdate(qry);     
               ConnectionCls c1z=new ConnectionCls();
  c1z.getDetails("select * from locationmapper where `lo_id`='"+request.getParameter("id")+"'");
  if(c1z.rs.next())
  {
      
  
      ConnectionCls o=new ConnectionCls();
      
  o.InsertUpdate("insert into location(s_id,dist_id,loc)values('"+c1z.rs.getString("s_id")+"','"+c1z.rs.getString("dist_id")+"','"+c1z.rs.getString("location")+"')");
  }
        out.println("<script type=\"text/javascript\">");
       out.println("alert('Approved');");
       out.println("window.location.href ='admin_head.jsp';");
       out.println("</script>");
       // response.sendRedirect("admin_head.jsp");
        
        %>
    </body>
</html>