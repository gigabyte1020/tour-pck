<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>


<%@page import="java.util.*"%>
<%//@page import="org.apache.commons.fileupload.FileItem"%>
<%//@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%//@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:include page="header.jsp"/>

<a name="active"></a>

  <section class="team" id="team">
      
      <div class="container" style="margin-left: 25%">
                              <div class="row ">
                                        

    <div class="contact-caption clearfix">
     <div class="team-heading text-center" >
         <h2 style="color: white">User sign up</h2>
     </div>
        
        <form method="post" style="font-family: sans-serif">
    <div class="col-md-5 col-md-offset-1 contact-form text-left">
        
           <div class="form-group ">
                                    <input type="text" name="n1" class="form-control " placeholder="First Name" required="">
                                </div>
        
         <div class="form-group">
                                    <input type="text" name="n3" pattern="[0-9]{10}" onkeypress="return isNumberKey(event)" class="form-control" placeholder="Contact No" required="">
                                </div>
               <div class="form-group">
                                    <input type="text" name="n7" class="form-control" placeholder="Father's Name" required="">
                                </div>    <div class="form-group">
                                    <input type="text" name="n9" class="form-control" placeholder="Caste" required="">
                                </div>
          <div class="form-group">
                                    <input type="date" name="n13" class="form-control" placeholder="Date of Birth" required="">
                                </div>
                                  <div class="form-group">
                                    <textarea name="n4" class="form-control" rows="7" placeholder="Permentant Address" required=""></textarea>
                                </div>
                                 <div class="form-group">
                                    <input type="text" name="n5" class="form-control" placeholder="User Name" required="">
                                </div>
    </div>     
    <div class="col-md-5  contact-form">      	
                             
                                 <div class="form-group">
                                    <input type="text" name="n0" class="form-control" placeholder="Last Name" required="">
                                </div>
                              
                                <div class="form-group">
                                    <input type="email" name="n2" class="form-control" placeholder="Your Email" required="">
                                </div>

                               
                          
                                 <div class="form-group">
                                    <input type="text" name="n8" class="form-control" placeholder="Mother's Name" required="">
                                </div>
                             
                                 <div class="form-group">
                                    <input type="text" name="n10" class="form-control" placeholder="Religion" required="">
                                </div>
                                 <div class="form-group">
                                    <input type="text" name="n11" class="form-control" placeholder="Nationality" required="">
                                </div>
                               
                                <div class="form-group">
                                    <textarea class="form-control" name="n12" rows="7" placeholder="Temporary Address" required=""></textarea>
                                </div>
                               
                                <div class="form-group">
                                    <input type="password" name="n6" class="form-control" placeholder="Password" required="">
                                </div></div>
    <div class=" col-md-10 col-md-offset-1 contact-form " style="" >
                                    <input type="submit" name="submit" value="Submit">
                                </div>
     <div class=" col-md-10 col-md-offset-1 contact-form " style="" >
                                    <div align="right" >   <a href="g_reg.jsp" style="color:red;">Register as Travel Arranger</a>|<a href="login.jsp" style="color:red;">Already have an account!</a></div>	
                                
                                </div>
                                <%--    <div class="form-group">
                                    
  <input type="file" placeholder="Choose File" enctype="multipart/form-data" class="form-control"  name="upfile" />
</div>
                                --%>
                                 
                                
                                 <%
                                    ConnectionCls obj=new ConnectionCls();
                                                      ResultSet rs;
                                                      if(request.getParameter("submit")!=null)
                                                      { 
                                                     
                                                     
                                                          String query1="INSERT INTO `login`(`user_name`, `password`, `role`,`email`) VALUES ('"+request.getParameter("n5")+"','"+request.getParameter("n6")+"','user','"+request.getParameter("n2")+"')";
            obj.InsertUpdate(query1);
            String q="SELECT * FROM `login` WHERE `user_name`='"+request.getParameter("n5")+"' and `password`='"+request.getParameter("n6")+"'";
            rs=obj.getDetails(q);
           
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                     String uid=rs.getString("log_id");
                                              
            String query="INSERT INTO `register`( `name`, `add`, `phno`, `email`,`user_status`,`log_id`,`l_name`,`f_name`,`m_name`,`caste`,`religion`,`nation`,`tem_addr`,`dob`,`image`) VALUES ('"+request.getParameter("n1")+"','"+request.getParameter("n4")+"','"+request.getParameter("n3")+"','"+request.getParameter("n2")+"','0','"+uid+"','"+request.getParameter("n0")+"','"+request.getParameter("n7")+"','"+request.getParameter("n8")+"','"+request.getParameter("n9")+"','"+request.getParameter("n10")+"','"+request.getParameter("n11")+"','"+request.getParameter("n12")+"','"+request.getParameter("n13")+"','null')";
  obj.InsertUpdate(query);
  
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Registered');");
       out.println("window.location.href ='home.jsp';");
       out.println("</script>");
            }
                                             }
                                                      }
             
                      
                                    %>
                                   
                      
                        </form>
    </div></div>
                                </div>
       </section>
<jsp:include page="footer.jsp"/>

