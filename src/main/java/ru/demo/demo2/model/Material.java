package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "material", schema = "public")
public class Material {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title", length = 100)
    private String title;

    @Column(name = "countinpack")
    private Integer countInPack;

    @Column(name = "unit", length = 10)
    private String unit;

    @Column(name = "countinstock")
    private Float countInStock;

    @Column(name = "mincount")
    private Float minCount;

    @Column(name = "description")
    private String description;

    @Column(name = "cost")
    private Double cost;

    @Column(name = "image", length = 100)
    private String image;

    @ManyToOne
    @JoinColumn(name = "materialtypeid")
    private MaterialType materialTypeId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCountInPack() {
        return countInPack;
    }

    public void setCountInPack(Integer countInPack) {
        this.countInPack = countInPack;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Float getCountInStock() {
        return countInStock;
    }

    public void setCountInStock(Float countInStock) {
        this.countInStock = countInStock;
    }

    public Float getMinCount() {
        return minCount;
    }

    public void setMinCount(Float minCount) {
        this.minCount = minCount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public MaterialType getMaterialTypeId() {
        return materialTypeId;
    }

    public void setMaterialTypeId(MaterialType materialTypeId) {
        this.materialTypeId = materialTypeId;
    }
}
