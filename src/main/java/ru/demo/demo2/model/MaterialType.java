package ru.demo.demo2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "material_types", schema = "production")
public class MaterialType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "material_type_id")
    private Long materialTypeId;

    @Column(name = "title", length = 50)
    private String title;

    @Column(name = "defected_percent")
    private Double defectedPercent;

    public Double getDefectedPercent() {
        return defectedPercent;
    }

    public void setDefectedPercent(Double defectedPercent) {
        this.defectedPercent = defectedPercent;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getMaterialTypeId() {
        return materialTypeId;
    }

    public void setMaterialTypeId(Long materialTypeId) {
        this.materialTypeId = materialTypeId;
    }


}
