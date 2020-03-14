<%-- 
    Document   : find_location
    Created on : May 24, 2019, 9:59:57 AM
    Author     : user
--%>

<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>

<%ConnectionCls c=new ConnectionCls();
        ResultSet rs;
        rs=c.getDetails("SELECT * FROM `location` WHERE  `dist_id`='"+request.getParameter("l")+"'");
%>

      <div class="input-group margin-bottom-20" style="width:297px;" >
                                            

<select  class="form-control"  name="location" >

<option>Select Location</option>
<%
    while(rs.next())
    {
    %>
<option value="<%out.print(rs.getString("l_id"));%>"><%out.print(rs.getString("loc"));%></option>
<%}%>
</select>
</div>
	
