<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="creditclient.Credit" %>
     <%@page import="javax.servlet.http.HttpSession" %>
        <%@ page import="creditclient.Client" %>
		<%@ page import="java.sql.Connection" %>
		<%@ page import="java.sql.DriverManager" %>
		<%@ page import="java.sql.PreparedStatement" %>	  	
 <%@ page import="java.sql.ResultSet" %>
     <%@ page import="java.util.ArrayList" %>

          
             <%@ page import="java.util.List" %>
    
    <% 
    
    HttpSession sessionclient = request.getSession();
	   Client c= (Client) sessionclient.getAttribute("client");
		int num=c.getNumCli();
		 String s=c.getNomCli();
	 String monCre=null;
		String durCre=null;
		String tauCre=null;
		String annCre=null;
        String Selectnum="select * from credit where numCli=?";
		ArrayList<Credit> tablecredit = new ArrayList<Credit>();
	 try{
			Class.forName("com.mysql.jdbc.Driver");
			
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db-si", "root", "");
						PreparedStatement stmt=con.prepareStatement(Selectnum);  
						stmt.setInt(1,num);
						ResultSet result= stmt.executeQuery();  
						
						while(result.next()){  
							Credit credit = new Credit();
							
							credit.setNumCre(result.getInt("numCre"));
							credit.setMonCre(result.getDouble("monCre"));
							credit.setDurCre(result.getInt("durCre"));
							credit.setTauCre(result.getDouble("tauCre"));
							credit.setAnnCre(result.getDouble("annCre"));
							credit.setNumCli(num);
					      
							tablecredit.add(credit);    
					
						 } 
						
						con.close();  
						}catch (Exception e) {
				System.out.println(e);
			}
	 

    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/Credit.css">
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - Shrinking Bootstrap Navbar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css'>

  <link rel="stylesheet" type="text/css" href="css/annuite.css">
<title>Insert title here</title>
</head>
<body translate="no" >
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    
    <div class="navbar-header">
      <a class="navbar-brand" >Bienvenue chère client <%=s %>!</a>
      
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav pull-right">
        <li class="active"><a href="Annuite.jsp">Annuité</a></li>
        <li><a href="Capital.jsp">Capital</a></li>
        <li><a href="Duree.jsp">Durée</a></li>
          <li><a href="Credit.jsp">Mon Compte</a></li>
         <li><a href="Acceuil.jsp">Se deconnecter</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

  <table class="flatTable">
  <tr class="titleTr">
 
    <td class="titleTd" align="Center" ><font size="+3"> Votre Historique de Stimulation </font></td> 
  
    <td colspan="4"></td>
   
  </tr>
  <tr class="headingTr">
    <td> Capital</td>
    <td>Durée</td>
    <td> Taux</td>
    <td>Annuitée</td> 
  </tr>
  



 <% if(tablecredit.equals("null")){ 
		 	out.print("<h1>Vous n'avez aucun crédit</h1>"); 
			}else{
 for(int i=0;i<tablecredit.size();i++){%>

   <tr>

  <th scope="row"><%= tablecredit.get(i).getMonCre()%></th>
      <td>	<%= tablecredit.get(i).getDurCre() %></td>
      <td><%=tablecredit.get(i).getTauCre() %></td>
      <td><%=tablecredit.get(i).getAnnCre() %></td>
 <%--    <td><%=tablecredit.get(i).getNumCli() %></td> --%>
    
  </tr>
   <%} }%>	 
  
<%--  </c:forEach>  --%>
</table>
<%-- <% } %> --%>


<link href='https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="vendor/jquery/jquery.min.js"></script>
      <script id="rendered-js" >
$(".button").click(function () {
  $("#sForm").toggleClass("open");
});

$(".controlTd").click(function () {
  $(this).children(".settingsIcons").toggleClass("display");
  $(this).children(".settingsIcon").toggleClass("openIcon");
});
//# sourceURL=pen.js
    </script>

  

</body>
</html>