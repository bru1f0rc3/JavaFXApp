package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "product_types", schema = "public")
public class ProductType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_type_id")
    private Long productTypeId;

    @Column(name = "title", length = 50)
    private String title;

    @Column(name = "defected_percent")
    private Double defectedPercent;

    public Double getDefectedPercent() {
        return defectedPercent;
    }

    public void setDefectedPercent(Double defectedPercent) {
        this.defectedPercent = defectedPercent;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Long productTypeId) {
        this.productTypeId = productTypeId;
    }


}
