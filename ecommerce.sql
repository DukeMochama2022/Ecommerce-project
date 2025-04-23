
CREATE DATABASE IF NOT EXISTS ecommerce;


USE ecommerce;

-- Table: product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    product_id INT,
    image_url VARCHAR(255),
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: color
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    color_name VARCHAR(50) NOT NULL,
    color_code VARCHAR(10)
);

-- Table: product_category
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(100)  NOT NULL,
    category_description TEXT
);

-- Table: brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    brand_name VARCHAR(100) NOT NULL,
    brand_description TEXT
);

-- Table: product
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_id INT,
    brand_id INT,
    product_name VARCHAR(255),
    product_description TEXT,
    base_price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- Table: product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    sku VARCHAR(50),
    price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Table: size_category
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_name VARCHAR(50) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    size_value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    size_option_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    attribute_category_id INT,
    type_name VARCHAR(50) ,
    data_type ENUM('text', 'number', 'boolean'),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- -- Table: product_attribute
CREATE TABLE product_attribute (
    product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(255),
    FOREIGN KEY (product_item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);