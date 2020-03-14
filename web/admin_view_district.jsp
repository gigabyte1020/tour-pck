<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>

<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="admin_head.jsp"/>
<script>
    $(document).ready(function(){
        $("#tid").DataTable();
        
    });
</script>
 <a name="active"></a>
   
				
                                            <div class="container">
                                                    
                                                       <form method="post"> 
                                                        
                                                           <br><br>
                                                           
                                                           
                                                           <table align="center" >
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 130px;color:#14a0da;" >
                                                                    List District
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                         
                                                              
                                             <br><br>
                                                           
                                                    <table align="center" border="0" id="tid" class="table table-striped table-bordered" style="text-align: center;">
                                                              <thead>
                                                                <tr>
                                                                    
                                                                    <th>Sl No.</th>
                                                                    <th> State Name</th>
                                                                   <th> District Name</th>
                                                                    <th> Action</th>
                                                                                                                                        
                                                                </tr>
                                                                
                                                            </thead>
                                                            <tbody>
                                                             
                                                           
                                                            <%
                                            ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs,rs5;
                                           //  String qry="SELECT * FROM `c_register` WHERE `c_status` ='0'";
                                           //
                                           int i=1;
                                           String qry="SELECT * FROM `district` ";
                                            rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                     
                                                    
                                                            %>
                                                         
                                                        <tr>
                                                
                                                  <td><%out.println(i++);%></td> 
                                                  <td><%
                                                       ConnectionCls obj1=new ConnectionCls();
                                           
                                           //  String qry="SELECT * FROM `c_register` WHERE `c_status` ='0'";
                                           //
                                         
                                           String qry1="SELECT * FROM `states` ";
                                            rs5=obj1.getDetails(qry1);
                                                   rs5.first();
                                             int count1=rs5.getRow();
                                             rs5.beforeFirst();
                                             if(count1>0)
                                             {
                                                 while(rs5.next())
                                                 {
                                                     out.println(rs5.getString("state"));
                                                 }
                                                 }
                                                      
                                                      
                                                      %></td>
                                                  <td><%out.println(rs.getString("district"));%></td>  
                                                  
                                                    <%
                                          
                                                        %>
                                                        <td><a href="admin_edit_district.jsp?id=<%=rs.getString(1)%>"><span class="glyphicon glyphicon-pencil " title="Edit"></span></a>
                                                           
                                                            <a href="admin_delete_district.jsp?id=<%=rs.getString(1)%>"><span class="glyphicon glyphicon-remove" title="Reject"></span></a></td> 
                                                                                               

<%
} 
}
                                             %>
                                             
                                          
                                                    </table>
                                                     
                                                        
                                                 
                                                 
                                                    </form>
                                                        <br>    <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>       
					
				</div>
   
    <jsp:include page="footer.jsp"/>

