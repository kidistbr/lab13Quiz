package com.kidist.lab13Quiz;

public class Quiz {
    private int score;
    private int current;
    private static final String[] questions = {
            "3,1,4,1,5",
            "1,1,2,3,5",
            "1,4,9,16,25",
            "2,3,5,7,11",
            "1,2,4,8,16"
    };
    private static final int[] answers = {9, 8, 36, 13, 32};

    public Quiz() {
        this.score = 0;
        this.current = 0;
    }

    public void next(int answer, int i) {
        score += answer == answers[i] ? 1 : 0;
        current++;
    }

    public int getScore() {
        return score;
    }

    public int getCurrent() {
        return current;
    }

    public String getQuestion(int i) {
        return questions[i];
    }
}
