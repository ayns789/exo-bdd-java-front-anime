<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
try {
           String mail = request.getParameter("email");
           String n = request.getParameter("nom");
           String mdp = request.getParameter("mdp");


           Class.forName("com.mysql.jdbc.Driver");

           String url = "jdbc:mysql://localhost:3306/anime";
           String user = "root";
           String pwd= "";

           Connection con= DriverManager.getConnection(url, user, pwd);
           
           PreparedStatement ps = con.prepareStatement("insert into formctc values(?,?,?)");

           ps.setString(2, mail);
           ps.setString(3, n);
           ps.setString(4, mdp); 

           int i = ps.executeUpdate();


           if(i>0){
           %>
               <jsp:forward page="manganime.jsp"></jsp:forward>
           <%
           }
           else{
               System.out.print("Remplissez tous les champs s'il vous plait." );
           }

}
catch(Exception e){e.printStackTrace();
out.print("Remplissez tous les champs s'il vous plait." );
}

%>
