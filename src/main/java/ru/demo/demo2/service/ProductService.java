package ru.demo.demo2.service;

import ru.demo.demo2.model.Product;
import ru.demo.demo2.repository.ProductDao;

import java.util.List;

public class ProductService {
    static ProductDao productDao = new ProductDao();
    public List<Product> findAll(){
        return productDao.findAll();
    }
}
