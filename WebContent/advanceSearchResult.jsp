<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<title>SP Games Store</title>
</head>

<body>
	<%@include file="navbar.jsp" %>
	
	<%
	String gameTitle = request.getParameter("gameTitle");
	String genre=request.getParameter("genre");
	String preOwned=request.getParameter("preOwned");
													 
													 
	conn=DBConnection.getConnection();
	
	pstmt = conn.prepareStatement("SELECT * FROM games where title like ? and preOwned = ? and gameID IN (select gameID from games_genre where genreID IN (select genreID from genre where genreID = ?) group by gameID)");
	
		
	pstmt.setString(1, "%" + gameTitle + "%");
	pstmt.setString(2, preOwned);
	pstmt.setString(3, genre);

	rs=pstmt.executeQuery();
	


	%>
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Search Results <small><a href="advanceSearch.jsp">Advance Search</a></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		<%while(rs.next()){ %>
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="<%=rs.getString("imageLocation") %>" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3><%=rs.getString("title") %></h3>
                <%
                String gameID = rs.getString("gameID");
                pstmt=conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
                pstmt.setString(1, gameID); 
                ResultSet displayGenre = pstmt.executeQuery();
                %>                
                <h5>
                <%
                while(displayGenre.next()){%>
                	<span class="label label-info"><%=displayGenre.getString("genreName") %></span>
                <%} 
                displayGenre.close();
                %>
                </h5>
                <p><%=rs.getString("description") %></p>
                <a class="btn btn-primary" href="gameDetails.jsp?gameID=<%=rs.getInt("gameID")%>">View Game <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        <%} 
		rs.close(); %>	
        </div>
        <%@include file="footer.html" %>
</body>
</html>