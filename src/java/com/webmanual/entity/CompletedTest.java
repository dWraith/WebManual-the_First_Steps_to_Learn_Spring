package com.webmanual.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "completedtests")
public class CompletedTest {
    @Id
    @GeneratedValue
    private Integer id;
    
    @Cascade({CascadeType.ALL})
    @ManyToOne
    @JoinColumn(name = "id_test")
    private Test test;
    
    @ManyToOne
    @Fetch(FetchMode.SELECT)
    @Cascade({CascadeType.REMOVE})
    @JoinColumn(name = "id_user")
    private User user;
    
    @Column(name = "points")
    private int points;

    public CompletedTest() {
    
    }
    
    public CompletedTest(Test test, User user, int points) {
        this.test = test;
        this.user = user;
        this.points = points;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
      
}
