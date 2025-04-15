<%@page import="dto.Vendor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve vendor</title>
</head>
<body>
<% List<Vendor> list=(List<Vendor>)request.getAttribute("list"); %>
<table border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>Mobile</th>
<th>Age</th>
<th>Status</th>
<th>ChangeStatus</th>
</tr>
<%for(Vendor vendor:list){%>
<tr>
<th><%=vendor.getId()%></th>
<th><%=vendor.getName()%></th>
<th><%=vendor.getMobile()%></th>
<th><%=vendor.getAge()%></th>
<th><%=vendor.isStatus()%></th>

<th><a href="adminvendorstatus?id=<%=vendor.getId()%>"><button>Change Status</button></a></th>

</tr>
<%} %>
</table>
<br>
<a href="AdminHome.html"><button>Back</button></a>
</body>
</html>