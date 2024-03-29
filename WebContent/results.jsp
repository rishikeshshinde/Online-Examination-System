
<%@page import="myPackage.classes.Answers"%>
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->

<% if(session.getAttribute("set").equals("1"))
{
	%>

			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>
					<div class="left-menu">
						<a  href="std-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a class="active" href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
					</div>
				</div>
		
         
                       </div>
                       <% 
}

else if(session.getAttribute("set").equals("2")){
	%>
	
	<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
	
	
	
	
<%	
}
%>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 900px">
                                
        <%
            if(request.getParameter("eid")==null){
        %>
        <div class="title">All Results</div>
           <table id="rounded-corner">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Date</th>
            <th scope="col" class="rounded-q1">Course</th>
            <th scope="col" class="rounded-q1">Time</th>
            <th scope="col" class="rounded-q1">Marks</th>
            <th scope="col" class="rounded-q3">Total</th>
            <th scope="col" class="rounded-q1">Status</th>
            <th scope="col" class="rounded-q4">Action</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%
        //Displaying all results of the user who is logged in.
        	int uId = Integer.parseInt(session.getAttribute("userId").toString());
           // ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(session.getAttribute("userId").toString()));
            ArrayList list=pDAO.getAllResultsFromExams(uId);
            for(int i=0;i<list.size();i++){
                Exams e=(Exams)list.get(i);
            %>
    	<tr>
            <td><%=e.getDate() %></td>
            <td><%=e.getcName() %></td>
            <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
            <td><%=e.getObtMarks() %></td>
            <td><%=pDAO.getTotalMarksByName(e.getcName())%>
            <% if(e.getStatus()!=null){
                if(e.getStatus().equals("Pass")){%>
                <td style="background: #00cc33;color:white"><%=e.getStatus()%></td>
            <% }else{%>
            <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
            <% }
            }else{%>
            <td style="background: bisque ;">Terminated</td>
            <% } %>
            <td><a href="std-page.jsp?pgprt=2&eid=<%=e.getExamId()%>">Details</a></td>
        </tr>
       
       <% }
       %>
    </tbody>
</table>
       <%
            }else{
                %>
                <div class="title">Result Details</div>
                <table id="gradient-style" >
                
                <%
                ArrayList list=pDAO.getAllAnswersByExamId(Integer.parseInt(request.getParameter("eid")));
                for(int i=0;i<list.size();i++){
                    Answers a=(Answers) list.get(i);
                
            %>

            
                <tr>
                    <td rowspan="2"><%=i+1 %>)</td>
                    <% int qid=Integer.parseInt(a.getQuestion());
                    
                    String question = pDAO.getQuestion(qid);
                    	
                    %>
                    <td colspan="2"><%=question%></td>
                    <td rowspan="2"><%=a.getStatus() %></td>
                </tr>
                <tr >
                    <td><%="Your Ans: "+a.getAnswer()%></td>
                    <td><%="Correct Ans: "+a.getCorrectAns() %></td>
                </tr>
                <tr>
                    <td colspan="3" style="background: white"></td>
                <%
                }
                %>
            </table>
                    
            
            <%
            }
            %>
                            </div>
                            </div>
                           