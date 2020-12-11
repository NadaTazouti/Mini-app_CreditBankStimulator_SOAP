<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.Connection" %>
        <%@ page import="javax.servlet.*" %>
        <%@ page import="java.sql.DriverManager" %>
        <%@ page import="java.sql.PreparedStatement" %>
          		<%@ page import="com.methodes.MethodesStub" %>
          		  <%@ page import="com.methodes.MethodesStub" %>
          		     <%@ page import="com.methodes.MethodesStub.Capital" %>
            		<%@ page import=" com.methodes.MethodesStub.CapitalResponse" %>
            		<%@ page import="creditclient.Client" %>
<%
 double annuite; 
 int duree ; 
 double taux;  
 double responseC=0; 
 HttpSession sessionclient = request.getSession();
 Client cli=(Client)session.getAttribute("client");
  String s=cli.getNomCli();
 if( request.getParameter("taux")!=null && request.getParameter("duree")!=null && request.getParameter("annuite") !=null){  
    annuite=Double.parseDouble(request.getParameter("annuite"));
 	duree=Integer.parseInt(request.getParameter("duree"));
 	taux=Double.parseDouble(request.getParameter("taux"));
 	MethodesStub stub= new MethodesStub();
		Capital c= new Capital();
		
		  int num=cli.getNumCli();

		c.setAnnuite(annuite);
		c.setDuree(duree);
		c.setT(taux);
		CapitalResponse resp = stub.capital(c);
		 responseC = resp.get_return();
		 String capital=Double.toString(responseC);
		 String insertion = "insert into credit (monCre,durCre,tauCre,annCre,numCli) values(?,?,?,?,?)";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db-si", "root", "");

				PreparedStatement stmt=con.prepareStatement(insertion);  
							   
					stmt.setString(1,capital);  
					stmt.setString(2,request.getParameter("duree"));  
					stmt.setString(3,request.getParameter("taux"));
					stmt.setString(4,request.getParameter("annuite"));
					stmt.setInt(5, num);
					
					
					
					stmt.executeUpdate();  
					  
					con.close();  
				} catch (Exception e) {
					System.out.println(e);
				}
		 
}

 %>


<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - Shrinking Bootstrap Navbar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css'>

  <link rel="stylesheet" type="text/css" href="css/annuite.css">
  


  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>


<body translate="no" >
  <!-- USING BOOTSTRAP 3.0.3 -->
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    
    <div class="navbar-header">
  
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
    
     
      <a class="navbar-brand" >Bienvenue chère client <%=s %> !</a>
      
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav pull-right">
        <li ><a href="Annuite.jsp">Annuité</a></li>
        <li class="active"><a href="Capital.jsp">Capital</a></li>
        <li><a href="Duree.jsp">Durée</a></li>
          <li><a href="Credit.jsp">Mon Compte</a></li>
         <li><a href="Acceuil.jsp">Se deconnecter</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<SPAN style="position: absolute; top: 10 px; left: 550px;width: 150px; height: 130px">
<img src="images/moi.PNG" align=middle />
</SPAN>

<form action="">
 <fieldset>
      <legend><h2>Stimulation de votre crédit</h2></legend>
      
     <label for="annuite">Entrez votre Annuité :</label><input type="text" name="annuite" /><br />
      <label for="taux">Entrez le taux :</label><input type="text" name="taux" /><br />
      <label for="duree">Entrez la durée souhaitée :</label><input type="text" name="duree" /><br />

      <input  type="submit" value="valide">
   </fieldset>
   
 </form> 
 <%if(responseC!=0){ %>
<table width="20%" border="1" class="styled-table">
<tr>

<td bgcolor="#653b64">Votre capital est de:<%=responseC%></td>

</table>

<%} %>

	<script src="vendor/jquery/jquery.min.js"></script>	
        </body>
      </html>