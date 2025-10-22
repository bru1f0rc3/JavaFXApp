package ru.demo.demo2.model;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "product", schema = "public")
public class Product {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @ManyToOne
    @JoinColumn(name = "producttypeid")
    private ProductType productTypeId;

    @Column(name = "articlenumber", length = 10)
    private String articleNumber;

    @Column(name = "description")
    private String description;

    @Column(name = "image", length = 100)
    private String image;

    @Column(name = "productionpersoncount")
    private Integer productionPersonCount;

    @Column(name = "productionworkshopnumber")
    private Integer productionWorkShopNumber;

    @Column(name = "mincostforagent")
    private Double minCostForAgent;

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

    public ProductType getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(ProductType productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getArticleNumber() {
        return articleNumber;
    }

    public void setArticleNumber(String articleNumber) {
        this.articleNumber = articleNumber;
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

    public Integer getProductionWorkShopNumber() {
        return productionWorkShopNumber;
    }

    public void setProductionWorkShopNumber(Integer productionWorkShopNumber) {
        this.productionWorkShopNumber = productionWorkShopNumber;
    }

    public Double getMinCostForAgent() {
        return minCostForAgent;
    }

    public void setMinCostForAgent(Double minCostForAgent) {
        this.minCostForAgent = minCostForAgent;
    }

}
