package ru.demo.demo2.repository;

import ru.demo.demo2.model.ProductMaterial;

public class ProductMaterialDao extends BaseDao<ProductMaterial> {
    public ProductMaterialDao(){
        super(ProductMaterial.class);
    }
}
