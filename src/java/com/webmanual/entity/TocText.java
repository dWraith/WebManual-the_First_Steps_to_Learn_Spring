package com.webmanual.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import java.util.List;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name = "toctexts")
public class TocText {
    @GeneratedValue
    @Column(name="id_toctext")
    @Id
    private Integer id;
    
    @Column(name="`name`")
    private String name;

    @ManyToOne
    @JoinColumn(name = "id_language")
    private Language language;
        
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "tocText", cascade = CascadeType.REMOVE)
    private List<Page> listPages;
    
    
    public TocText(Integer id, String name, Language language, List<Page> listPages) {
        this.id = id;
        this.name = name;
        this.listPages = listPages;
        this.language = language;
    }
    
    public TocText() {
    
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

    public List<Page> getListPages() {
        return listPages;
    }

    public void setListPages(List<Page> listPages) {
        this.listPages = listPages;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }
    
}
