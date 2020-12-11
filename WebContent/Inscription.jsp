<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%@ page import="creditclient.Client" %>
    <%@ page import="java.sql.Connection" %>
        <%@ page import="javax.servlet.*" %>
        <%@ page import="java.sql.DriverManager" %>
        <%@ page import="java.sql.PreparedStatement" %>
    
        
        
        
        <%
    if(request.getParameter("nom")!=null && request.getParameter("prenom")!=null && request.getParameter("adr")!=null && request.getParameter("ville")!=null && request.getParameter("email")!=null  && request.getParameter("tele")!=null && request.getParameter("pass")!=null  ){ 
	String nom=request.getParameter("nom");
    String prenom=request.getParameter("prenom");
    String adr=request.getParameter("adr");
    String ville=request.getParameter("ville");
    String tele=request.getParameter("tele");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    
    Client c= new Client(nom,prenom,adr,ville,tele,email,pass);

    
    try {
		Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db-si", "root", "");
		   String Inscription = "insert into client (nomCli , preCli,adrCli,vilCli,telCli,mailCli,mdpCli) values(?,?,?,?,?,?,?)";
					PreparedStatement stmt=con.prepareStatement(Inscription);  
			
			
		    
			stmt.setString(1,c.getNomCli());  
			stmt.setString(2,c.getPreCli());  
			stmt.setString(3,c.getAdrCli());
			stmt.setString(4,c.getVilCli());
			stmt.setString(5,c.getTelCli());
			stmt.setString(6,c.getMailCli());
			stmt.setString(7,c.getMdpCli());
			
			stmt.executeUpdate();  
			  
			con.close();  
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
    RequestDispatcher dispatcher;
    dispatcher = request.getRequestDispatcher("Acceuil.jsp");
    dispatcher.forward(request, response);
    }
    
 %>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">

<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type	="text/css" href="css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />


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
</head>
<body>


<script src="vendor/jquery/jquery-3.2.1.min.js"></script>

<script src="vendor/animsition/js/animsition.min.js"></script>

<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="vendor/select2/select2.min.js"></script>
<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>

<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>

<script src="vendor/countdowntime/countdowntime.js"></script>

<script src="js/main.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>

	<script src="vendor/jquery/jquery.min.js"></script>	
</body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/banque.jpg');">
<div class="wrap-login100">
<form class="login100-form validate-form">
<span class="login100-form-logo">
<i class="fa fa-bank"></i>
</span>
<span class="login100-form-title p-b-34 p-t-27">
Inscrivez vous !
</span>
<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
<input id="first-name" class="input100" type="text" name="nom" placeholder=" nom">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
<input class="input100" type="text" name="prenom" placeholder="prenom">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
<input class="input100" type="text" name="adr" placeholder="adresse">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
<input class="input100" type="text" name="ville" placeholder="ville">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
<input class="input100" type="text" name="tele" placeholder="telephone">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" >
<input class="input100" type="text" name="email" placeholder="email">
<span class="focus-input100"></span>
</div>
<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
<input class="input100" type="password" name="pass" placeholder="password">
<span class="focus-input100"></span>
</div>
<div class="container-login100-form-btn">
<button class="login100-form-btn">
Sign in
</button>
</div>
<div class="w-full text-center">
<a href="Acceuil.jsp" class="txt3">
Connexion
</a>
</div>
</form>
<div class="login100-more" style="background-image: url('images/banque.jpg');"></div>
</div>
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



</html>