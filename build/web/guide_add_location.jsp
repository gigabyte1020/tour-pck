<%-- 
    Document   : states
    Created on : May 23, 2019, 12:51:28 PM
    Author     : logic
--%>


<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="guide_head.jsp"/>
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
    <%--  <a style="background-color:#5bc0de !important;border:none; color:#fff" class="btn btn-flat btn-lg pull-right" href="guide_view_location.jsp">List Selected Location</a><br>                             
    --%> <div class="container" style="margin-top: 10%">
       <%--   <label  class="col-sm-3"style="margin-left: 100px">State</label>
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
                                                                <select name="n3" style="width:525px;height: 35px "  onChange="getlc(this.value)" class="form-control" placeholder="District"><option value="none">-select District-</option></select></td>
                                                              
                                                            </div> <br><br><br>
                                
   
<label  class="col-sm-3"style="margin-left: 100px">Location</label>     
                                                         <div class="col-sm-6" id="dl" >
                                                                <select name="n4" style="width:525px;height: 35px "  ><option value="none">-select Location-</option></select></td>
                                                              
                                                            </div> <br><br><br>
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
    
%>--%>
       <%
       ConnectionCls c1=new ConnectionCls();
                     c1.getDetails("select * from states");
                     
       %>
       <div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">State Name</label>
										<div class="col-sm-9" >
											<select  name="state" class="col-sm-9" onChange="getit(this.value)" style="width:297px;" required>
										<option value="">--select--</option>
										<%
                                                                                    while(c1.rs.next())
                                                                                    {
                                                                                %>
                                                                                <option value="<%out.print(c1.rs.getString("state_id"));%>"><%out.print(c1.rs.getString("state"));%></option>
									   <%
                                                                           }
                                                                           %>
										</select>
										</div>
                                                                        </div><br><br><br>
									
									<div class="form-group"  >
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">District</label>
										<div class="col-sm-9" id="dt">
											<select  name="district" class="col-sm-9" onChange="getlc(this.value)" style="width:297px;"   required>
										<option value="">--select--</option>
										
										</select>
										</div>
									</div>
									<br><br>
									<div class="form-group" >
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Location</label>
										<div class="col-sm-9" id="dl">
											<select  name="location" class="col-sm-9" style="width:297px;"   required>
										<option value="">--select--</option>
										
										</select>
										</div>
									</div><br><br>
                                                                       
										
										
                                                                                   
 <label  class="col-sm-3"style="margin-left: 100px">Title</label>
                                                           <div class="col-sm-6"><input type="text" name="t1" class="form-control" required=""/></div><br><br><br><br>
    <label  class="col-sm-3"style="margin-left: 100px">Descrption</label>
    <div class="col-sm-6"><input type="text" name="t2" class="form-control" required=""/></div><br><br><br><br>
    <div class="col-sm-6" style="margin-left: 30%"><input type="submit" name="t3" value="save" /></div>
    <%
     
        
       // PrintWriter out=response.getWriter();
       if(request.getParameter("t3")!=null)
       {
           ConnectionCls c=new ConnectionCls();
        c.InsertUpdate("INSERT INTO `package`( log_id,`title`, `msg`,`s_id`,`d_id`,`l_id`) VALUES ('"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"','"+request.getParameter("state")+"','"+request.getParameter("district")+"','"+request.getParameter("location")+"')");
 // out.print("INSERT INTO `package`( log_id,`title`, `msg`,`s_id`,`d_id`,`l_id`) VALUES ('"+session.getAttribute("l_id")+"','"+request.getParameter("t1")+"','"+request.getParameter("t2")+"','"+request.getParameter("state")+"','"+request.getParameter("district")+"','"+request.getParameter("location")+"')");
  out.println("<script>alert('Added');location.href='guide_home.jsp';</script>");
       }
    
    %>
     </div>
                                                                                    <%-- <a href="acco.jsp?d_id=<%=request.getParameter("district")%>&s_id=<%=request.getParameter("state")%>&l_id=<%=request.getParameter("location")%>">Add</a>
                                                                                    --%>
                                                                                    
                                                                                  
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                </div>
										</div>
									</div><br><br>
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
 <script>
function getlc(x)
{
var xm= new XMLHttpRequest();
	xm.onreadystatechange=function(){
		
		if(xm.readyState==4&&xm.status==200)
		{
			
			
			document.getElementById("dl").innerHTML=xm.responseText;
			//loaction to store
		}
	
	};
	
	xm.open("GET","getloc.jsp?l="+x,"true");
	xm.send();
}
</script>
        