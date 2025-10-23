package ru.demo.demo2.service;

import ru.demo.demo2.model.ProductType;
import ru.demo.demo2.repository.ProductTypeDao;

import java.util.List;

public class ProductTypeService {
    static ProductTypeDao productTypeDao = new ProductTypeDao();
    public List<ProductType> findAll(){
        return productTypeDao.findAll();
    }
}
