package ru.demo.demo2.repository;

import ru.demo.demo2.model.Material;

public class MaterialDao extends BaseDao<Material> {
    public MaterialDao(){
        super(Material.class);
    }
}
