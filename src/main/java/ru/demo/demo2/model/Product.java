package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "products", schema = "public")
@IdClass(ProductId.class)
public class Product {

    @Id
    @Column(name = "article_number", length = 10)
    private String articleNumber;

    @Id
    @Column(name = "title", length = 100)
    private String title;

    @ManyToOne
    @JoinColumn(name = "product_type_id")
    private ProductType productType;

    @Column(name = "description")
    private String description;

    @Column(name = "image", length = 100)
    private String image;

    @Column(name = "production_person_count")
    private Integer productionPersonCount;

    @Column(name = "production_workshop_number")
    private Integer productionWorkshopNumber;

    @Column(name = "min_cost_for_agent")
    private Double minCostForAgent;

    public String getArticleNumber() {
        return articleNumber;
    }

    public void setArticleNumber(String articleNumber) {
        this.articleNumber = articleNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getProductionPersonCount() {
        return productionPersonCount;
    }

    public void setProductionPersonCount(Integer productionPersonCount) {
        this.productionPersonCount = productionPersonCount;
    }

    public Integer getProductionWorkshopNumber() {
        return productionWorkshopNumber;
    }

    public void setProductionWorkshopNumber(Integer productionWorkshopNumber) {
        this.productionWorkshopNumber = productionWorkshopNumber;
    }

    public Double getMinCostForAgent() {
        return minCostForAgent;
    }

    public void setMinCostForAgent(Double minCostForAgent) {
        this.minCostForAgent = minCostForAgent;
    }
}
