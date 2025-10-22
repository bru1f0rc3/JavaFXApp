package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "productmaterial", schema = "public")
@IdClass(ProductMaterialId.class)
public class ProductMaterial {

    @Id
    @ManyToOne
    @JoinColumn(name = "productid")
    private Product productId;

    @Id
    @ManyToOne
    @JoinColumn(name = "materialid")
    private Material materialId;

    @Column(name = "count")
    private Double count;

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public Material getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Material materialId) {
        this.materialId = materialId;
    }

    public Float getCount() {
        return count != null ? count.floatValue() : null;
    }

    public void setCount(Float count) {
        this.count = count != null ? count.doubleValue() : null;
    }

}
