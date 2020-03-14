<%@page import="dbConnection.ConnectionCls"%>
<%@page import="java.sql.ResultSet"%>

<jsp:include page="admin_head.jsp"/>
<%ConnectionCls c=new ConnectionCls();
        ResultSet rs,rs1;
        rs=c.getDetails("SELECT * FROM `feedback` ");
        //rs1=c.getDetails("SELECT * FROM `tbl_complaint`,`tbl_organizer`, `tbl_staff` WHERE tbl_complaint.complaint_login_id=tbl_organizer.org_login_id and  `tbl_staff`.staff_district=tbl_organizer.org_dis and tbl_complaint.complaint_status!='1' ");
       // rs=c.getDetails("SELECT * FROM tbl_booking INNER JOIN tbl_event ON tbl_booking.book_eventid=tbl_event.event_id INNER JOIN tbl_tickets ON tbl_tickets.t_eventid=tbl_booking.book_eventid INNER JOIN tbl_user ON tbl_user.user_login_id=tbl_booking.book_user   WHERE book_status='0'");
%>
<div class="main-content">
				<div class="main-content-inner">
					
								<div id="page-inner"> 
              <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="margin-top:50px;">
                            <h3 align="center">List Feedback</h3>
                        </div>
				<div class="col-md-12">
		 
                          </div>	
                        <div class="panel-body" id="one">
                            <div class="row">
                                <div class="col-lg-12">
										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover" style="margin-top: 10px">
												<thead>
													<tr>
														<th>Sl No</th>
														<th>User Name</th>
                                                                                                                <th>Title</th>
														<th>Message</th>
														<th>Feedback Date</th>
														
													</tr>
												</thead>

												<tbody>
                                                                                                    
                                                                                                    <%
									int i1=1;
									  while(rs.next())
 									   {
   									   %>

													<tr>
														<td><%out.println(i1++);%></td>

                                                                                                               
														<td><%
                                                                                                         ConnectionCls c1=new ConnectionCls();
                                                                                                         c1.getDetails("select * from register where log_id='"+rs.getString("log_id")+"'");
                                                                                                         if(c1.rs.next())
                                                                                                         {
                                                                                                                    
                                                                                                                    
                                                                                                                    out.println(c1.rs.getString("name"));}%></td>
                                                                                                                <td><%out.println(rs.getString("title"));%></td>
                                                                                                                 <td><%out.println(rs.getString("msg"));%></td>
                                                        <td><%out.println(rs.getString("date"));%></td>
                                                          												
													</tr>
	
						<%}%>
								
						
												</tbody>
											</table>
										</div>
									</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                     
<script type="text/javascript">
function fun2()
{
 document.form.submit();
}
 function yourfunction(radioid)
{
  if(radioid == 1)
  {    
    document.getElementById('one').style.display = '';
    document.getElementById('two').style.display = 'none';
  }
  else if(radioid == 2)
  {  
   
   document.getElementById('one').style.display = 'none';
   document.getElementById('two').style.display = '';
   document.getElementById('three').style.display = 'none';
  }
 
}
</script>
