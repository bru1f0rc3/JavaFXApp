-- Создание схемы
CREATE SCHEMA IF NOT EXISTS production;

-- 1. Единицы измерения
CREATE TABLE production.units (
      unit_id SERIAL PRIMARY KEY,
      name VARCHAR(10) NOT NULL UNIQUE -- 'шт', 'кг', 'л'
);

-- 2. Типы материалов
CREATE TABLE production.material_types (
           material_type_id SERIAL PRIMARY KEY,
           title VARCHAR(50) NOT NULL,
           defected_percent NUMERIC(5,2) NOT NULL CHECK (defected_percent >= 0 AND defected_percent <= 100)
);

-- 3. Материалы
CREATE TABLE production.materials (
          material_id SERIAL PRIMARY KEY,
          title VARCHAR(100) NOT NULL,
          count_in_pack INT NOT NULL CHECK (count_in_pack > 0),
          unit_id INT NOT NULL,
          count_in_stock NUMERIC(12,2),
          min_count NUMERIC(12,2) NOT NULL CHECK (min_count >= 0),
          description TEXT,
          cost NUMERIC(10,2) NOT NULL CHECK (cost >= 0),
          image VARCHAR(100),
          material_type_id INT NOT NULL,
          FOREIGN KEY (unit_id) REFERENCES production.units(unit_id) ON DELETE RESTRICT,
          FOREIGN KEY (material_type_id) REFERENCES production.material_types(material_type_id) ON DELETE RESTRICT
);

-- 4. История изменения количества материала
CREATE TABLE production.material_count_history (
           history_id SERIAL PRIMARY KEY,
           material_id INT NOT NULL,
           change_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
           count_value NUMERIC(12,2) NOT NULL,
           FOREIGN KEY (material_id) REFERENCES production.materials(material_id) ON DELETE CASCADE
);

-- 5. Поставщики
CREATE TABLE production.suppliers (
          supplier_id SERIAL PRIMARY KEY,
          title VARCHAR(150) NOT NULL,
          inn VARCHAR(12) NOT NULL,
          start_date DATE NOT NULL,
          quality_rating INT CHECK (quality_rating BETWEEN 1 AND 5),
          supplier_type VARCHAR(20)
);

-- 6. Связь Материал — Поставщик
CREATE TABLE production.material_supplier (
          material_id INT NOT NULL,
          supplier_id INT NOT NULL,
          PRIMARY KEY (material_id, supplier_id),
          FOREIGN KEY (material_id) REFERENCES production.materials(material_id) ON DELETE CASCADE,
          FOREIGN KEY (supplier_id) REFERENCES production.suppliers(supplier_id) ON DELETE CASCADE
);

-- 7. Типы продукции
CREATE TABLE production.product_types (
          product_type_id SERIAL PRIMARY KEY,
          title VARCHAR(50) NOT NULL,
          defected_percent NUMERIC(5,2) NOT NULL CHECK (defected_percent >= 0 AND defected_percent <= 100)
);

-- 8. Продукция — PK = (article_number, title) — как в вашем импорте!
CREATE TABLE production.products (
         article_number VARCHAR(10) NOT NULL,
         title VARCHAR(100) NOT NULL,
         product_type_id INT,
         description TEXT,
         image VARCHAR(100),                      -- NULL если нет фото
         production_person_count INT,
         production_workshop_number INT,
         min_cost_for_agent NUMERIC(10,2) NOT NULL CHECK (min_cost_for_agent >= 0),
         PRIMARY KEY (article_number, title),     -- составной PK —允许多个相同 article_number с разными title
         FOREIGN KEY (product_type_id) REFERENCES production.product_types(product_type_id) ON DELETE SET NULL
);

-- 9. История изменения стоимости продукта
CREATE TABLE production.product_cost_history (
         history_id SERIAL PRIMARY KEY,
         product_article_number VARCHAR(10) NOT NULL,
         product_title VARCHAR(100) NOT NULL,
         change_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
         cost_value NUMERIC(10,2) NOT NULL CHECK (cost_value >= 0),
         FOREIGN KEY (product_article_number, product_title) REFERENCES production.products(article_number, title) ON DELETE CASCADE
);

-- 10. Состав продукта — с автоинкрементным ID как PK
CREATE TABLE production.product_material (
         pm_id SERIAL PRIMARY KEY,                -- единственный PK (как вы просили)
         product_article_number VARCHAR(10) NOT NULL,
         product_title VARCHAR(100) NOT NULL,
         material_id INT NOT NULL,
         count NUMERIC(12,2),                     -- может быть NULL
         FOREIGN KEY (product_article_number, product_title) REFERENCES production.products(article_number, title) ON DELETE CASCADE,
         FOREIGN KEY (material_id) REFERENCES production.materials(material_id) ON DELETE RESTRICT
);

-- 11. Типы агентов
CREATE TABLE production.agent_types (
        agent_type_id SERIAL PRIMARY KEY,
        title VARCHAR(50) NOT NULL,
        image VARCHAR(100)
);

-- 12. Агенты
CREATE TABLE production.agents (
       agent_id SERIAL PRIMARY KEY,
       title VARCHAR(150) NOT NULL,
       agent_type_id INT NOT NULL,
       address VARCHAR(300),
       inn VARCHAR(12) NOT NULL,
       kpp VARCHAR(9),
       director_name VARCHAR(100),
       phone VARCHAR(20) NOT NULL,
       email VARCHAR(255),
       logo VARCHAR(100),
       priority INT NOT NULL CHECK (priority >= 0),
       FOREIGN KEY (agent_type_id) REFERENCES production.agent_types(agent_type_id) ON DELETE RESTRICT
);

-- 13. История приоритета агента
CREATE TABLE production.agent_priority_history (
       history_id SERIAL PRIMARY KEY,
       agent_id INT NOT NULL,
       change_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
       priority_value INT NOT NULL CHECK (priority_value >= 0),
       FOREIGN KEY (agent_id) REFERENCES production.agents(agent_id) ON DELETE CASCADE
);

-- 14. Магазины
CREATE TABLE production.shops (
      shop_id SERIAL PRIMARY KEY,
      title VARCHAR(150) NOT NULL,
      address VARCHAR(300),
      agent_id INT NOT NULL,
      FOREIGN KEY (agent_id) REFERENCES production.agents(agent_id) ON DELETE RESTRICT
);

-- 15. Продажи продукции агентами — тоже по составному ключу
CREATE TABLE production.product_sales (
      sale_id SERIAL PRIMARY KEY,
      agent_id INT NOT NULL,
      product_article_number VARCHAR(10) NOT NULL,
      product_title VARCHAR(100) NOT NULL,
      sale_date DATE NOT NULL DEFAULT CURRENT_DATE,
      product_count INT NOT NULL CHECK (product_count > 0),
      FOREIGN KEY (agent_id) REFERENCES production.agents(agent_id) ON DELETE RESTRICT,
      FOREIGN KEY (product_article_number, product_title) REFERENCES production.products(article_number, title) ON DELETE RESTRICT
);