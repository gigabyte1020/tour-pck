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
                                                            
                                                           
                                                              <select name="t1" class="form-control" onChange="getit(this.value)"  required="">
                    <option value=""><%out.print("--select--");%></option>
                    <%
                     ConnectionCls c1=new ConnectionCls();
                     c1.getDetails("select * from states");
                     while(c1.rs.next())
                     {
                    
                    %>
                    <option value="<%=c1.rs.getString("state_id")%>"><%out.print(c1.rs.getString("state"));}%></option>
                </select> </div> <br><br><br>
              <label  class="col-sm-3"style="margin-left: 100px">District</label>
   <div class="col-sm-6" id="dt">
											<select  name="n3" class="col-sm-9" style="width:297px;"   required>
										<option value="">--select--</option>
										
										</select>
										</div>
									
									<br><br>
									
 
    <label  class="col-sm-3"style="margin-left: 100px">Location</label>
    <div class="col-sm-6"><input type="text" name="t2" class="form-control" required=""/></div><br><br><br><br>
    <div class="col-sm-6" style="margin-left: 30%"><input type="submit" name="t3" value="save" /></div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
           ConnectionCls c=new ConnectionCls();
        c.InsertUpdate("INSERT INTO `location`( `s_id`, `dist_id`,`loc`) VALUES ('"+request.getParameter("t1")+"','"+request.getParameter("n3")+"','"+request.getParameter("t2")+"')");
  //out.print("INSERT INTO `location`( `s_id`, `dist_id`,`loc`) VALUES ('"+request.getParameter("t1")+"','"+request.getParameter("n3")+"','"+request.getParameter("t2")+"')");
 out.println("<script>alert('updated');location.href='adminhome.jsp';</script>");
       }
    
    %>
     </div>
</form>

            
     <script>
function getit(x)
{
var xm= new XMLHttpRequest();
	xm.onreadystatechange=function(){
		
		if(xm.readyState==4&&xm.status==200)
		{
			
			
			document.getElementById("dt").innerHTML=xm.responseText;
			//loaction to store
		}
	
	};
	
	xm.open("GET","getdist.jsp?q="+x,"true");
	xm.send();
}
</script>   


            
        