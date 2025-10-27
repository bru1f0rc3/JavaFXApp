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
import ru.demo.demo2.service.ProductMaterialService;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class ProductMaterialCell extends ListCell<Product> {
    @FXML
    private ImageView ImageViewPhoto;
    @FXML
    private Label LabelTitle;
    @FXML
    private Label LabelDescription;
    @FXML
    private Label LabelCost;
    @FXML
    private Label LabelMaterials;

    private GridPane gridPane;
    private ProductMaterialService service = new ProductMaterialService();

    public ProductMaterialCell() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/ru/demo/demo2/product-material-cell.fxml"));
            loader.setController(this);
            gridPane = loader.load();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Не удалось загрузить FXML", e);
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
            LabelCost.setText(String.format("%.2f руб.", product.getMinCostForAgent()));
            List<ProductMaterial> materials = service.getMaterialsForProduct(product.getId());
            String materialsText = "Материалы: ";
            if (materials.isEmpty()) {
                materialsText += "Нет данных";
            } else {
                List<String> lists = materials.stream()
                        .map(pm ->
                                pm.getMaterialId().getTitle())
                        .collect(Collectors.toList());
                materialsText += String.join(", ", lists);
            }
            LabelMaterials.setText(materialsText);
            if (product.getImage() != null && !product.getImage().isEmpty()) {
                try {
                    Image image = new Image("file:" + product.getImage());
                    ImageViewPhoto.setImage(image);
                } catch (Exception e) {
                    ImageViewPhoto.setImage(new Image(Objects.requireNonNull(getClass().getResourceAsStream("/images/picture.png"))));
                }
            } else {
                ImageViewPhoto.setImage(new Image(Objects.requireNonNull(getClass().getResourceAsStream("/images/picture.png"))));
            }
            setGraphic(gridPane);
        }
    }
}