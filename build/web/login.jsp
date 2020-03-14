<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
 <!--Home page style-->
 
 <!-- Sections -->
  <section class="team" id="team">
      <a name="active"></a>
				<div class="container">
                                    <div class="row" >
                  
<div class="col-sm-4 col-sm-offset-4">
     <div class="team-heading text-center" >
							<h2>Login</h2>
</div>
    <form method="post">
                               	<br><br>
                                <div class="form-group">
                                    <input type="text" name="n1" class="form-control" placeholder="User Name" required="">
                                </div>
                                <br>
                                <div class="form-group">
                                    <input type="password" name="n2" class="form-control" placeholder="Password" required="">
                                </div>
                                <br>
                                <div class="form-group">

                                <input type="submit" style=" margin-left:150px;margin-top: -5%;width: 18%"  name="submit" value="Login" >
                                </div>
                                <%
                                    ConnectionCls obj=new ConnectionCls();
                                                      ResultSet rs,rs1,rss,rss1,rs11;
                                                      if(request.getParameter("submit")!=null)
                                                      {
                                                         
                                 String query="SELECT * FROM `login` WHERE `user_name`='"+request.getParameter("n1")+"'  and `password`='"+request.getParameter("n2")+"'";
                                            // out.println(query);
                                
                                 rs=obj.getDetails(query);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(rs.next())
                                                 {//out.println("hdgh"); 
                                                     session.setAttribute("l_id",rs.getString("log_id"));
                                                if(rs.getString("role").equals("user"))
                                                {
                                                      
                                                     
                                                      session.setAttribute("u_eid",rs.getString("email"));
                                                      String q="SELECT * FROM `register` WHERE  `log_id`='"+rs.getString("log_id")+"' and `user_status`='Approved'";
                                                      rss=obj.getDetails(q);
                                                   rss.first();
                                             int counts=rss.getRow();
                                             rss.beforeFirst();
                                             if(rss.next())
                                                 {
                                                      session.setAttribute("ul_id",rss.getString("user_id"));
                                                      session.setAttribute("u_name",rss.getString("name"));
                                                        session.setAttribute("role","user");
                                                      response.sendRedirect("user_home.jsp");
                                                   }else{
                                              out.println("<script>alert('request has been waiting for approval');</script>");
                                                 
                                             }
                                             
                                                 }else if(rs.getString("role").equals("guide"))
                                                {
                                                  //session.setAttribute("l_id",rs.getString("log_id"));
                                                      session.setAttribute("c_name",rs.getString("user_name"));
                                                      session.setAttribute("uc_eid",rs.getString("email"));
                                                       String q1="SELECT * FROM `c_register` WHERE `c_status`='Approved' and `log_id`='"+rs.getString("log_id")+"'";
                                                        rss1=obj.getDetails(q1);
                                                   rss1.first();
                                             int counts1=rss1.getRow();
                                             rss1.beforeFirst();
                                             if(rss1.next())
                                                 {
                                                      session.setAttribute("role","guide");
                                                      response.sendRedirect("guide_home.jsp");
                                                   }else{
                                              out.println("<script>alert('request has been waiting for approval');</script>");
                                                 
                                             }
                                             
                                                 
                                                
                                                }
                                                 else if(rs.getString("role").equals("travel"))
                                                {
                                                  //session.setAttribute("l_id",rs.getString("log_id"));
                                                      session.setAttribute("c_name",rs.getString("user_name"));
                                                      session.setAttribute("uc_eid",rs.getString("email"));
                                                       String q1="SELECT * FROM `c_register` WHERE `c_status`='Approved' and `log_id`='"+rs.getString("log_id")+"'";
                                                        rss1=obj.getDetails(q1);
                                                   rss1.first();
                                             int counts1=rss1.getRow();
                                             rss1.beforeFirst();
                                             if(rss1.next())
                                                 {
                                                      session.setAttribute("role","travel");
                                                      response.sendRedirect("traveler_home.jsp");
                                                   }else{
                                              out.println("<script>alert('request has been waiting for approval');</script>");
                                                 
                                             }
                                             
                                                 
                                                
                                                }
                                                 else if(rs.getString("role").equals("analyzer"))
                                                {
                                                 // session.setAttribute("l_id",rs.getString("log_id"));
                                                      session.setAttribute("an_name",rs.getString("user_name"));
                                                      session.setAttribute("an_eid",rs.getString("email"));
                                                       
                                                      session.setAttribute("role","analyzer");
                                                      response.sendRedirect("analyzer_home.jsp");
                                                
                                             
                                                 
                                                
                                                }
                                                 
                                                 else if(rs.getString("role").equals("admin"))
                                                {
                                             
                                               
                     
                         session.setAttribute("role","admin");
                           response.sendRedirect("adminhome.jsp");
                    }}else{
                                                 
                                                 out.println("<script>alert('invalid username or password');</script>");
                                                 }
                                             }
                                             
                                             
                                            
                                             
                                             
                                                 
                                                    
                                                      
                                             
                                                      
                                
                                    %>
                            </form>
                            <div align="right" ><a href="u_reg.jsp" style="color:red;"> Create your account here.</a></div>
</div> </div>
                                </div>
                            <div style="margin-bottom: 8%"></div>
       </section>
        
<jsp:include page="footer.jsp"/>

