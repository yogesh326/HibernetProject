<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="beans.FormDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="hiber.CrudDAO" %>
    
<!DOCTYPE html>
<html>
	<head>
		
		<style>
            body{
                background-image: url(images/99468.jpg);
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                height: 100%;
            }
            
            form{
            	display: inline;
            }
        </style>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<meta charset="ISO-8859-1">
		<title>Fill Form</title>
		
	</head>
	<body>
		
		<div style="height: 600px; width: 500px; background-color: bisque; margin-top: 30px; margin-left: 200px" class="container">
            <h1 style="font-family: Georgia, 'Times New Roman', Times, serif;">Please Fill this Form</h1>
            <hr style="border: 2px solid black">
            <form action="Create" method="post">
                <div class="form-group">
                    <label for="uname">Username</label>           
                    <input type="text" class="form-control" pattern="[A-Za-z]{3,}" title="No Special Characters or Digits allowed" name="uname" id="uname">
                </div>

                <div class="form-group">
                    <label for="pword">Password</label>
                    <input type="password" class="form-control" name="pword" id="pword">
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" id="email">
                </div>

                <div class="form-group">
                    <label for="cnum">Contact Number</label>
                    <input type="text" class="form-control" pattern="[7-9]{1}[0-9]{9}" title="Number must be a 10 digit number and begin with 6,7,8 or 9" name="cnum" id="cnum">
                </div>
                    
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" class="form-control" name="age" id="age">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" name="gender" id="gender">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <input type="submit" class="btn btn-success" value="Submit">

            </form>
        </div>
                       																																																													<!--
        
        
        
        
        
        <div style="background-color: bisque; margin-top: 30px; margin-bottom: 30px" class="container">
            <h1 style="font-family: Georgia, 'Times New Roman', Times, serif;">Current Entries in the Database</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                      <th>Id</th>
                      <th>Username</th>
                      <th>Password</th>
                      <th>Email</th>
                      <th>Contact</th>
                      <th>Age</th>
                      <th>Gender</th>
                      <th>Operations</th>
                    </tr>
                </thead>
                <%
                CrudDAO crud = new CrudDAO(); 
                List<FormDetails> details = crud.retrieve();
                
                for(FormDetails d: details){
                %>
                <tr>
                	<td><%=d.getId() %></td>
                	<td><%=d.getUname() %></td>
                	<td><%=d.getPword() %></td>
                	<td><%=d.getEmail() %></td>
                	<td><%=d.getCnum() %></td>
                	<td><%=d.getAge() %></td>
                	<td><%=d.getGender() %></td>
                	<td>
                		<form method="post" action="Delete">
                			<input type="hidden" name="id" value="<%=d.getId() %>">
                			<input type="hidden" name="action" value="Delete">
                			<button type="submit" class="btn btn-danger">Delete</button>
                		</form>
                		<form method="post" action="Edit">
                			<input type="hidden" name="id" value="<%=d.getId() %>">
                			<input type="hidden" name="action" value="Update">
                			<button type="submit" class="btn btn-warning">Update</button>
                		</form>
                	</td>
                <%} %>
      
            </table>
        </div>-->
	</body>
</html>