package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "materials", schema = "production")
public class Material {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "material_id")
    private Long materialId;

    @Column(name = "title", length = 100)
    private String title;

    @Column(name = "count_in_pack")
    private Integer countInPack;

    @ManyToOne
    @JoinColumn(name = "unit_id")
    private Unit unit;

    @Column(name = "count_in_stock")
    private Double countInStock;

    @Column(name = "min_count")
    private Double minCount;

    @Column(name = "description")
    private String description;

    @Column(name = "cost")
    private Double cost;

    @Column(name = "image", length = 100)
    private String image;

    @ManyToOne
    @JoinColumn(name = "material_type_id")
    private MaterialType materialType;

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
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

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public Double getCountInStock() {
        return countInStock;
    }

    public void setCountInStock(Double countInStock) {
        this.countInStock = countInStock;
    }

    public Double getMinCount() {
        return minCount;
    }

    public void setMinCount(Double minCount) {
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

    public MaterialType getMaterialType() {
        return materialType;
    }

    public void setMaterialType(MaterialType materialType) {
        this.materialType = materialType;
    }
}
