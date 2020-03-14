<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="guidehead.jsp"/>
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
                                                                      
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 10px;color:#14a0da;" >
                                                                  View User Request
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                           <br><br>
                                                           
                                                           
           <table class="table table-striped table-bordered" id="ii" align="center" border="1" style="width:95%;text-align: center;font-family: sans-serif;font-size: medium">
                                                        <thead>
                                                        <tr>
                                                       <th>Package Name</th>
                                                        <th>Date From</th>
                                                        <th>Date To</th>
                                                        
                                                        <th>Action</th>
<%-- <td><font color="BLUE"> Reject</td>--%>
                                                        </tr>
                                                        </thead>
                                                        
                                                            <%
                                                                ConnectionCls obj=new ConnectionCls();
        String v=null;
        String ui=session.getAttribute("l_id").toString();
                                             ResultSet rs,rs1,rs2;
                                             
                                            
                                                 
                                                     String qry="SELECT * FROM `user_request` inner join request on user_request.g_id=request.g_id where request.status='Approved' and request.g_id='"+session.getAttribute("l_id")+"'";
//out.print(qry);
                                                     rs1=obj.getDetails(qry);

                                                   rs1.first();
                                             int count1=rs1.getRow();
                                             rs1.beforeFirst();
                                            
                                             if(count1>0)
                                             {
                                                 while(rs1.next())
                                                 {
                                                    
                                                     %>
                                                     
                                                      <tr>
                                                     
                                                     <td>
                                                         <% 
                                                             ConnectionCls v1=new ConnectionCls();
                                                             v1.getDetails("select * from package where pack_id='"+rs1.getString("pack_id")+"'");
                                                             if(v1.rs.next())
                                                             {
                                                                 out.println(v1.rs.getString("title"));
                                                             }
                                                             
                                                             %>
                                                            </td>
                                                             
                                                             
                                                            
                                                            <td>
                                                                <%out.println(rs1.getString("from"));%>
                                                            </td>
                                                             <td>
                                                               <%out.println(rs1.getString("to"));%>
                                                            </td>
                                                           
                                                            <td>
                                                            <%
                                                             if(rs1.getString("status").matches("Approved"))
                                                             {
                                                                 out.print("Approved");
                                                             }
                                                             else  if(rs1.getString("status").matches("Rejected"))
                                                             {
                                                                 out.print("Rejected");
                                                             }
                                                             else if(rs1.getString("status").matches("null"))
                                                             {
                                                            %>
                                                            <a href="guidereqapprove.jsp?id=<%=rs1.getString("u_req_id")%>">Approve</a>
                                                                
                                                                <%//``````
                                                            
                                                             }
else
{
 out.print("GuideApproved");
}
                                                             %>
                                                            </td>
                                                     
                                                     
                                                     
                                                     
                                                     <%
                                                         

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

