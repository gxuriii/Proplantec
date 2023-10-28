<%-- 
    Document   : Categoryname
    Created on : 26 Oct, 2023, 2:14:00 PM
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
                if(request.getParameter("btncat1")!=null)
                {
                    //out.println("Hai");
                    String insqry="insert into tbl_category(category_name)values('"+request.getParameter("txtentercat")+"')";
                    //out.println(insqry);
                    con.executeCommand(insqry);
                }
                
                if(request.getParameter("did")!=null)  
                {
                    String delqry="delete from tbl_category where category_id='"+request.getParameter("did")+"'";
                    con.executeCommand(delqry);
                    //out.println(delqry);
                    response.sendRedirect("Categoryname.jsp");
                }
                      
            
            %>   
        
        <form name="frmcat" method="post">
            <table border="2" align="center">
                <tr>
                    <td>Category name</td>
                    <td><input type="text" required pattern="[A-Z]||[a-z]{a,}" name="txtentercat"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btncat1" value="save" >     
                        <input type="submit" name="btncat2" value="cancel" >
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Sl.no</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
                <%
                String selqry="select * from tbl_category";
                ResultSet rs=con.selectCommand(selqry);
                int i=0;
                while (rs.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("category_name")%></td>
                        <td><a href="Categoryname.jsp?did=<%=rs.getString("category_id")%>">Delete</a>
                        |<a href="Category.jsp?eid=<%=rs.getString("category_id")%>">Edit</a></td>
                    </tr>
                    <%
                    
                }
                    %>
            </table>
        </form>  
    
         
    </body>
</html>
