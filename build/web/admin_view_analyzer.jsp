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
                                                                                                                       <a style="background-color:#5bc0de !important;border:none; color:#fff; margin-top: 5%;margin-left: 70%" class="btn btn-flat btn-lg pull-right" href="admin_add_analyzer.jsp">Add Analyzer</a><br>
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
                                                                  
                                                                    <th> Name</th>
                                                                    <th> State</th>
                                                                    <th> District</th>
                                                                    <th> Phone No.</th>
                                                                    <th> Email</th>
                                                                                                                                       
                                                                </tr>        
                                                            </thead>
                                                            <%//`s_id``d_id``loc``a_name``a_no``a_email`
                                            ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs;String tx="";
    String s1=null,str;
                           // String path=getServletContext().getRealPath("/").replace("\\build\\web", "\\web\\images");                  //String qry="SELECT * FROM `register` WHERE `user_status` ='0'";
                                             String qry="SELECT * FROM `analyzer`";
                                            rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                     String us_id=rs.getString("a_id");
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
                                                      
                                                                  
                                                  <td><%out.println(rs.getString("a_name"));%></td>  
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
                                             c1.getDetails("select * from district where dist_id='"+rs.getString("d_id")+"'");
                                             if(c1.rs.next())
                                             {
                                                 out.println(c1.rs.getString("district"));
                                             }
                                                      
                                                      
                                                      %></td>  
                                                   <td><%out.println(rs.getString("a_no"));%></td>  
                                                    <td><%out.println(rs.getString("a_email"));%></td>  
                                                    <%
                                         
                                                     
                                                        
                                                        %>
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
