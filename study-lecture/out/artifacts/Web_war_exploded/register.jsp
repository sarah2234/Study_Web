<%@page import="java.io.*" %>
<%@include file = "checkDuplicate.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	
</head>
<body>

	<%
		try{
			// Get parameter value from HTML
			String userName = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			String password = request.getParameter("userPassword");

			// File path
			String strPath = getServletContext().getRealPath("/") + "register.txt";

			File strFile = new File(strPath);
			// if the file is not existed, the new file will be created then.
			if (!strFile.exists())
				strFile.createNewFile();
			

			boolean isDuplicated = checkDuplicate(userName, email, strPath);
			if(isDuplicated){
				out.print("<script>alert('The user name or email already exists!');</script>");
				out.println("<script>window.history.back();</script>");
			}else{

				// File appending
				Writer objWriter = new BufferedWriter(new FileWriter(strFile, true));
				objWriter.write(userName + "," + email + "," + password);
				objWriter.write("\n");
				
				objWriter.flush();
				objWriter.close();
				objWriter = null;
			}
			
		}catch(IOException e){
			out.println(e.getMessage());
		}
	%>

	<center>
		<h1>Congratulation!</h1>
		<h2>Your account has been registered :) </h2>
		<span>Do you want to log in now?<a href="./index.jsp">Click Here</a></span>
	</center>
</body>
</html>