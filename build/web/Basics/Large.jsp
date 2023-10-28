<%-- 
    Document   : Large
    Created on : 20 Oct, 2023, 1:07:59 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int num1=0,num2=0,largest=0;
            if(request.getParameter("btnsubmit")!=null)
            {
                num1=Integer.parseInt(request.getParameter("txtenterno1"));
                num2=Integer.parseInt(request.getParameter("txtenterno"));
                if(num1>num2)
                    largest=num1;
                else
                    largest=num2;
            }
        %>   
        <form name="frmlargest" method="post">
            <table border="2">
                <tr>
                    <td>enter number1</td>
                    <td><input type="text" required pattern="[0-9]{1,}" name="txtenterno1"></td>
                </tr>
                <tr>
                    <td>enter number2</td>
                    <td><input type="text" required pattern="[0-9]{1,}" name="txtenterno2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="largest"></td>
                    
                </tr>
                <tr>
                 <td><%=largest%></td>
                    
                </tr>
            </table></form>
    </body>
</html>
