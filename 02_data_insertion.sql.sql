INSERT INTO client (Pname, Minit, Lname, CPF, Address, dateOfBirth) VALUES
('Ricardo', 'A', 'Silva', '12345678901', 'Rua das Flores, 10 - SP', '1990-05-15'),
('Julia', 'S', 'Oliveira', '98765432100', 'Av Central, 500 - RJ', '1985-10-22'),
('Marcos', 'P', 'Costa', '55544433322', 'Rua Bahia, 12 - MG', '1998-01-30'),
('Ana', 'L', 'Melo', '11122233344', 'Rua Chile, 100 - PR', '1992-07-08');

INSERT INTO product (productName, category, descript, size, price) VALUES
('Mouse Gamer', 'Eletrônicos', 'Mouse RGB 12000 DPI', 'Médio', 150.00),
('Teclado Mecânico', 'Eletrônicos', 'Switch Blue ABNT2', 'Grande', 350.00),
('Camiseta Algodão', 'Vestuário', '100% Algodão Preta', 'G', 59.90),
('Monitor 24 Pol', 'Eletrônicos', 'Full HD 144Hz', 'Grande', 1200.00),
('Fone de Ouvido', 'Eletrônicos', 'Noise Cancelling', 'Pequeno', 299.00);

INSERT INTO orders (client_idClient, statusOrder, descript, freight) VALUES
(1, 'delivered', 'Compra de periféricos', 15.00),
(2, 'shipped', 'Vestuário casual', 10.00),
(3, 'paid', 'Setup upgrade', 50.00),
(1, 'pending', 'Novo Pedido', 0.00);

INSERT INTO Order_Product_Relation (idPOorder, idPOproduct, quantity, status) VALUES
(1, 1, 1, 'Available'),
(1, 2, 1, 'Available'),
(2, 3, 2, 'Available'),
(3, 4, 1, 'Available'),
(3, 1, 1, 'Available');

INSERT INTO Payments (idPclient, idPorder, payment_method, payment_status) VALUES
(1, 1, 'Credit_Card', 'Completed'),
(2, 2, 'Pix', 'Completed'),
(3, 3, 'Boleto', 'Pending');

INSERT INTO stock (Local) VALUES ('Depósito Central'), ('Filial Sul'), ('Armazém Norte');

INSERT INTO product_has_stock (id_product, id_stock, quantity, location_aisle) VALUES
(1, 1, 50, 'A-10'),
(2, 1, 20, 'A-12'),
(3, 2, 100, 'B-05'),
(4, 3, 15, 'C-01');

INSERT INTO supplier (RazaoSocial, CNPJ, Contato, Endereco) VALUES
('Tech Import LTDA', '12345678000199', '11988887777', 'Rua Industrial, 50'),
('Fashion Wear SA', '98765432000188', '21977776666', 'Av Têxtil, 200');

INSERT INTO Supplying_Product (Product_idProduct, Supplier_idSupplier, CostPrice, DeliveryTime) VALUES
(1, 1, 80.00, 5),
(4, 1, 850.00, 15);

INSERT INTO third_party_seller (corporateName, CNPJ, contact, address) VALUES
('Loja do Zé', '44455566000122', '31966665555', 'Rua do Comércio, 1');

INSERT INTO seller_product (seller_id, product_id, quantity, salePrice) VALUES
(1, 5, 10, 280.00);