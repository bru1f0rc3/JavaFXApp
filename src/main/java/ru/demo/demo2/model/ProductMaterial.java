package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "product_material", schema = "production")
public class ProductMaterial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pm_id")
    private Long pmId;

    @Column(name = "product_article_number", length = 10)
    private String productArticleNumber;

    @Column(name = "product_title", length = 100)
    private String productTitle;

    @ManyToOne
    @JoinColumns({
        @JoinColumn(name = "product_article_number", referencedColumnName = "article_number", insertable = false, updatable = false),
        @JoinColumn(name = "product_title", referencedColumnName = "title", insertable = false, updatable = false)
    })
    private Product product;

    @ManyToOne
    @JoinColumn(name = "material_id")
    private Material material;

    @Column(name = "count")
    private Double count;

    public Long getPmId() {
        return pmId;
    }

    public void setPmId(Long pmId) {
        this.pmId = pmId;
    }

    public String getProductArticleNumber() {
        return productArticleNumber;
    }

    public void setProductArticleNumber(String productArticleNumber) {
        this.productArticleNumber = productArticleNumber;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public Double getCount() {
        return count;
    }

    public void setCount(Double count) {
        this.count = count;
    }
}
