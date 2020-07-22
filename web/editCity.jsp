<%-- 
    Document   : editCity
    Created on : Jul 22, 2020, 1:34:23 PM
    Author     : SMARTCS
--%>
<%@page import="com.ahmedelsheikh.hibernate.dal.entity.Cities"%>
<%@page import="com.ahmedelsheikh.centerbusinesslogic.BusinessLogic"%>
<% int id = Integer.parseInt(request.getParameter("id")); 
    BusinessLogic bl = new BusinessLogic();
    Cities city = bl.getCity(id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit City</h1>
        <form action="updateCity" method="post">
            ID: <%= id %>
            <input type="hidden" name="id" value="<%= id %>"/>
            <br>
            City Name:
            <input type="text" name="name" value="<%= city.getName() %>" />
            <input type="submit" name="button" value="Save Changes"/>
        </form>
    </body>
</html>
