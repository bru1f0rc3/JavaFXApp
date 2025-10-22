package ru.demo.demo2.model;

import java.io.Serializable;
import java.util.Objects;

public class ProductMaterialId implements Serializable {
    private Long productId;
    private Long materialId;

    public ProductMaterialId() {
    }

    public ProductMaterialId(Long productId, Long materialId) {
        this.productId = productId;
        this.materialId = materialId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }
}
