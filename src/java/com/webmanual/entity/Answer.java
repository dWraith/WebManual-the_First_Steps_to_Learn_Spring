/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webmanual.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "answers")
public class Answer {
  
    @Id
    @GeneratedValue
    @Column(name="id_answer")
    private Integer id;
    
    @Column(name="answer")
    private String answer;

    @ManyToOne
    @JoinColumn(name = "id_question")
    private Question question;
    
    Answer(Integer id, String answer) {
        this.id = id;
        this.answer = answer;
    }
    
    Answer() {
    System.out.println("answer");
    }
    
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}