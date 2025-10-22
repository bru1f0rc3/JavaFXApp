package ru.demo.demo2.service;

import ru.demo.demo2.model.MaterialType;
import ru.demo.demo2.repository.MaterialTypeDao;

import java.util.List;

public class MaterialTypeService {
    static MaterialTypeDao materialDao = new MaterialTypeDao();

    public MaterialTypeService(){}

    public List<MaterialType> findAll(){
        return materialDao.findAll();
    }
}
