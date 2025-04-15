<%@page import="dto.Vendor"%>
<%@page import="java.util.List"%>
<%@page import="dto.Staff"%>
<%@page import="dto.Customer"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OrderForm</title>
</head>
<body>
<%
Staff staff=(Staff)session.getAttribute("staff");

int pid=Integer.parseInt(request.getParameter("id")); 
MyDao dao=new MyDao();
Customer customer=dao.fetchCustomer(pid);
if(customer==null)
{
	response.getWriter().print("<h1 style='color:red'>Enter proper Customer Id</h1>");
	request.getRequestDispatcher("FetchById.html").include(request, response);
}
else{
List<Vendor> list=dao.fetchAvailableVendors();
if(list.isEmpty())
{
	response.getWriter().print("<h1 style='color:red'>No Vendors are Available</h1>");
	request.getRequestDispatcher("StaffHome.html").include(request, response);
}
else{
%>
<form action="bookorder" method="post">
Customer Id: <input type="text" name="pid" value="<%=pid%>" readonly="readonly"><br>
Customer Name: <input type="text" name="pname" value="<%=customer.getName()%>" readonly="readonly"><br>
Staff Name: <input type="text" name="staffname" value="<%=staff.getName()%>" readonly="readonly"><br>
Order Item :<input type="text" name="problem"><br>
Select Vendor:
<select name="vendor">
<%for(Vendor vendor:list){ %>
<option value="<%=vendor.getId()%>"><%=vendor.getName()%> (<%=vendor.getSpecialization()%>)</option>
<%} %>
</select>
<br>
<button>Fix Order</button><button type="reset">Cancel</button>
</form>
<%} %>
<a href="fetchallcustomer"><button>Back</button></a>
<%} %>
</body>
</html>