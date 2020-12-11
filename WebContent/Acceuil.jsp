<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
 
 <%@ page import="creditclient.Client" %>
    <%@ page import="java.sql.Connection" %>
        <%@ page import="javax.servlet.*" %>
        <%@ page import="java.sql.DriverManager" %>
        <%@ page import="java.sql.PreparedStatement" %>
                <%@ page import="java.sql.ResultSet" %>
       
 <%
    if(request.getParameter("username")!=null && request.getParameter("pass")!=null ){
String name=request.getParameter("username");
    String pass=request.getParameter("pass");
   
    Client c=null;
    try {
Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db-si", "root", "");
         String connex = "select * from client where nomCli=? and mdpCli=?";
         PreparedStatement stmt=con.prepareStatement(connex);  

stmt.setString(1,name);  
stmt.setString(2,pass);

ResultSet rs=stmt.executeQuery();  
while(rs.next()){  

c = new Client(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
if(rs.getString(2).equals(name)==true && rs.getString(8).equals(pass)==true){

HttpSession sessions = request.getSession();

       sessions.setAttribute("client", c);  
       response.sendRedirect("Annuite.jsp");

      
}  
}  
con.close();  
}catch (Exception e) {
System.out.println(e);
}
    
    
    }
   
 %>   
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login V3</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="Custum/css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="css/all.min.css">

<!-- Custom styles for this template -->

<link href="css/scrolling-nav.css" rel="stylesheet">
<link rel="stylesheet" href="css/styling.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css"> 


<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">

<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/materiel-design-conic-front.css"  type="text/css">
<link href="css/materiel-design-conic-front.min.css"  type="text/css">

<link rel="icon" type="image/png" href="images/icons/iconee.ico" />
</head>
<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/banque.jpg');">
<div class="wrap-login100">
<form class="login100-form validate-form">
<span class="login100-form-logo">
<i class="fa fa-bank"></i>
</span>
<span class="login100-form-title p-b-34 p-t-27">
Log in
</span>
<div class="wrap-input100 validate-input" data-validate="Enter username">
<input class="input100" type="text" name="username" placeholder="Username">
<span class="focus-input100" data-placeholder="&#xf207;"></span>
</div>
<div class="wrap-input100 validate-input" data-validate="Enter password">
<input class="input100" type="password" name="pass" placeholder="Password">
<span class="focus-input100" data-placeholder="&#xf191;"></span>
</div>
<div class="contact100-form-checkbox">
<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
<label class="label-checkbox100" for="ckb1">
Remember me
</label>
</div>
<div class="container-login100-form-btn">
<button class="login100-form-btn">
Login
</button>
</div>
<div class="text-center p-t-90">
<a class="txt1" href="Inscription.jsp">
Vous n'avez pas encore un compte ? Inscrivez vous.
</a>
</div>
</form>
</div>

</div>
</div>
<div id="dropDownSelect1"></div>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>

<script src="vendor/animsition/js/animsition.min.js"></script>

<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="vendor/select2/select2.min.js"></script>

<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>

<script src="vendor/countdowntime/countdowntime.js"></script>

<script src="js/main.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>

</body>
</html>