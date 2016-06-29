package com.webmanual.entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Table(name = "`users`")
public class User  implements java.io.Serializable {

    @Id
    @GeneratedValue
    private Integer id;
    
    @Column(name="`first_name`")
    private String firstName;
    
    @Column(name="`last_name`")
    private String lastName;
    
    @Column(name="`group`")
    private String group;
    
    @Column(name="`email`")
    private String email;
    
    @Column(name="`password`")
    private String password;
    
    @Column(name="`rating`")
    private Integer rating = 1;

    @Column(name="`nickname`")
    private String nickname;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<CompletedTest> tests;
    
    public User() {
    }

    public User(String firstName, String lastName, String group, String email, String password, int rating, String nickname) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.group = group;
       this.email = email;
       this.password = password;
       this.rating = rating;
       this.nickname = nickname;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getGroup() {
        return this.group;
    }
    
    public void setGroup(String group) {
        this.group = group;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Integer getRating() {
        return this.rating;
    }
    
    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public List<CompletedTest> getTests() {
        return tests;
    }

    public void setTests(List<CompletedTest> tests) {
        this.tests = tests;
    }
    
    public void changeRating(Integer score) {
        this.rating += score;
    }
    @Override
    public boolean equals(Object obj) {
        if(!this.id.equals(((User) obj).id)) return false;
        else return true;
    }
}


