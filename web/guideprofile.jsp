<%@page import="java.io.File"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ConnectionCls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="guidehead.jsp"/>
<a name="active"></a>
    <body>
        <br><br><br><br><br><br><br><br><table></table>  
    <form method="post"> 
        <%
        ConnectionCls obj=new ConnectionCls();
                                             ResultSet rs,rs1;
      String tx="";
    String s=null,str;
     String us_id=session.getAttribute("l_id").toString();
    /* String path=getServletContext().getRealPath("/").replace("\\build\\web", "\\web\\images");
    String q="SELECT * FROM `register` WHERE `user_id`='"+us_id+"'";
      rs=obj.getDetails(q);
       while(rs.next()){
       tx=rs.getString("image");
    File  f=new File(tx);
s=path+"\\"+us_id+"\\"+f.getName();

       }
    if(s!=null){
       
        str=s;
        
    }
       else{
      String   gt="userp.jpg";
        File f2=new File(gt);
        str=path+"\\"+us_id+"\\"+f2.getName();
    }*/
    %>
              
                                                        
                                                        
                                                        
                                                            <%
                                                                // String us_id=session.getAttribute("ul_id").toString();
                                            //ConnectionCls obj=new ConnectionCls(); ResultSet rs;
                                      
                                           //  `name`, `add`, `phno`, `email`,`user_status`,`log_id`,`l_name`,``,``,``,``,``,``,``
                                           String qry="SELECT * FROM `c_register` WHERE `log_id`='"+us_id+"'";
                                          
                                           rs=obj.getDetails(qry);
                                                   rs.first();
                                             int count=rs.getRow();
                                             rs.beforeFirst();
                                             if(count>0)
                                             {
                                                 while(rs.next())
                                                 {
                                                    //  String s=rs.getString("c_status");
                                                            %>
                                            
                                                         
<div class="panel panel-default">                                                                                         
<div class="panel-body">
            <div class="profile__avatar">
              
            </div>
            <div class="profile__header">
              <h4>My Profile<!--<small>Administrator</small>--></h4>
             <!-- <p class="text-muted">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non nostrum odio cum repellat veniam eligendi rem cumque magnam autem delectus qui.
              </p>
              <p>
                <a href="#">bootdey.com</a>
              </p>-->
            </div>
          </div>
        </div>
                                                   
                                                 
                         
                                                                                           
<div class="panel panel-default">
          <div class="panel-heading">
          <h4 class="panel-title"> Info</h4>
          </div>
          <div class="panel-body">
            <table class="table profile__table">
              <tbody>
                <tr>
                  <th><strong> Name </strong></th>
                  <td><%=rs.getString("c_name")%></td>
                </tr>
               
                
                <tr>
                  <th><strong>E-mail</strong></th>
                  <td><%=rs.getString("c_email")%></td>
                </tr>
                <tr>
                  <th><strong>Phone No.</strong></th>
                  <td><%=rs.getString("c_phno")%></td>
                </tr>
                
                
                 
                 
                <tr>
                  <th><strong>Address</strong></th>
                  <td><%=rs.getString("c_add")%></td>
                </tr>
               
                
                
                <tr>
                    <th>Edit</th>
                    
                        <td><a href="guide_update_profile1.jsp"><span class="glyphicon glyphicon-pencil" title="Edit"></span></a></td>
                   
                </tr>
              </tbody>
            </table>
          </div>
        </div>
                                                    
                                                    <%
                                                    }
                                                    }
                                                    %>
                                            
                                                    
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               
                                                 
                                                 
                                                    </form>
                                                        <br>    <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>      <br><br><br><br> <br><br><br><br> <br><br><br><br>       
					
				</div>
    </body>
   
<</html>