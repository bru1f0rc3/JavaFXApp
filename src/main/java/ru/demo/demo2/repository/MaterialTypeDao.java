package ru.demo.demo2.repository;

import ru.demo.demo2.model.MaterialType;

public class MaterialTypeDao extends BaseDao<MaterialType> {
    public MaterialTypeDao(){
        super(MaterialType.class);
    }
}
