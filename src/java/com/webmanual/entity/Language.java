package com.webmanual.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity
@Table(name = "`languages`")
public class Language {
    @Id
    @Column(name="id_language")
    @GeneratedValue
    private Integer id;
   
    @Column(name = "name")
    private String name;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "language", cascade = CascadeType.ALL)
    private List<TocText> listTocTexts;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "language", cascade = CascadeType.ALL)
    private List<Page> listPages;
    
    Language(Integer id, String name, List<TocText> listTocTexts, List<Page> listPages) {
        this.id = id;
        this.name = name;
        this.listTocTexts = listTocTexts;
        this.listPages = listPages;
    }
    
    Language() {
        
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<TocText> getListTocTexts() {
        return listTocTexts;
    }

    public void setListTocTexts(List<TocText> tocTexts) {
        this.listTocTexts = listTocTexts;
    }

    public List<Page> getListPages() {
        return listPages;
    }

    public void setListPages(List<Page> listPages) {
        this.listPages = listPages;
    }
    
}
