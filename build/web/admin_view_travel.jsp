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
                                                                     Registered Traveler
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                         
                                                              
                                             <br><br>
                                                           
                                                    <table align="center" border="0" id="tid" class="table table-striped table-bordered" style="text-align: center;">
                                                              <thead>
                                                                <tr>
                                                                     
                                                                    <th> Name</th>
                                                                    <th>State</th>
                                                                    <th> District</th>
                                                                    <th> Started Date</th>
                                                                    <th> Address</th>
                                                                    <th> Phone No.</th>
                                                                    <th> Email</th>
                                                                    <th> Action</th>
                                                                                                                                        
                                                                </tr>
                                                                
                                                            </thead>
                                                            <tbody>
                                                             
                                                           
                                                            <%
                                            ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs,rs5;
                                           //  String qry="SELECT * FROM `c_register` WHERE `c_status` ='0'";
                                           //
                                           String qry="SELECT * FROM `c_register` WHERE `c_status` !='Reject' and role='travel'";
                                            rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                     
                                                     String tx=""; String cid=rs.getString("log_id");
     String path=getServletContext().getRealPath("/").replace("\\build\\web", "\\web\\images");
   String s1=null,str;
       tx=rs.getString("pic");
    File  f=new File(tx);
s1=path+"\\"+cid+"\\"+f.getName();

       
    if(s1!=null){
       
        str=s1;
        
    }
       else{
      String   gt="userp.jpg";
        File f2=new File(gt);
        str=path+"\\"+cid+"\\"+f2.getName();
    }                       
                                                     
                                                     
                                                      String s=rs.getString("c_status");
                                                            %>
                                                         
                                                        <tr>
                                                  
                                                  <td><%out.println(rs.getString("c_name"));%></td> 
                                                  <td><%
                                                      
                                             ConnectionCls c=new ConnectionCls();
                                             c.getDetails("select * from states where state_id='"+rs.getString("about")+"'");
                                             if(c.rs.next())
                                             {
                                                 out.println(c.rs.getString("state"));
                                             }
                                                      
                                                      
                                                      %></td>  
                                                   <td><%
                                                      
                                             ConnectionCls c1=new ConnectionCls();
                                             c1.getDetails("select * from district where dist_id='"+rs.getString("ceoname")+"'");
                                             if(c1.rs.next())
                                             {
                                                 out.println(c1.rs.getString("district"));
                                             }
                                                      
                                                      
                                                      %></td>   
                                                  <td><%out.println(rs.getString("date"));%></td>  
                                                  <td><%out.println(rs.getString("c_add"));%></td>  
                                                   <td><%out.println(rs.getString("c_phno"));%></td>  
                                                    <td><%out.println(rs.getString("c_email"));%></td>  
                                                    <%
                                           if(s.matches("0"))
                                                      {
                                                          
                                                     
                                                        
                                                        %>
                                                        <td><a href="admin_travel_approve.jsp?id_c=<%=rs.getString("c_id")%>&name=<%=rs.getString("c_name")%>"><span class="glyphicon glyphicon-ok " title="Approve"></span></a>
                                                          
                                                            <a href="admin_travel_reject.jsp?id_c=<%=rs.getString("c_id")%>&name=<%=rs.getString("c_name")%>"><span class="glyphicon glyphicon-remove" title="Reject"></span></a></td> 
                                                       <%
                                                                }
else if(s.matches("Approved"))
{
String u="SELECT * FROM `vaccancies` WHERE `admin_status`='null' and log_id='"+cid+"'";

 rs5=obj.getDetails(u);

                                                 
%>
                                                        
                                                        <td ><a href="admin_guide_reject.jsp?id_c=<%=rs.getString("c_id")%>&name=<%=rs.getString("c_name")%>"><span class="glyphicon glyphicon-trash" title="Suspend"></span></a>                                           
                                                             
                                                            <a href="admin_view_pckg.jsp?id_c=<%=rs.getString("c_id")%>&name=<%=rs.getString("c_name")%>&lo_id=<%=rs.getString("log_id")%>"><span class="glyphicon glyphicon-file" title="View Openings"></span></a>
                                                          <%
                                                          if(rs5.next())
{
out.print("<font color=\"red\">NEW OPENING");
}
                                                          
                                                          %>  </td></tbody>    
                                                            </tr>
                                                            <%
}
                                                   
}%>
                                                                                                   

<%
}           
                                             %>
                                             
                                          
                                                    </table>
                                                     
                                                        
                                                 
                                                 
                                                    </form>
                                                        <br>    <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>       
					
				</div>
   
    <jsp:include page="footer.jsp"/>

