<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="user_head.jsp"/>
<a name="active"></a>
<script>
    $(document).ready(function(){
        $("#ii").DataTable();   
    }); 
</script>
    <body>
        <div class="container">
				
                                   
					      
                                                
                                                       <form method="post" align="center"> 
                                                           
                                                           <br>
                                                                <table align="center" >
                                                                      <a style="background-color:#5bc0de !important;border:none; color:#fff;margin-top: 20px;" class="btn btn-flat btn-lg pull-right" href="userviewreplay.jsp#active">Packages </a><br><br><br><br>	
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 10px;color:#14a0da;" >
                                                                  View Package
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                           <br><br>
                                                           
                                                           
           <table class="table table-striped table-bordered" id="ii" align="center" border="1" style="width:95%;text-align: center;font-family: sans-serif;font-size: medium">
                                                        <thead>
                                                        <tr>
                                                       <th> Title</th>
                                                       <th> District</th>
                                                       <th> Location</th>
                                                        <th>Details</th>
                                                        <th>Guide</th>
                                                        <th>Date From</th>
                                                        <th>Date To</th>
                                                        <th>Apply</th>
<%-- <td><font color="BLUE"> Reject</td>--%>
                                                        </tr>
                                                        </thead>
                                                        
                                                            <%
                                                                ConnectionCls obj=new ConnectionCls();
        String v=null;
        String ui=session.getAttribute("l_id").toString();
                                             ResultSet rs,rs1,rs2;
                                             
                                            
                                                 
                                                     String qry="SELECT * FROM `package` inner join request on package.pack_id=request.pck_id where package.status='Approved' and request.status='Approved'  ";
rs1=obj.getDetails(qry);
                                                   rs1.first();
                                             int count1=rs1.getRow();
                                             rs1.beforeFirst();
                                            
                                             if(count1>0)
                                             {
                                                 while(rs1.next())
                                                 {
                                                    //`title``msg``d_id``s_id``l_id`
                                                     %>
                                                     
                                                      <tr>
                                                     
                                                     <td>
                                                         <% 
                                                             out.println(rs1.getString("title"));
                                                             %>
                                                            </td>
                                                             
                                                             <td>
                                                               <%
                                                                   ConnectionCls b=new ConnectionCls();
                                                                   b.getDetails("select * from district where dist_id='"+rs1.getString("d_id")+"'");
                                                            if(b.rs.next())
                                                            {
                                                                   out.println(b.rs.getString("district"));
                                                            }
                                                             %>
                                                            </td>
                                                             <td>
                                                               <%
                                                                   ConnectionCls b1=new ConnectionCls();
                                                                   b1.getDetails("select * from location where l_id='"+rs1.getString("l_id")+"'");
                                                            if(b1.rs.next())
                                                            {
                                                                   out.println(b1.rs.getString("loc"));
                                                            }
                                                             %>
                                                            </td>
                                                            
                                                            <td>
                                                               <%//`replay`````
                                                             out.println(rs1.getString("msg"));
                                                             %>
                                                            </td>
                                                            <td>
                                                                <select name="guide"><option>--select--</option>
                                                                    <%
                                                                    ConnectionCls x=new ConnectionCls();
                                                                    x.getDetails("select * from c_register where log_id='"+rs1.getString("g_id")+"'");
                                                                    while(x.rs.next())
                                                                    {
                                                                        
                                                                    
                                                                    
                                                                    %>
                                                                    <option value="<%=x.rs.getString("log_id")%>"><%out.print(x.rs.getString("c_name"));}%>  </option></select>
                                                            </td>
                                                            <td>
                                                                 <input type="date" name="from" />
                                                            </td>
                                                            <td>
                                                                 <input type="date" name="to" />
                                                            </td>
                                                            <td>
                                                                
                                                                <input type="submit" name="Add" value="Add"/>
                                                               
                                                            </td>
                                                     
                                                     
                                                     
                                                     
                                                     <%
                                                         if(request.getParameter("Add")!=null)
                                                         {
                                                             //out.print(request.getParameter("guide"));
                                                             ConnectionCls s=new ConnectionCls();
                                                             s.InsertUpdate("INSERT INTO `user_request`( `log_id`, `g_id`, `pack_id`, `status`,`from`,`to`) VALUES('"+session.getAttribute("l_id")+"','"+request.getParameter("guide")+"','"+rs1.getString("pack_id")+"','null','"+request.getParameter("from")+"','"+request.getParameter("to")+"')");
                                                       // out.print("INSERT INTO `user_request`( `log_id`, `g_id`, `pack_id`, `status`,`from`,`to`) VALUES('"+session.getAttribute("l_id")+"','"+request.getParameter("guide")+"','"+rs1.getString("pack_id")+"','null','"+request.getParameter("from")+"','"+request.getParameter("to")+"')");
                                                         }
                                                         

                                                 }
                                             }
                                               
                                                
  
            
                                                            %>
                                                        </tr></table> 
                                                
                                                         
                                            
                                                    
                                                                                
                                                        
</form>
                                                 
                                                        <br>    <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>       
					
                                             
                                        </div>
                                                   
                              
    </body>
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("select.n").change(function(){
        var selectedCountry = $(this).children("option:selected").val();
       if(selectedCountry=='comp')
       {
            $("#otherType").show()
         
       }
       else
       {
          $("#otherType").hide()  
       }
    });
});
function populateCustomerId(){
    var selectBox = document.getElementById('ni');

    /*selected value of dropdown */
    var selectedCustomerId = selectBox.options[selectBox.selectedIndex].value;

    /* selected value set to input field */
    document.getElementById('vi').value = selectedCustomerId; 
    }
</script>

