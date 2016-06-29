package com.webmanual.entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "questions")
public class Question {
    
    @Id
    @GeneratedValue
    @Column(name="id_question")
    private Integer id;
    
    @Column(name="question")
    private String question;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question", cascade = CascadeType.REMOVE)
    private List<Answer> answers;

    private Integer id_correct_Answer;
    
    @OneToOne
    @JoinColumn(name="id_correct_answer")      
    private Answer correctAnswer;
    
    @ManyToOne
    @JoinColumn(name = "id_test")
    private Test test;
    
    Question(Integer id, String question, List<Answer> answers) {
        this.id = id;
        this.question = question;
        this.answers = answers;
    }
    
    Question() {
    System.out.println("question");
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the correctAnswer
     */
    public Answer getCorrectAnswer() {
        return correctAnswer;
    }

    /**
     * @param correctAnswer the correctAnswer to set
     */
    public void setCorrectAnswer(Answer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

}