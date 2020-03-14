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
 <section class="team" id="team">
      <a name="active"></a>
			<div class="container">
                                  <div class="row" >
                  

                                      <div class="contact-caption clearfix" style="width: 75%;margin-left: 12%">
     <div class="team-heading text-center" >
							<h3 style='color: white'>Travel Arranger Sign up</h3>
</div>
                                          <form method="post">
                             <!--   <h3 style="text-align: center">Registration</h3>	-->
                             <h3></h3>
                                <div class="col-md-6 col-md-offset-3 contact-form text-left">
                                   
                                <div class="form-group">
                                    <input type="text" name="n1" class="form-control" placeholder=" Name" required="">
                                </div>
  
                                                           <div class="form-group">
                                                               <select name="n7" required="" onchange="getback2(this.value)"  style="width: 400px;height: 35px " class="form-control" placeholder="State">
                                                                    <option value=""><%out.print("---select state---");%></option>%>
                                                                   <%ConnectionCls c1=new ConnectionCls();
                     c1.getDetails("select * from states");
                     while(c1.rs.next())
                     {
                    
                    %>
                    <option value="<%=c1.rs.getString("state_id")%>"><%out.print(c1.rs.getString("state"));}%></option>%>
                                                               </select>
                                                            </div> <br><br><br>
                                                            
                                                      
                                                         <div class="form-group" id="dt" >
                                                                <select name="district" style="width: 400px;height: 35px "><option value="none">-select District-</option></select></td>
                                                               </select>
                                                            </div> <br><br><br>
                                
                                 <div class="form-group">
                                     <input type="date" name="n9" class="form-control" placeholder=" Date" required="">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="n2" class="form-control" placeholder=" Email" required="">
                                </div>

                                <div class="form-group">
                                    <input type="text" name="n33" pattern="[0-9]{10}" onkeypress="return isNumberKey(event)" class="form-control" placeholder="Contact No" required="">
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" name="n4" rows="7" placeholder="Address" required=""></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="n5" class="form-control" placeholder="User Name" required="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="n6" class="form-control" placeholder="Password" required="">
                                </div>
                                <%--   <div class="form-group">
                                    <input type="password" name="n7" class="form-control" placeholder="Confirm Password">
</div>--%>

                               <div class="form-group">
                                    <input type="submit" name="submit" value="Submit">
                                </div>
                                 <%
                                    ConnectionCls obj=new ConnectionCls();
                                                      ResultSet rs;
                                                      if(request.getParameter("submit")!=null)
                                                      {
                                                          
                                                        
                                                          String query1="INSERT INTO `login`(`user_name`, `password`, `role`,`email`) VALUES ('"+request.getParameter("n5")+"','"+request.getParameter("n6")+"','travel','"+request.getParameter("n2")+"')";
       //  out.println(query1);
                                                          obj.InsertUpdate(query1);
            String q="SELECT * FROM `login` WHERE `user_name`='"+request.getParameter("n5")+"' and `password`='"+request.getParameter("n6")+"'";
            rs=obj.getDetails(q);
         //  out.println("fdgdf");
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                          
                                                if(rs.next())
                                                 { //out.println("fdgdf1");
                                                     String uid=rs.getString("log_id");
                                                //
                                 String query="INSERT INTO `c_register`(`log_id`, `c_name`, `c_add`, `c_phno`, `c_email`, `c_status`,`about`,`date`,`ceoname`,`pic`,`role`) VALUES ('"+uid+"','"+request.getParameter("n1")+"','"+request.getParameter("n4")+"','"+request.getParameter("n33")+"','"+request.getParameter("n2")+"','null','"+request.getParameter("n7")+"','"+request.getParameter("n9")+"','"+request.getParameter("district")+"','null','travel')";
  //out.print(query);
                                 obj.InsertUpdate(query);
  
           out.println("<script >");
      out.println("alert('Successfully Registered');");
      out.println("window.location.href ='home.jsp';");
      out.println("</script>");
            }
                                             
                                                      }
                                    %>
                            
                            <div align="right" >   <a href="u_reg.jsp" style="color:red;"> Register as candidate</a>|<a href="login.jsp" style="color:red;">Already have an account</a></div>	
                                </div> 
                                  </form>
                               
      </div> 
                                    
       </div>
                                    </div>                     
       </section><script>
 function getback2(x)
            {
	       var xm= new XMLHttpRequest();
	       xm.onreadystatechange=function()
                {
		
		    if(xm.readyState==4&&xm.status==200)
		          {
                            document.getElementById("dt").innerHTML=xm.responseText;
			  }
                };
	
	       xm.open("GET","getdist.jsp?q="+x,"true");
	       xm.send();
            }
</script>
 </header>
<jsp:include page="footer.jsp"/>
