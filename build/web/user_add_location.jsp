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
          <label  class="col-sm-3"style="margin-left: 100px">State</label>
    <div class="col-sm-6">
                                                               <select name="n1" required="" onchange="getback2(this.value)"  style="width: 525px;height: 35px " class="form-control" placeholder="State">
                                                                    <option value=""><%out.print("---select state---");%></option>%>
                                                                   <%ConnectionCls c1=new ConnectionCls();
                     c1.getDetails("select * from states");
                     while(c1.rs.next())
                     {
                    
                    %>
                    <option value="<%=c1.rs.getString("state_id")%>"><%out.print(c1.rs.getString("state"));}%></option>%>
                                                               </select>
                                                            </div> <br><br><br>
                                                            
                                                  <label  class="col-sm-3"style="margin-left: 100px">District</label>     
                                                         <div class="col-sm-6" id="dt" >
                                                                <select name="n3" style="width:525px;height: 35px "><option value="none">-select District-</option></select></td>
                                                               </select>
                                                            </div> <br><br><br>
                                
   
 <label  class="col-sm-3"style="margin-left: 100px">Location</label>
                                                           <div class="col-sm-6"><input type="text" name="t1" class="form-control" required=""/></div><br><br><br><br>
    <label  class="col-sm-3"style="margin-left: 100px">Description</label>
    <div class="col-sm-6"><textarea name="t2" class="form-control" required=""></textarea></div><br><br><br><br>
    <div class="col-sm-6" style="margin-left: 30%"><input type="submit" name="t3" value="save" /></div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
           ConnectionCls c=new ConnectionCls();
        c.InsertUpdate("INSERT INTO `locationmapper`( s_id,dist_id,log_id,`location`, `des`,`date`,stat) VALUES ('"+request.getParameter("n1")+"','"+request.getParameter("n3")+"','"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"',curdate(),'waiting')");
  //out.print("INSERT INTO `locationmapper`( s_id,dist_id,log_id,`location`, `des`,`date`) VALUES ('"+request.getParameter("n1")+"','"+request.getParameter("n3")+"','"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"',curdate())");
   //out.print("insert into location(s_id,dist_id,loc)values('"+request.getParameter("n1")+"','"+request.getParameter("n3")+"','"+request.getParameter("t1")+"')");
out.println("<script>alert('Added');location.href='user_home.jsp';</script>");
       }
    
    %>
     </div>
</form>
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
            
        


            
        