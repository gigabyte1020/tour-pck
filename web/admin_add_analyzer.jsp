<%-- 
    Document   : user_update
    Created on : Mar 13, 2019, 4:29:49 PM
    Author     : user
--%>





<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="admin_head.jsp"/>



<a name="active"></a>
  <a style="background-color:#5bc0de !important;border:none; color:#fff" class="btn btn-flat btn-lg pull-right" href="admin_view_analyzer.jsp">List Analyzer</a><br>
       <div class="container">
            
				<div class="row">
                                     <table align="center" >
                                                            <br><br>    <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 130px;color:#14a0da;" >
                                                                 Add Analyzer
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>    
                                </div>
                          
           <form method="post" onsubmit="return valid(this)"   class="form-horizontal"> 
                                             <br><br>
                                                           
                                                    <table align="center"  style="width:95%;">
                                                       
                                                          
                                                             
                                                         
                                                          <label  class="col-sm-3"style="margin-left: 100px">Name</label>
                                                          <div class="col-sm-6">
                                                              <input type="text" name="n1" class="form-control" required=""/>
                                                            </div> <br><br><br>
                                                         
                                                           <label class="col-sm-3" style="margin-left: 100px">State</label>
                                                           <div class="col-sm-6">
                                                               <select name="n2" required="" onchange="getback2(this.value)" style="width: 520px;height: 30px ">
                                                                    <option value=""><%out.print("---select---");%></option>%>
                                                                   <%ConnectionCls c1=new ConnectionCls();
                     c1.getDetails("select * from states");
                     while(c1.rs.next())
                     {
                    
                    %>
                    <option value="<%=c1.rs.getString("state_id")%>"><%out.print(c1.rs.getString("state"));}%></option>%>
                                                               </select>
                                                            </div> <br><br><br>
                                                            
                                                         <label class="col-sm-3" style="margin-left: 100px">District</label>
                                                         <div class="col-sm-6" id="dt" >
                                                                <select name="n3" style="width: 520px;height: 30px "><option value="none">-select-</option></select></td>
                                                               </select>
                                                            </div> <br><br><br>
                                                            
                                                              
                                                  
                                                          <label class="col-sm-3" style="margin-left: 100px">Location</label>
                                                          <div class="col-sm-6">
                                                                 <input  type="text" name="n4" class="form-control" required=""/>
                                                          </div> <br><br><br>      
                                               
                                                          <label class="col-sm-3" style="margin-left: 100px">Contact</label>
                                                          <div class="col-sm-6">
                                                                  <input  pattern="[0-9]{10}"  onkeypress="return isNumberKey(event)" type="text" name="n5" class="form-control" required=""/>
                                                          </div> <br><br><br>        

                                                          <label class="col-sm-3" style="margin-left: 100px"> Email Id</label>
                                                          <div class="col-sm-6">
                                                                 <input  type="email" name="n6" class="form-control" required=""/>
                                                          </div> <br><br><br>
                                                           <label class="col-sm-3" style="margin-left: 100px">Username</label>
                                                          <div class="col-sm-6">
                                                                  <input   type="text" name="n7" class="form-control" required=""/>
                                                          </div> <br><br><br>        

                                                          <label class="col-sm-3" style="margin-left: 100px">Password</label>
                                                          <div class="col-sm-6">
                                                                 <input  type="password" name="n8" class="form-control" required=""/>
                                                          </div> <br><br><br>

                                                        <%--<tr>
                                                            <td>
                                                                <font color="BLUE">Date
                                                            </td>
                                                            <td>
                                                                <input type="date"  name="n23" required>
                                                            </td>
                                                        </tr>
                                                        --%>
                                                        <tr >

                                                            <td colspan="2" width="130px" ><center>
                                                            <input type="submit" name="submit" value="submit" /></center>
                                                            </td>
                                                        </tr>
                                                         <%
                                    ConnectionCls obj=new ConnectionCls();
                                                      ResultSet rs;
                                                      if(request.getParameter("submit")!=null)
                                                      { 
                                                     
                                                     
                                                          String query1="INSERT INTO `login`(`user_name`, `password`, `role`,`email`) VALUES ('"+request.getParameter("n7")+"','"+request.getParameter("n8")+"','analyzer','"+request.getParameter("n6")+"')";
            obj.InsertUpdate(query1);
            String q="SELECT * FROM `login` WHERE `user_name`='"+request.getParameter("n7")+"' and `password`='"+request.getParameter("n8")+"'";
            rs=obj.getDetails(q);
           
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                     String uid=rs.getString("log_id");
                                              
            String query="INSERT INTO `analyzer`( `log_id`, `s_id`, `d_id`, `loc`, `a_name`, `a_no`, `a_email`) VALUES ('"+uid+"','"+request.getParameter("n2")+"','"+request.getParameter("n3")+"','"+request.getParameter("n4")+"','"+request.getParameter("n1")+"','"+request.getParameter("n5")+"','"+request.getParameter("n6")+"')";
  obj.InsertUpdate(query);
  //out.print(query);
             out.println("<script type=\"text/javascript\">");
       out.println("alert('Successfully Registered');");
       out.println("window.location.href ='adminhome.jsp';");
       out.println("</script>");
            }
                                             }
                                                      }
             
                      
                                    %>
                                   
                      
                                                          </table>
                                                     
                                                        
                                                 
                                                 
                                                    </form>
                                         
       
                                                                                                                       
                                         
                                            
                                                  
                                                        <br>    <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>       
					
				</div>
                                   

    </body>
    <script>
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
  <jsp:include page="footer.jsp"/>
</html>
