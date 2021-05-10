<%--
  Created by IntelliJ IDEA.
  User: kidist
  Date: 5/7/2021
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Simple Quiz System Based on JSP (MVC)</title>
</head>
<body>
<%
    HttpSession s = request.getSession();
%>
<h1>The Number Quiz (MVC)</h1>
<p>The quiz is over. Your final score is ${sessionScope.quiz.score}/5. Try again?</p><!--%=quiz.getScore()%>-->
<form action="QuizServlet" method="post">
    <input type="hidden" name="result" value="0"/>
    <input type="submit"/>
</form>
<%
    s.removeAttribute("quiz");
%>
</body>
</html>
