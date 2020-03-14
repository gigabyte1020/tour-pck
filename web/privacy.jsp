<%-- 
    Document   : user_update
    Created on : Mar 13, 2019, 4:29:49 PM
    Author     : user
--%>

<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<a name="active"></a>
   <div>
     
    
     
 </div>
 <section id="contact">
<%
     String lo_id=session.getAttribute("l_id").toString();
     ConnectionCls obj2=new ConnectionCls();String role=null;
                                                      ResultSet rs;
                                                     // String c_p=request.getParameter("n1");
                                                       String q2="SELECT  * FROM `login` WHERE `log_id`='"+lo_id+"'";
                                                        obj2.getDetails(q2);
                                                        if(obj2.rs.next())
                                                        {
                                                            role=obj2.rs.getString("role");
                                                        }
                                                         
                                                        if(role.matches("admin"))
                                                        {
                                                         %>
                                                       <jsp:include page="admin_head.jsp"/>
     <%   
                                                        }
                                                        else if(role.matches("user"))
                                                        {
                                                         %>
                                                       <jsp:include page="user_head.jsp"/>
     <%   
                                                        }
                                                        else if(role.matches("analyzer"))
                                                        {
                                                         %>
                                                       <jsp:include page="analyzer_head.jsp"/>
     <%   
                                                        }
else if(role.matches("travel"))
                                                        {
                                                         %>
                                                       <jsp:include page="guide_head.jsp"/>
     <%   
                                                        }
else if(role.matches("guide"))
                                                        {
                                                         %>
                                                       <jsp:include page="guidehead.jsp"/>
     <%   
                                                        }
                                                            
                                                        
%>
     <%--  <div id="map"></div>--%>
 <div class="container">
            <div class="container text-center">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-12 col-xs-12">
                        <div class="contact-form-area">
                            <form onsubmit="return pasmatch()">
                               <table align="center" >
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 130px;font-family: sans-serif;color:#14a0da " >
                                                                    Update
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                         
                                
                                <div class="form-group">
                                    <input type="password" name="n1" class="form-control" placeholder="Current Password">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="n2" class="form-control" id="match1" placeholder="New Password">
                                </div>
                                   <div class="form-group">
                                    <input type="password" name="n7" class="form-control" id="match2" placeholder="Re-Type Password">
</div>

                               <div class="form-group">
                                    <input type="submit" name="submit" value="Submit">
                                </div>
                                
                                 <%
                                  //   String lo_id=session.getAttribute("log_id").toString();
                                    ConnectionCls obj=new ConnectionCls();
                                                      
                                                      String c_p=request.getParameter("n1");
                                                      if(request.getParameter("submit")!=null)
                                                      {
                                                          String q="SELECT  * FROM `login` WHERE `log_id`='"+lo_id+"' and`password`='"+c_p+"'";
                                                          rs=obj.getDetails(q);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                       String query1="UPDATE `login` SET `password`='"+request.getParameter("n2")+"' WHERE `log_id`='"+lo_id+"'";
            obj.InsertUpdate(query1);
           
  if(rs.getString("role").matches("admin"))
  {
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Updated');");
       out.println("window.location.href ='adminhome.jsp';");
       out.println("</script>");
            }
  else  if(rs.getString("role").matches("user"))
  {
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Updated');");
       out.println("window.location.href ='user_home.jsp';");
       out.println("</script>");
            }
  else  if(rs.getString("role").matches("analyzer"))
  {
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Updated');");
       out.println("window.location.href ='analyzer_home.jsp';");
       out.println("</script>");
            }
                                                  else  if(rs.getString("role").matches("guide"))
  {
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Updated');");
       out.println("window.location.href ='guide_home.jsp';");
       out.println("</script>");
            }}
                                                   
                                            }
                                             else
                                             {
                                                 
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Your current password is incorrect Please Try Again');");
       out.println("window.location.href ='home.jsp';");
       out.println("</script>");
                                             }
                                                      }
                                                     
                                                      
                                    %>
                            </form>
                        </div>	
                    </div>
                </div>
            </div> 
 </div>
      <script>
function pasmatch(){
var a=document.getElementById("match1").value;
var b=document.getElementById("match2").value;
if(a==b){
return true;
}
else{
alert("Password Mismatch");
return false;

}
}    

</script>                   
    
</html>
