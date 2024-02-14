<!DOCTYPE html>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="in.entity.Note"%>
<%@page import="in.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Note</title>
    <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/addNotes.css">
</head>
<body>

  <input type="hidden" id="dialog" value="<%=request.getAttribute("update")%>" />
    <nav class="navbar">
        <div class="logo">
             <h1 class="heading1">NoteKeeper</h1>
        </div>
        <ul class="ullist">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="addNote.jsp">Add Notes</a></li>
            <li><a href="showNotes.jsp">Show Notes</a></li>
        </ul>
    </nav>
     <%
       
      int id=Integer.parseInt(request.getParameter("id"));
     
      Session s=FactoryProvider.getFactory().openSession();
      Note n=s.get(Note.class, id);
      
      s.close();
     %>
     <form action="editNote" class="userForm" method="post">
      <input type="hidden" value="<%= id%>" name="idVal" > 
       <% System.out.print(id); %>
        <input type="text" name="title" id="userTitle" value="<%= n.getTitle()%>" title="Enter title" required>
        <textarea name="content" id="userContent" cols="30" rows="10" title="Enter the content" required><%= n.getContent()%></textarea>
        <input type="submit" class="btn" value="Edit">
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		let alert = document.getElementById("dialog").value;
		if (alert === "true") {
			Swal.fire({
				title : "Done!",
				text : "Note Edited Successfully!",
				icon : "success"
			});
		}
	</script>
</body>
</html>
