package com.webmanual.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pages")
public class Page {
    
    @Id
    @GeneratedValue
    private Integer id;
    
    @Column(name="name")
    private String name;
    
    @Column(name="htmlcode")
    private String content;
    
    @Column(name="description")
    private String description;
    
    @ManyToOne
    @JoinColumn(name = "id_language")
    private Language language;
   
    @ManyToOne
    @JoinColumn(name = "id_toctext")
    private TocText tocText;
    
    public Page(Integer id, String name, String content, String description, Language language, TocText tocText) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.description = description;
        this.language = language;
        this.tocText = tocText;
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

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public TocText getTocText() {
        return tocText;
    }

    public void setTocText(TocText tocText) {
        this.tocText = tocText;
    }
    
}
