<%
	if(session.getAttribute("admin") == null){
		response.sendRedirect("unauthorised.jsp");
	}else{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Page</title>
</head>
<body>
<!-- JSP + SQL statements for deleting game -->
<%
String gameID = request.getParameter("gameID");

try{
	Connection conn=DBConnection.getConnection();

	PreparedStatement pstmt=conn.prepareStatement("DELETE from games WHERE gameID=?");

	pstmt.setString(1, gameID);

	pstmt.executeUpdate();

	conn.close();

	response.sendRedirect("adminHomePage.jsp");
}catch(Exception e){
	out.println(e);
}

%>

</body>
</html>
<%}%>