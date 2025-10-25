package ru.demo.demo2.service;

import ru.demo.demo2.model.Product;
import ru.demo.demo2.model.ProductMaterial;
import ru.demo.demo2.repository.ProductDao;
import ru.demo.demo2.repository.ProductMaterialDao;

import java.util.ArrayList;
import java.util.List;

public class ProductMaterialService {
    private static final ProductMaterialDao productMaterialDao = new ProductMaterialDao();
    private static final ProductDao productDao = new ProductDao();

    public List<ProductMaterial> findAll(){
        return productMaterialDao.findAll();
    }

    public List<Product> getAllProducts() {
        return productDao.findAll();
    }

    public java.util.List<ProductMaterial> getMaterialsForProduct(String articleNumber, String title) {
        java.util.List<ProductMaterial> allMaterials = productMaterialDao.findAll();
        java.util.List<ProductMaterial> result = new ArrayList<>();

        for (ProductMaterial pm : allMaterials) {
            if (pm.getProductArticleNumber().equals(articleNumber) && 
                pm.getProductTitle().equals(title)) {
                result.add(pm);
            }
        }

        return result;
    }
}
