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

     public List<ProductMaterial> getMaterialsForProduct(Long productId) {
            List<ProductMaterial> allMaterials = productMaterialDao.findAll();
            List<ProductMaterial> result = new ArrayList<>();

            for (ProductMaterial pm : allMaterials) {
                if (pm.getProductId().getId().equals(productId)) {
                    result.add(pm);
                }
            }

            return result;
        }
    }
