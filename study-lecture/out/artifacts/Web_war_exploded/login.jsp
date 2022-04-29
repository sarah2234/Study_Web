<%@page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	
</head>
<body>
	

	<%
		try{
			String userNameOrEmail = request.getParameter("userName");
			String password = request.getParameter("password");

			String strPath = getServletContext().getRealPath("/") + "register.txt";
			 out.println( getServletContext().getRealPath("/") ); 
			BufferedReader reader = new BufferedReader(new FileReader(strPath));
			
			String record = null;
			boolean foundUser = false;


			while((record = reader.readLine()) != null){
				
				String[] dataList = record.split(",");
				// dataList[0] is userName
				// dataList[1] is email
				// dataList[2] is password


				// the userNameOrEmail must be equal to userName or Email
				// and the password must be equal to password in the text file.
				if( (userNameOrEmail.equals(dataList[0]) || userNameOrEmail.equals(dataList[1])) 
					&& password.equals(dataList[2]) ){
					foundUser = true;
					break;
				}else{
					foundUser = false;
				}
				
			}

			if(foundUser){
			%>
				<center>
					<h2>Congratulation! Login Sucessfully!</h2>
					<h2>Hello ~ <%= userNameOrEmail %></h2>
					<span>Do you want to log out now? <a href="./login.html">Click Here</a></span><br>
					<span>go to index page? <a href="./index.jsp">Click Here</a></span>
				</center>
				
			<%
			}else{
				out.println("<script>alert('Login fail! Please check your information again!')</script>");
				out.println("<script>window.location='./login.html'</script>");

			}
		
			reader.close();
			reader = null;

		}catch(IOException e){
			out.println(e.getMessage());
		}
	%>


</body>
</html>