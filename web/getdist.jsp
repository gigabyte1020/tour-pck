



<%@page import="dbConnection.ConnectionCls"%>
<select name="n3" style="width: 520px;height: 30px " onChange="getlc(this.value)"><option value="none">-select-</option>
            <%
          ConnectionCls c= new  ConnectionCls();
            c.getDetails("select * from district where state_id='"+request.getParameter("q")+"'");
            
            while(c.rs.next()){
            %>
            <option value="<%=c.rs.getString(1)%>"><%=c.rs.getString(3)%></option>
                <%
            }
            %>
            
            </select>
