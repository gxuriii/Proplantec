<%-- 
    Document   : Plantype
    Created on : 26 Oct, 2023, 2:09:59 PM
    Author     : HP
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page import="java.sql.ResultSet"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
                if(request.getParameter("btnpla1")!=null)
                {
                    String insqry="insert into tbl_planttype(planttype_name)values('"+request.getParameter("txtenterplant")+"')";
                    con.executeCommand(insqry);
                }
                  
                
                if(request.getParameter("did")!=null)  
                {
                    String delqry="delete from tbl_planttype where planttype_id='"+request.getParameter("did")+"'";
                    con.executeCommand(delqry);
                    //out.println(delqry);
                    response.sendRedirect("Planttype.jsp");
                }
               
            
            %>   
        
        <form name="frmplant" method="post">
            <table border="2" align="center">
                <tr>
                    <td>name</td>
                    <td><input type="text" required pattern="[A-Z]||[a-z]{a,}" name="txtenterplant"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnpla1" value="save" >     
                        <input type="submit" name="btndpla2" value="cancel" >
                    </td>
                </tr>
            </table>    
                <table border="1" align="center">
                <tr>
                    <th>Sl.no</th>
                    <th>Planttype</th>
                    <th>Action</th>
                </tr>
                <%
                String selqry="select * from tbl_planttype";
                ResultSet rs=con.selectCommand(selqry);
                int i=0;
                while (rs.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("planttype_name")%></td>
                        <td><a href="Planttype.jsp?did=<%=rs.getString("planttype_id")%>">Delete</a>
                        |<a href="Planttype.jsp?eid=<%=rs.getString("Planttype_id")%>">Edit</a></td>
                    </tr>
                    <%
                    
                }
                    %>
        </form>        
         
    </body>
</html>
