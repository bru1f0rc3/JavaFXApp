package ru.demo.demo2.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import ru.demo.demo2.model.Product;
import ru.demo.demo2.model.ProductMaterial;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductMaterialCell extends ListCell<Product> {
    @FXML private Label LabelTitle;
    @FXML private Label LabelDescription;
    @FXML private Label LabelMaterials;
    @FXML private Label LabelCost;
    @FXML private ImageView ImageViewPhoto;
    private GridPane pane;
    private static Map<Long, List<ProductMaterial>> materialsMap = new HashMap<>();

    public static void setMaterialsMap(Map<Long, List<ProductMaterial>> map) {
        materialsMap = map;
    }

    public ProductMaterialCell() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/ru/demo/demo2/product-material-cell.fxml"));
            loader.setController(this);
            pane = loader.load();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Не удалось загрузить FXML: " + e.getMessage(), e);
        }
    }

    @Override
    protected void updateItem(Product product, boolean empty) {
        super.updateItem(product, empty);

        if (empty || product == null) {
            setGraphic(null);
        } else {
            String typeTitle = (product.getProductTypeId() != null)
                    ? product.getProductTypeId().getTitle()
                    : "Без типа";
            LabelTitle.setText(typeTitle + " | " + product.getTitle());
            LabelDescription.setText("Артикул: " + product.getArticleNumber());
            String materials = "Нет материалов";
            List<ProductMaterial> mats = materialsMap.get(product.getId());
            if (mats != null && !mats.isEmpty()) {
                materials = mats.stream()
                        .map(pm -> pm.getMaterialId().getTitle())
                        .collect(Collectors.joining(", "));
            }
            LabelMaterials.setText("Материалы: " + materials);
            LabelCost.setText(String.format("%.2f", product.getMinCostForAgent()));
            if (product.getImage() != null && !product.getImage().trim().isEmpty()) {
                try {
                    ImageViewPhoto.setImage(new Image("file:" + product.getImage()));
                } catch (Exception e) {
                    ImageViewPhoto.setImage(null);
                }
            } else {
                ImageViewPhoto.setImage(null);
            }

            setGraphic(pane);
        }
    }
}

