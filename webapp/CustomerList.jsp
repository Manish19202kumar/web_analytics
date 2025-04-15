<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.util.Arrays"%>
<%@page import="dto.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer List</title>
</head>
<body>
	<%
		List<Customer> list = (List<Customer>) request.getAttribute("list");
	%> 
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Age</th>
			<th>Picture</th>
			<th>Book Order</th>
		</tr>
		<%
			for (Customer customer : list) {
		%>
		<tr>
			<th><%=customer.getId()%></th>
			<th><%=customer.getName()%></th>
			<th><%=customer.getMobile()%></th>
			<th><%=customer.getAge()%></th>
			<th>
			<%
			String base64=Base64.encodeBase64String(customer.getPicture());
			%>
			<img height="100px" width="100px" alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><a href="OrderForm.jsp?id=<%=customer.getId()%>"><button>Book Order</button></a></th>
		</tr>
		<%
			}
		%>
	</table>
	<br><br>
	<a href="BookOrder.jsp"><button>Back</button></a>
</body>
</html>