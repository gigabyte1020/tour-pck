<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="user_head.jsp"/>
 <!--Home page style-->
  
 <section id="contact">

     <%--  <div id="map"></div>--%>
 <div class="container">
            <div class="container text-center">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-12 col-xs-12">
                        <div class="contact-form-area">
                            <form>
                                <br><br>
                                                                <table align="center" >
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 130px;color:#14a0da;" >
                                                                  Registration
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                
                                <br><br>
                                
                               

                                <div class="form-group">
                                    <input type="email" name="n2" class="form-control" placeholder="Your Email" required="">
                                </div>

                                <div class="form-group">
                                    <input type="text" name="n3" pattern="[0-9]{10}" onkeypress="return isNumberKey(event)" class="form-control" placeholder="Contact No" required="">
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" name="n4" rows="7" placeholder="Address" required=""></textarea>
                                </div>
                                
                                <%--   <div class="form-group">
                                    <input type="password" name="n7" class="form-control" placeholder="Confirm Password">
</div>--%>

                               <div class="form-group">
                                    <input type="submit" name="submit" value="Submit">
                                </div>
                                <%
                                    ConnectionCls obj=new ConnectionCls();
                                     String us_id=session.getAttribute("l_id").toString();
                                                      ResultSet rs;
                                                      if(request.getParameter("submit")!=null)
                                                      { 
                                                 
                                 String query="UPDATE `register` SET `add`='"+request.getParameter("n4")+"',`phno`='"+request.getParameter("n3")+"',`email`='"+request.getParameter("n2")+"' Where `log_id`='"+us_id+"'";
  obj.InsertUpdate(query);
  
             out.println("<script type=\"text/javascript\">");
      out.println("alert('Updated Sucessfully');");
     out.println("window.location.href ='user_home.jsp';");
     out.println("</script>");
            }
                                             
                                                      
%>
                            </form>
                         
                        </div>	
                    </div>
                </div>
            </div> 
 </div>
                            <!-- /container -->       
        </section>
                                      
<script language=Javascript>

function isNumberKey(evt)

{
  
var charCode = (evt.which) ? evt.which : event.keyCode;

if (charCode == 45||charCode == 47)
{
return true;
}

if (charCode > 31 && (charCode < 48 || charCode > 57))
{
return false;
}
return true;
}

</script> </header>


