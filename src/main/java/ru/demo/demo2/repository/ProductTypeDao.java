package ru.demo.demo2.repository;

import ru.demo.demo2.model.ProductType;

public class ProductTypeDao extends BaseDao<ProductType>{
    public ProductTypeDao(){
        super(ProductType.class);
    }
}
