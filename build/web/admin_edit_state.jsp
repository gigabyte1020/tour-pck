<%-- 
    Document   : states
    Created on : May 23, 2019, 12:51:28 PM
    Author     : logic
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_head.jsp"/>
<script>
       function val(x)
        {
               
        //drop down 
           if(x.t1.value=="none")
            {
                document.getElementById("t1").style.display="block";
                alert("must choose an option");
                return false;
            }else 
            {
                 document.getElementById("t1").style.display="none";
            }
        }
</script>



<form method="post"  >
             
                                                   
                                                       
                             <a style="background-color:#5bc0de !important;border:none; color:#fff" class="btn btn-flat btn-lg pull-right" href="admin_view_state.jsp">List state</a><br>                             
                                       <div class="container" style="margin-top: 100px;margin-left: 300px">                       
                                                         
                                                          <label  class="col-sm-3"style="margin-left: 100px;">State</label>
                                                          <div class="col-sm-6">
                                                             <input type="text" name="t2" required=""/>
                                                            </div> <br><br><br> 
                                                          <div class="col-sm-6" style="margin-left: 300px;">
                                                         
   <input type="submit" name="t3" value="save" /></div>
                                       </div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
           ConnectionCls c=new ConnectionCls();
        c.InsertUpdate("UPDATE `states` SET `state`='"+request.getParameter("t2")+"' WHERE `state_id`='"+request.getParameter("id")+"' ");
  
  out.println("<script>alert('updated');location.href='adminhome.jsp';</script>");
       }
    
    %>
</form>

            
        


            
        