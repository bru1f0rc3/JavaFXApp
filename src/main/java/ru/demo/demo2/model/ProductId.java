package ru.demo.demo2.model;

import java.io.Serializable;
import java.util.Objects;

public class ProductId implements Serializable {
    private String articleNumber;
    private String title;

    public ProductId() {
    }

    public ProductId(String articleNumber, String title) {
        this.articleNumber = articleNumber;
        this.title = title;
    }

    public String getArticleNumber() {
        return articleNumber;
    }

    public void setArticleNumber(String articleNumber) {
        this.articleNumber = articleNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductId productId = (ProductId) o;
        return Objects.equals(articleNumber, productId.articleNumber) &&
                Objects.equals(title, productId.title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(articleNumber, title);
    }
}
