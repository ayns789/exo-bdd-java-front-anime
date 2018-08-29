<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
try {
            String n = request.getParameter("nom");
           String p = request.getParameter("prenom");
           String mail = request.getParameter("email");
           String pass = request.getParameter("pwd");


           Class.forName("com.mysql.jdbc.Driver");

           String url = "jdbc:mysql://localhost:3306/anime";
           String user = "root";
           String pwd= "";

           Connection con=DriverManager.getConnection(url, user, pwd);
           PreparedStatement ps = con.prepareStatement("insert into forminscri values(?,?,?,?)");

           ps.setString(2, n);
           ps.setString(3, p);
           ps.setString(4, mail);
           ps.setString(5, pass);

           int i = ps.executeUpdate();


           if(i>0){
           %>
               <jsp:forward page="inscription.jsp"></jsp:forward>
           <%
           }
           else{
               out.print("Remplissez tous les champs s'il vous plait." );
           }

}
catch(Exception e){e.printStackTrace();
out.print("Remplissez tous les champs s'il vous plait." );
}

%>
