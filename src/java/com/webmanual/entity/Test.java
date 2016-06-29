package com.webmanual.entity;

import java.io.Serializable;
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
import javax.persistence.Table;

@Entity
@Table(name = "tests")
public class Test implements Serializable {
    
    @Id
    @GeneratedValue
    @Column(name="id_test")
    private Integer id;
    
    @Column(name="name_test")
    private String name;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "test", cascade = CascadeType.ALL)
    private List<Question> questions;

    Test(Integer id, String name, List<Question> questions, Language language) {
        this.id = id;
        this.name = name;
        this.questions = questions;
    }
    
    Test() {
        System.out.println("test");
    }
    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

}

