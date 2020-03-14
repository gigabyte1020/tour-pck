/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionCls 
{
     String url = "jdbc:mysql://localhost:3306/tpa";
    String driver = "com.mysql.jdbc.Driver";
   String userName = "root"; 
    String password = "";
    public Statement stmt = null;
    public  Connection conn = null;
    public ResultSet rs = null;
    
    
    public String InsertUpdate(String query)
    {
        try
        {
            Object newInstance = Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url,userName,password);
            stmt=conn.createStatement();
            int i=stmt.executeUpdate(query);
            conn.close();
            stmt.close();
            if(i==1)
            {
               
              return "Sucess";
                  
            }
            else
            {
               return "Failed";
            }
          
        }
       catch(Exception ex)
        {
           return ex.toString();
       }
    }
     public ResultSet getDetails(String query)
    {
              try
              {
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url,userName,password);
                stmt=conn.createStatement();
                rs=stmt.executeQuery(query);
              }
              catch(Exception ex)
              {
                  ex.printStackTrace();
              }
              return rs;
    }
}
