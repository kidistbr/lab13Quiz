package com.kidist.lab13Quiz;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "QuizServlet", value = "/QuizServlet")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        int answer = Integer.parseInt(request.getParameter("result"));
        Quiz quiz;
        if (s.getAttribute("quiz") == null || answer == 0) s.setAttribute("quiz", new Quiz());
        quiz = (Quiz) s.getAttribute("quiz");
        if (answer != 0 && quiz.getCurrent() < 5) quiz.next(answer, quiz.getCurrent());
        if (quiz.getCurrent() < 5)
            request.getRequestDispatcher("index.jsp").forward(request, response);
        else {
            request.getRequestDispatcher("quizEnd.jsp").forward(request, response);
        }
    }
}
