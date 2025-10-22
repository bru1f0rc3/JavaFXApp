package ru.demo.demo2.controller;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import ru.demo.demo2.model.Product;
import ru.demo.demo2.model.ProductMaterial;
import ru.demo.demo2.model.ProductType;
import ru.demo.demo2.service.ProductMaterialService;
import ru.demo.demo2.service.ProductTypeService;

import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;

public class ProductMaterialListController implements Initializable {
    
    @FXML
    private ListView<Product> listViewProducts;
    
    @FXML
    private TextField textFieldSearch;
    
    @FXML
    private ComboBox<String> comboBoxProductType;
    
    @FXML
    private ComboBox<String> comboBoxSort;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        ProductMaterialService service = new ProductMaterialService();
        List<Product> products = service.getAllProducts();
        String[] items = {"По умолчанию","По возврастанию", "По убыванию"};
        for (String item : items){
            comboBoxSort.getItems().add(item);
        }
        ProductTypeService productTypeService = new ProductTypeService();
        List<ProductType> productTypes = productTypeService.findAll();
        comboBoxProductType.getItems().addFirst("Все");
        for (var item : productTypes){
            comboBoxProductType.getItems().add(item.getTitle());
        }
        comboBoxProductType.setValue("Все");
        Map<Long, List<ProductMaterial>> materialsByProduct = service.groupByProduct();
        ProductMaterialCell.setMaterialsMap(materialsByProduct);
        listViewProducts.setItems(FXCollections.observableArrayList(products));
        listViewProducts.setCellFactory(param -> new ProductMaterialCell());
    }

    @FXML
    private void onSearchAction() {
        filterData();
    }
    @FXML
    private void onProductTypeAction() {
        filterData();
    }
    @FXML
    private void onSortAction() {
        filterData();
    }

    public void filterData(){
    String searchData = textFieldSearch.getText().toLowerCase().trim();
    ProductMaterialService service = new ProductMaterialService();
    List<Product> products = service.getAllProducts();
        if (!searchData.isEmpty()){
            products = products.stream().filter(sr -> sr.getTitle().toLowerCase().trim().contains(searchData)).
            collect(Collectors.toList());
        }

        String sortValue = comboBoxSort.getValue();
        if (sortValue != null){
            switch (sortValue){
                case "По возрастанию":
                    products.sort(Comparator.comparing(Product::getMinCostForAgent));
                    break;
                case "По убыванию":
                    products.sort(Comparator.comparing(Product::getMinCostForAgent).reversed());
                    break;
                default:

                    break;
            }
        }

        String typeValue = comboBoxProductType.getValue();
        if (typeValue != null && !typeValue.equals("Все")){
            products = products.stream()
                .filter(pr -> pr.getProductTypeId() != null &&
                        pr.getProductTypeId().getTitle().equals(typeValue))
                .collect(Collectors.toList());
        }

        Map<Long, List<ProductMaterial>> materialsByProduct = service.groupByProduct();
        ProductMaterialCell.setMaterialsMap(materialsByProduct);
        listViewProducts.setItems(FXCollections.observableArrayList(products));
    }
}
