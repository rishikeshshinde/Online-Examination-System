
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body>
	<div class="top-area">
		<div style="text-align:center"><h2>Student Panel</h2></div> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>
    
    <%
            if(session.getAttribute("userStatus")!=null){
           if(session.getAttribute("userStatus").equals("1")){
            %>
            	
            <div class="menu">
            <a href="std-page.jsp?pgprt=0" class="button">profile</a>
            <a class="button" href="std-page.jsp?pgprt=1">exams</a>
            <a class="button" href="std-page.jsp?pgprt=2">results</a>
            <a href="controller.jsp?page=logout" class="button" style="float: right;background:black;color:white;padding:3px">Logout</a>
            </div>
            <% 
            //pgpart = pagepart, exams=1,results=2 and profile is default
            if(request.getParameter("pgprt").equals("1")){
                
            %>
            
            <jsp:include page="exam.jsp"/>
            
            <%
                
            }else if(request.getParameter("pgprt").equals("2")){
            
            	request.getSession().setAttribute("set","1");
                %>
            	
                <jsp:include page="results.jsp"/>
                
                <%
                
            }else if(request.getParameter("pgprt").equals("0")){
            	request.setAttribute("pedt", "5");
            
                %>
            
                <jsp:include page="profile.jsp"/>
            
            <%
            }
            
            else if(request.getParameter("pgprt").equals("7"))
            {
            	%>
            	 <jsp:include page="edit-user.jsp"></jsp:include>
            	
            	<% 
            }
            %>
            
            <%
           }else response.sendRedirect("login.jsp");
            }else response.sendRedirect("login.jsp");
            
          
           %>
            
           </body>
</html>
            
