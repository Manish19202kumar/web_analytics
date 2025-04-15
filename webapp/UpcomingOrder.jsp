<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="dto.Vendor"%>
<%@page import="dto.Customer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Vendor vendor = (Vendor)session.getAttribute("vendor");
		if (vendor == null) {
			response.getWriter().print("<h1>Invalid Session </h1>");
			request.getRequestDispatcher("Login.html").include(request, response);
		} else {
			List<Order> list = vendor.getOrders();
			if (list.isEmpty()) {
				response.getWriter().print("<h1>No Order Yet</h1>");
				request.getRequestDispatcher("VendorHome.html").include(request, response);
			} else {
	%>
	<table border="1">
		<tr>
			<th>Order Id</th>
			<th>Customer Id</th>
			<th>CustomerName</th>
			<th>Customer Picture</th>
			<th>Customer Order</th>
			<th>Deliver</th>
		</tr>
		<%
			for (Order order : list) {
		%>
		<%
			if (order.getTime() == null) {
		%>
		<tr>
			<th><%=order.getId()%></th>
			<th><%=order.getCustomer().getId()%></th>
			<th><%=order.getCustomer().getName()%></th>
			<th>
				<%
					String base64 = Base64.encodeBase64String(order.getCustomer().getPicture());
				%> <img height="100px" width="100px" alt="unknown"
				src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=Order.getCustomerOrder()%></th>
			<th><a href="checkorder?id=<%=order.getId()%>"><button>Check</button></a></th>
		</tr>
		<%
			}
		%>
		<%
			}
		%>
	</table>
	<br>
	<a href="VendorHome.html"><button>Back</button></a>
	<%
		}
	%>
	<%
		}
	%>
</body>
</html>