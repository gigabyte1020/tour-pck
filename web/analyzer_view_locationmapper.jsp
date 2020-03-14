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
<jsp:include page="analyzer_head.jsp"/>
<script>
    $(document).ready(function(){
        $("#user").DataTable();   
    }); 
</script>
 <a name="active"></a>
 
        
        
 <div class="container" style="margin-left: 30%">
					<div class="row">
    
                                                       <form method="post"> 
                                                           <br><br>
                                                                                                                      
                                                            <table align="center" >
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 130px;color:#14a0da;" >
                                                                      Analyzer
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>  

                                                                 <br><br>
                                                           
                                                    <table class="table table-striped table-bordered" id="user"  align="center" border="0" style="text-align: center;">
                                                                                        
                                                            <thead>
                                                                <tr>
                                                                  
                                                                    
                                                                    <th> State</th>
                                                                    <th> District</th>
                                                                    <th> Location</th>
                                                                    <th> Descrption</th>
                                                                    <th> Action</th>                                                                         
                                                                </tr>        
                                                            </thead>
                                                            <%//`s_id``d_id``loc``a_name``a_no``a_email`
                                            ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs;String tx="";
    String s1=null,str;
                           // String path=getServletContext().getRealPath("/").replace("\\build\\web", "\\web\\images");                  //String qry="SELECT * FROM `register` WHERE `user_status` ='0'";
                                             String qry="SELECT * FROM `locationmapper`";
                                            rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                    // String us_id=rs.getString("a_id");
                                                    /* tx=rs.getString("image");
    File  f=new File(tx);
s1=path+"\\"+us_id+"\\"+f.getName();

       
    if(s1!=null){
       
        str=s1;
        
    }
       else{
      String   gt="userp.jpg";
        File f2=new File(gt);
        str=path+"\\"+us_id+"\\"+f2.getName();
    }
                                                     String s=rs.getString("user_status");*/
                                                            %>
                                                               <tr>
                                                      
                                                                  
                                                
                                                  <td><%
                                                      
                                             ConnectionCls c=new ConnectionCls();
                                             c.getDetails("select * from states where state_id='"+rs.getString("s_id")+"'");
                                             if(c.rs.next())
                                             {
                                                 out.println(c.rs.getString("state"));
                                             }
                                                      
                                                      
                                                      %></td>  
                                                   <td><%
                                                      
                                             ConnectionCls c1=new ConnectionCls();
                                             c1.getDetails("select * from district where dist_id='"+rs.getString("dist_id")+"'");
                                             if(c1.rs.next())
                                             {
                                                 out.println(c1.rs.getString("district"));
                                             }
                                                      
                                                      
                                                      %></td>  
                                                   <td><%out.println(rs.getString("location"));%></td>  
                                                    <td><%out.println(rs.getString("des"));%></td>  
                                                    <td>
                                                    <%
                                         if(rs.getString("stat").matches("waiting"))
                                         {
                                            %>
                                            <a href="analayzer_loc_approval.jsp?id=<%=rs.getString("lo_id")%>"><span class="glyphicon glyphicon-ok " title="Approve"></span></a>
                                                           
                                                            <a href="analyzer_loc_reject.jsp?id=<%=rs.getString("lo_id")%>"><span class="glyphicon glyphicon-remove" title="Reject"></span></a></td> 
                                          
                                            <%
                                         }
                                         else  if(rs.getString("stat").matches("approved"))
                                         {
                                             out.println("Pending");
                                         }
else if(rs.getString("stat").matches("admin_approved"))
                                         {
                                             out.println("Approved");

                                         }
else if(rs.getString("stat").matches("Rejected"))
                                         {
                                             out.println("Rejected");

                                         }
else if(rs.getString("stat").matches("ARejected"))
                                         {
                                             out.println("Rejected");

                                         }

                                                     
                                                        
%></td>
                                                     <%--   <td><a href="admin_user_approve.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>"><span class="glyphicon glyphicon-ok" title="Approve" ></span></a>
                                                          <br>
                                                          <a href="admin_user_reject.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>"><span class="glyphicon glyphicon-remove" title="Reject"></span></a>
                                                      </td> 
                                                       <td><a href="admin_user_reject.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>">Reject</a></td> --%>
                                                 
</tr>   
                                                
                                                            <%
                                                                
}
}
                                                          
                                             %>
                                            
                                                    </table>
                                                     
                                                        
                                                 
                                                 
                                                    </form>
                                                       
					
				</div>
                                             <br><br>
                                </div>
   
    <jsp:include page="footer.jsp"/>
