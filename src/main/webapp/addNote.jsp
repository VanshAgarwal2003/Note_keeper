<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Note</title>
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
    
     <form action="submitNote" class="userForm" method="post">
        <input type="text" name="title" id="userTitle" placeholder="Title" title="Enter title" required>
        <textarea name="content" id="userContent" cols="30" rows="10" placeholder="Start typing...." title="Enter the content" required></textarea>
        <input type="submit" class="btn" value="Add">
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		let alert = document.getElementById("dialog").value;
		if (alert === "true") {
			Swal.fire({
				title : "Done!",
				text : "Note Added Successfully!",
				icon : "success"
			});
		}
	</script>
</body>
</html>
