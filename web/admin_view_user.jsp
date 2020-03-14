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
                                                                     Registered Users
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                                 <br><br>
                                                           
                                                    <table class="table table-striped table-bordered" id="user"  align="center" border="0" style="text-align: center;">
                                                                                        
                                                            <thead>
                                                                <tr>
                                                                    <th> Photo</th>
                                                                    <th> Name</th>
                                                                    <th> Address</th>
                                                                    <th> Phone No.</th>
                                                                    <th> Email</th>
                                                                    <th> Action</th>                                                                         
                                                                </tr>        
                                                            </thead>
                                                            <%
                                            ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs;String tx="";
    String s1=null,str;
                            String path=getServletContext().getRealPath("/").replace("\\build\\web", "\\web\\images");                  //String qry="SELECT * FROM `register` WHERE `user_status` ='0'";
                                             String qry="SELECT * FROM `register` WHERE `user_status`!='Reject'";
                                            rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {String us_id=rs.getString("user_id");
                                                     tx=rs.getString("image");
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
                                                     String s=rs.getString("user_status");
                                                            %>
                                                               <tr>
                                                      
                                                                   <td> <img src="images/<%=us_id+"\\"+tx%>"  style=" width: 100px; margin-left: 10px; height:100px"></td>
                                                  <td><%out.println(rs.getString("name"));%></td>  
                                                  <td><%out.println(rs.getString("add"));%></td>  
                                                   <td><%out.println(rs.getString("phno"));%></td>  
                                                    <td><%out.println(rs.getString("email"));%></td>  
                                                    <%
                                           if(s.matches("0"))
                                                      {
                                                          
                                                     
                                                        
                                                        %>
                                                        <td><a href="admin_user_approve.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>"><span class="glyphicon glyphicon-ok" title="Approve" ></span></a>
                                                          <br>
                                                          <a href="admin_user_reject.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>"><span class="glyphicon glyphicon-remove" title="Reject"></span></a>
                                                      </td> 
                                                      <%-- <td><a href="admin_user_reject.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>">Reject</a></td> --%>
                                                 
</tr>   
                                                
                                                            <%
                                                                }
else if(s.matches("Approved"))
{
%>
<td><a href="admin_user_reject.jsp?id=<%=rs.getString("user_id")%>&name=<%=rs.getString("name")%>"><span class="glyphicon glyphicon-trash" title="Suspend"></span></a></td>
                                                               
<%
                                         }
}
}
                                                          
                                             %>
                                            
                                                    </table>
                                                     
                                                        
                                                 
                                                 
                                                    </form>
                                                       
					
				</div>
                                             <br><br>
                                </div>
   
    <jsp:include page="footer.jsp"/>
