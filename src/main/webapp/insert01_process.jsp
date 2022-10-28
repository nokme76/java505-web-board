<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 사용하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%
  Connection conn = null;
  Statement stmt = null;

  try {
      String url = "jdbc:mysql://localhost:3306/javadb";
      String user = "test1";
      String passwd = "java505";


      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, passwd);

      request.setCharacterEncoding("UTF-8");

      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      String userName = request.getParameter("userName");

      String sql = "INSERT INTO member (id, passwd, name) ";
      sql += "VALUES ('" +userId + "','" +userPw + "','" + userName+ "') ";
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      out.println("member 테이블에 데이터 추가가 성공했습니다");
  }
  catch (SQLException e){
    out.println("Member 테이블 추가가 실패했습니다.");
    out.println("SQLException : " + e.getMessage());
  }
  finally {
      if (stmt != null){stmt.close();}
      if (conn != null){conn.close();}
  }
%>
</body>
</html>
