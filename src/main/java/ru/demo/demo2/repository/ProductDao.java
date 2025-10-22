package ru.demo.demo2.repository;

import ru.demo.demo2.model.Product;

public class ProductDao extends BaseDao<Product> {
    public ProductDao(){
        super(Product.class);
    }
}
