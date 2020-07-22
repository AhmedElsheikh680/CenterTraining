<%-- 
    Document   : cities
    Created on : Jul 22, 2020, 10:57:30 AM
    Author     : SMARTCS
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ahmedelsheikh.hibernate.dal.entity.Cities"%>
<%@page import="java.util.List"%>
<%@page import="com.ahmedelsheikh.centerbusinesslogic.BusinessLogic"%>
<% 
    List<Cities> cities;
    try{
        BusinessLogic bl = new BusinessLogic();
        cities = bl.getAllCities();
        
    }catch(Exception e){
        cities=new ArrayList<>();
        out.println(e.getMessage());
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>All Cities</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td colspan="2">Actions</td>
            </tr>
            <% for(Cities c: cities){ %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getName() %></td>
                <td><a href="editCity.jsp?id=<%= c.getId() %>">Edit</a></td>
                <td></td>
                <td><a href="deleteCity?id=<%= c.getId() %>"> - Delete</a></td>
            </tr>
            <% } %>
        </table>
        <a href="newCity.html">Add New City</a>
    </body>
</html>
