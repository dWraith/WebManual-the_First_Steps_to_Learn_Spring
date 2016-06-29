package com.webmanual.insertdb;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`pages`")
public class Page {
    
    @Id
    @GeneratedValue
    private Integer id;
    
    @Column(name = "`name`")
    private String name;
    
    @Column(name="`htmlcode`")
    private String content;
    
    @Column(name="`description`")
    private String description;
    
    @Column(name = "`id_language`")
    private Integer idLanguage;
    
    @Column(name = "`id_toctext`")
    private Integer idTocText;
    
    public Page(Integer id, String name, String content, String description, Integer idLanguage, Integer idTocText) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.description = description;
        this.idLanguage = idLanguage;
        this.idTocText = idTocText;
    }
    
    public Page() {
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getIdLanguage() {
        return idLanguage;
    }

    public void setIdLanguage(Integer idLanguage) {
        this.idLanguage = idLanguage;
    }

    public Integer getIdTocText() {
        return idTocText;
    }

    public void setIdTocText(Integer idTocText) {
        this.idTocText = idTocText;
    }
    
}
