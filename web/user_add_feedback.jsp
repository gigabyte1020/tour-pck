<%-- 
    Document   : states
    Created on : May 23, 2019, 12:51:28 PM
    Author     : logic
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="user_head.jsp"/>
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
   
    <div class="container" style="margin-top: 10%">
 <label  class="col-sm-3"style="margin-left: 100px">Title</label>
                                                           <div class="col-sm-6"><input type="text" name="t1" class="form-control" required=""/></div><br><br><br><br>
    <label  class="col-sm-3"style="margin-left: 100px">Message</label>
    <div class="col-sm-6"><input type="text" name="t2" class="form-control" required=""/></div><br><br><br><br>
    <div class="col-sm-6" style="margin-left: 30%"><input type="submit" name="t3" value="save" /></div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
           ConnectionCls c=new ConnectionCls();
        c.InsertUpdate("INSERT INTO `feedback`( log_id,`title`, `msg`,`date`) VALUES ('"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"',curdate())");
 // out.print("INSERT INTO `feedback`( log_id,`title`, `msg`,`date`) VALUES ('"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"',CURDATE())");
  out.println("<script>alert('Added');location.href='user_home.jsp';</script>");
       }
    
    %>
     </div>
</form>

            
        


            
        