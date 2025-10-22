package ru.demo.demo2.service;

import ru.demo.demo2.model.Product;
import ru.demo.demo2.model.ProductMaterial;
import ru.demo.demo2.repository.ProductDao;
import ru.demo.demo2.repository.ProductMaterialDao;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductMaterialService {
    private static ProductMaterialDao productMaterialDao = new ProductMaterialDao();
    private static ProductDao productDao = new ProductDao();

    public List<ProductMaterial> findAll(){
        return productMaterialDao.findAll();
    }

    public List<Product> getAllProducts() {
        return productDao.findAll();
    }

    public Map<Long, List<ProductMaterial>> groupByProduct() {
        List<ProductMaterial> all = productMaterialDao.findAll();
        return all.stream()
                .collect(Collectors.groupingBy(pm -> pm.getProductId().getId()));
    }
}
