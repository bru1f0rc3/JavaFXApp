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

    private void loadDefaultImage() {
        try {
            var imageStream = getClass().getResourceAsStream("/images/picture.png");
            if (imageStream != null) {
                Image defaultImage = new Image(imageStream);
                if (!defaultImage.isError()) {
                    ImageViewPhoto.setImage(defaultImage);
                } else {
                    System.err.println("Ошибка изображения: изображение повреждено");
                }
            } else {
                System.err.println("Не найден ресурс: /images/picture.png");
            }
        } catch (Exception e) {
            System.err.println("Ошибка при загрузке изображения по умолчанию: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void updateItem(Product product, boolean empty) {
        super.updateItem(product, empty);
        if (empty || product == null) {
            setGraphic(null);
        } else {
            String typeTitle = (product.getProductType() != null)
                    ? product.getProductType().getTitle()
                    : "Без типа";
            LabelTitle.setText(typeTitle + " | " + product.getTitle());
            LabelDescription.setText("Артикул: " + product.getArticleNumber());
            LabelCost.setText(String.format("%.2f руб.", product.getMinCostForAgent()));
            List<ProductMaterial> materials = service.getMaterialsForProduct(
                product.getArticleNumber(), 
                product.getTitle()
            );
            String materialsText = "Материалы: ";
            if (materials.isEmpty()) {
                materialsText += "Нет данных";
            } else {
                for (int i = 0; i < materials.size(); i++) {
                    ProductMaterial pm = materials.get(i);
                    String materialName = pm.getMaterial().getTitle();
                    materialsText += materialName;
                    if (i < materials.size() - 1) {
                        materialsText += ", ";
                    }
                }
            }
            LabelMaterials.setText(materialsText);

            if (product.getImage() != null && !product.getImage().isEmpty()) {
                try {
                    Image image = new Image("file:" + product.getImage());
                    if (!image.isError()) {
                        ImageViewPhoto.setImage(image);
                    } else {
                        loadDefaultImage();
                    }
                } catch (Exception e) {
                    loadDefaultImage();
                }
            } else {
                loadDefaultImage();
            }
            setGraphic(gridPane);
        }
    }
}