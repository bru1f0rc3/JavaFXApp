package ru.demo.demo2.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "producttype", schema = "public")
public class ProductType {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title", length = 50)
    private String title;

    public Float getDefectedPercent() {
        return defectedPercent;
    }

    public void setDefectedPercent(Float defectedPercent) {
        this.defectedPercent = defectedPercent;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "defectedpercent")
    private Float defectedPercent;

}
