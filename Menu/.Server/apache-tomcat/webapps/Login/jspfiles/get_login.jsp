<%@ page import = "java.lang.*,java.util.*,java.sql.*,java.io.*" %>
<%@ page import = "java.servlet.http.*,java.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://192.168.18.232:3306/bdsys","luigui","Luigui21@");

        String uname = request.getParameter("uname");
        String pword = request.getParameter("pword");
        
        if(0==uname.length() || 0==pword.length()){
            out.println("All Fields are mandatory!");
            con.close();
            return;
        }

       PreparedStatement ps = con.prepareStatement("select * from usuario where NOMBREUSUARIO=? and CLAVE=?");
        ps.setString(1,uname);
        ps.setString(2,pword);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            String name = rs.getString(1);
            String mail = rs.getString(3);
            int bal = rs.getInt(3);

            //Creating cookies and adding them into response

            Cookie nameC = new Cookie("name",name);
            Cookie mailC = new Cookie("mail",mail);
            Cookie balC = new Cookie("balance",String.valueOf(bal));

            response.addCookie(nameC);
            response.addCookie(mailC);
            response.addCookie(balC);

            out.println("<h1>"+"Welcome "+name.toUpperCase()+"!</h1>");
        }else{
            out.println("User not Found");
        }

        con.close();
    %>
    
</body>
</html>
