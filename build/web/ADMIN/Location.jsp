<%-- 
    Document   : newjsp
    Created on : 26 Oct, 2023, 12:27:32 PM
    Author     : HP
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page import="java.sql.ResultSet"%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location</title>
    </head>
    <body>
            <% 
                if(request.getParameter("btnloc1")!=null)
                {
                    if(request.getParameter("txtid").equals(""))
                    {
                    String insqry="insert into tbl_location(location_name)values('"+request.getParameter("txtenterlocation")+"')";
                    con.executeCommand(insqry);
                    }
                    else
                    {
                        String upqry="update tbl_location set location_name='"+request.getParameter("txtenterlocation")+"'where location_id='"+request.getParameter("txtid")+"'";
                        con.executeCommand(upqry);
                        response.sendRedirect("Location.jsp");
                    }
                }
                if(request.getParameter("did")!=null)  
                {
                    String delqry="delete from tbl_location where location_id='"+request.getParameter("did")+"'";
                    con.executeCommand(delqry);
                    //out.println(delqry);
                    response.sendRedirect("Location.jsp");
                }
            
                String editid="";
                String editname="";
                if(request.getParameter("eid")!=null)
                {
                    String selqry1="select * from tbl_location where location_id ='"+request.getParameter("eid")+"'";
                    ResultSet rs1=con.selectCommand(selqry1);
                    rs1.next();
                    editid=rs1.getString("location_id");
                    editname=rs1.getString("location_name");
                }
               
            %>
                <form name="frmloc" method="post">
            <table border="2" align="center">
                <tr>    
                    <td>name</td>
                    <td><input type="text"  value="<%=editname%>" required pattern="[A-Z]||[a-z]{a,}" name="txtenterlocation">
                    <input type="text" name="txtid" value="<%=editid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnloc1" value="save" >     
                        <input type="submit" name="btnloc2" value="cancel" >
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Sl.no</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr>
                <%
                String selqry="select * from tbl_location";
                ResultSet rs=con.selectCommand(selqry);
                int i=0;
                while (rs.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("location_name")%></td>
                        <td><a href="Location.jsp?did=<%=rs.getString("location_id")%>">Delete</a>
                        |<a href="Location.jsp?eid=<%=rs.getString("location_id")%>">Edit</a></td>
                    </tr>
                    <%
                    
                }
                    %>
            </table>
        </form>        
         
    </body>
</html>
