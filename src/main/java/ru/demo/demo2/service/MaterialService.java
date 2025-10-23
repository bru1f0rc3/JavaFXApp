package ru.demo.demo2.service;

import ru.demo.demo2.model.Material;
import ru.demo.demo2.repository.MaterialDao;

import java.util.List;

public class MaterialService {
    static MaterialDao materialDao = new MaterialDao();
    public List<Material> findAll(){
        return materialDao.findAll();
    }
}
