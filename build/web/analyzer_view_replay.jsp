<%-- 
    Document   : admin_head
    Created on : Mar 13, 2019, 8:58:49 AM
    Author     : user
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="analyzer_head.jsp"/>
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
                                                                      <a style="background-color:#5bc0de !important;border:none; color:#fff;margin-top: 20px;" class="btn btn-flat btn-lg pull-right" href="analyzer_add_complaint.jsp#active">New Complaint </a><br><br><br><br>	
                                                                <tr>
                                                            <td colspan="2" align="center">
                                                                
                                                                
                                                                <h1 style="margin-top: 10px;color:#14a0da;" >
                                                                  View Reply
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                           </table>        
                                                           <br><br>
                                                           
                                                           
           <table class="table table-striped table-bordered" id="ii" align="center" border="1" style="width:95%;text-align: center;font-family: sans-serif;font-size: medium">
                                                        <thead>
                                                        <tr>
                                                       <th>Complaint Title</th>
                                                        <th>Complaint</th>
                                                        <th>Registered Date</th>
                                                        <th>Reply</th>
<%-- <td><font color="BLUE"> Reject</td>--%>
                                                        </tr>
                                                        </thead>
                                                        
                                                            <%
                                                                ConnectionCls obj=new ConnectionCls();
        String v=null;
        String ui=session.getAttribute("l_id").toString();
                                             ResultSet rs,rs1,rs2;
                                             
                                            
                                                 
                                                     String qry="SELECT * FROM `complaint` WHERE  `log_id`='"+ui+"' ";
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
                                                             out.println(rs1.getString("c_title"));
                                                             %>
                                                            </td>
                                                             
                                                             
                                                            
                                                            <td>
                                                               <%//`replay`````
                                                             out.println(rs1.getString("c_msg"));
                                                             %>
                                                            </td>
                                                             <td>
                                                               <%
                                                             out.println(rs1.getString("date"));
                                                             %>
                                                            </td>
                                                            <td>
                                                            <%
                                                             if(rs1.getString("creplay").matches("null"))
                                                             {
                                                                 out.print("Waiting");
                                                             }
                                                             else
                                                             {
                                                            %>
                                                            
                                                                <%//``````
                                                             out.println(rs1.getString("creplay"));
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

