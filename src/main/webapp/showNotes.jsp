<!DOCTYPE html>
<%@page import="java.net.URLEncoder"%>
<%@page import="in.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="in.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Notes</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Rubik&display=swap');
</style>
<link rel="stylesheet" href="css/showNote.css">
</head>
<body>

   <input type="hidden" id="dialogbox" value="<%= request.getAttribute("deleteStatus")%>" />
	<nav class="navbar">
		<div class="logo">
			<h1 class="heading1">NoteKeeper</h1>
		</div>
		<ul class="ullist">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="addNote.jsp">Add Notes</a></li>
		</ul>
	</nav>
	<div class="dispNotes">
		<h1 class="showNotes-heading">My All Notes</h1>
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> list = q.list();

		for (Note n : list) {
		%>

		<div class="container">
			<div class="card">
				<div class="buttons">
					<form action="deleteMyNote?id=<%= n.getId()%>" method="post" >
					  <button class="card-btn">Delete Note</button>
					</form>
					<!--  
                    <form action="UpdateMyNote.jsp?id=<%= n.getId()%>" method="post" >
					  <button class="card-btn2">Update</button>
					</form> -->  
				</div>
				<div class="imgBox">
					<img alt="Diarylogo" src="download.jpeg">
				</div>

				<div class="content">
					<h2><%=n.getTitle()%></h2>
					<p><%=n.getContent()%></p>
				</div>
			</div>

		</div>


		<%
		}
		%>
	</div>
   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		let alert = document.getElementById("dialogbox").value;
		if (alert === "true") {
			Swal.fire({
				title : "Done!",
				text : "Note Deleted Successfully!",
				icon : "success"
			});
		}
	</script>
</body>
</html>
