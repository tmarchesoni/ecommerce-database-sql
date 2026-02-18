create database ecommerce;
SET default_storage_engine=INNODB;

use ecommerce;

CREATE TABLE client (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,              
    Minit CHAR(3),                     
    Lname VARCHAR(50) NOT NULL,             
    CPF CHAR(11) NOT NULL,                  
    Address VARCHAR(255) NOT NULL,          
    dateOfBirth DATE NOT NULL,             
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);



CREATE TABLE orders (
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    client_idClient INT,
    statusOrder ENUM('pending', 'paid', 'shipped', 'delivered'),
    descript VARCHAR(45),
    freight FLOAT,
    CONSTRAINT fk_orders_client
    FOREIGN KEY (client_idClient)
    REFERENCES client (idClient)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(45),
    category VARCHAR(45),
    descript TEXT,
    size VARCHAR(10),
    price DECIMAL(10,2)
);


CREATE TABLE Order_Product_Relation (
    idPOorder INT,
    idPOproduct INT,
    quantity INT,
    status ENUM('Available', 'Out of stock', 'Cancelled'),

    PRIMARY KEY (idPOorder, idPOproduct),

    FOREIGN KEY (idPOorder)
        REFERENCES orders(idOrder),

    FOREIGN KEY (idPOproduct)
        REFERENCES product(idProduct)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    idPclient INT NOT NULL,
    idPorder INT NOT NULL,
    payment_method ENUM('Boleto', 'Credit_Card', 'Pix') NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payment_customer FOREIGN KEY (idPclient)
        REFERENCES client(idClient) ON DELETE CASCADE,

    CONSTRAINT fk_payment_order FOREIGN KEY (idPorder)
        REFERENCES orders(idOrder) ON DELETE CASCADE
);

CREATE TABLE stock (
	idStock INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(45)
);

CREATE TABLE product_has_stock (
    id_product INT NOT NULL,
    id_stock INT NOT NULL ,
    quantity INT NOT NULL DEFAULT 0,
	location_aisle VARCHAR(20),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id_product, id_stock),

    CONSTRAINT fk_stock_product FOREIGN KEY (id_product)
        REFERENCES product(idProduct)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_stock_location FOREIGN KEY (id_stock)
        REFERENCES stock(idStock)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT check_positive_quantity CHECK (quantity >= 0)
);

CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Contato CHAR(11) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,

    CONSTRAINT unique_cnpj_fornecedor UNIQUE (CNPJ)
);

CREATE TABLE Supplying_Product (
    Product_idProduct INT,
    Supplier_idSupplier INT,
    CostPrice DECIMAL(10,2) NOT NULL,
    DeliveryTime INT, 
    Status ENUM('Active','Inactive') DEFAULT 'Active',

    PRIMARY KEY (Product_idProduct, Supplier_idSupplier),

    FOREIGN KEY (Product_idProduct)
        REFERENCES Product(idProduct)
        ON DELETE CASCADE,

    FOREIGN KEY (Supplier_idSupplier)
        REFERENCES Supplier(idSupplier)
        ON DELETE CASCADE
);

CREATE TABLE third_party_seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    corporateName VARCHAR(255) NOT NULL,
    tradeName VARCHAR(255),
    CNPJ CHAR(14) NOT NULL,
    contact CHAR(11) NOT NULL,
    address VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ)
);

CREATE TABLE seller_product (
    seller_id INT,
    product_id INT,
    quantity INT NOT NULL DEFAULT 0,
    salePrice DECIMAL(10,2) NOT NULL,
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (seller_id, product_id),

    CONSTRAINT fk_seller_product_seller
        FOREIGN KEY (seller_id)
        REFERENCES third_party_seller(idSeller)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_seller_product_product
        FOREIGN KEY (product_id)
        REFERENCES product(idProduct)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT check_positive_quantity_seller CHECK (quantity >= 0)
);







