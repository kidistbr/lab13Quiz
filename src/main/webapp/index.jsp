
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="jakarta.servlet.http.HttpSession" %>--%>
<%@ page import="com.kidist.lab13Quiz.Quiz" %>
<%--<%@ page import="javax.servlet.http." %>--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Simple Quiz System Based on JSP (MVC)</title>
</head>
<body>
<h1>The Number Quiz (MVC)</h1>
<%
    HttpSession s = request.getSession();
    if (s.getAttribute("quiz") == null) {
%>
<p>Press the button and let's start this amazing quiz!</p>
<form action="QuizServlet" method="post">
    <input type="submit"/>
    <input type="hidden" name="result" value="0"/>
</form>
<%
} else {
    Quiz quiz = (Quiz) s.getAttribute("quiz");
%>
<p> Don't give up. You are on question ${sessionScope.quiz.current+1}/5</p><!--%=quiz.getCurrent()+1%>-->
<p> Your current score: ${sessionScope.quiz.score}</p> <!--%=quiz.getScore()%>-->
<p>Can you guess the next number in the sequence?</p>
<p><%=quiz.getQuestion(quiz.getCurrent())%>...</p>
<form action="QuizServlet" method="post">
    <p>Your Answer: <input type="number" name="result" min=1 max=99999 required/></p>
    <input type="submit"/>
</form>
<%
    }
%>
</body>
</html>
