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
      <a style="background-color:#5bc0de !important;border:none; color:#fff" class="btn btn-flat btn-lg pull-right" href="admin_view_district.jsp">List District</a><br>                             
    <div class="container" style="margin-top: 10%">
 <label  class="col-sm-3"style="margin-left: 100px">State</label>
                                                          <div class="col-sm-6">
                                                            
                                                           
                                                            
                    <%
                     ConnectionCls c1=new ConnectionCls();
                     
                     c1.getDetails("select * from district where dist_id='"+request.getParameter("id")+"'");
                     if(c1.rs.next())
                     {
                     ConnectionCls c=new ConnectionCls();
                     c.getDetails("select * from states where state_id='"+c1.rs.getString("state_id")+"'");
                     if(c.rs.next())
                     {
                    %>
                    <input type="text" name="t1" class="form-control" readonly="" value="<%=c.rs.getString("state")%>"/></div> <br><br><br>
 <%
}
 %>   
 <label  class="col-sm-3"style="margin-left: 100px">District</label>
    <div class="col-sm-6"><input type="text" name="t2" class="form-control" required=""/></div><br><br><br><br>
    <div class="col-sm-6" style="margin-left: 30%"><input type="submit" name="t3" value="save" /></div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
          
        c.InsertUpdate("UPDATE `district` SET district='"+request.getParameter("t2")+"' WHERE `dist_id`='"+request.getParameter("id")+"'");
  
  out.println("<script>alert('updated');location.href='adminhome.jsp';</script>");
       }
    }
    
    %>
     </div>
</form>

            
        


            
        