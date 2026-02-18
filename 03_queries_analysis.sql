-- recuperação simples, lista todos os produtos cadastrados e seus preços
SELECT productName, category, price FROM product;

-- filtros com where: busca apenas produtos da categoria 'Eletrônicos' com preço acima de 200 reais.
SELECT * FROM product 
WHERE category = 'Eletrônicos' AND price > 200.00;

-- Atributos Derivados (Expressões): Calcula o valor total do item no pedido (Quantidade * Preço) e mostra o valor com 10% de imposto fictício.
SELECT 
    p.productName, 
    opr.quantity, 
    p.price, 
    (opr.quantity * p.price) AS subtotal,
    (opr.quantity * p.price) * 1.10 AS total_com_imposto
FROM Order_Product_Relation opr
JOIN product p ON opr.idPOproduct = p.idProduct;

-- Ordenação com ORDER BY: Lista os clientes por ordem alfabética de sobrenome e nome.
SELECT Lname, Pname, CPF FROM client 
ORDER BY Lname ASC, Pname ASC;


-- Filtros em Grupos (HAVING Statement): Mostra quais categorias de produtos possuem uma média de preço superior a 100 reais.
SELECT category, AVG(price) as media_preco
FROM product
GROUP BY category
HAVING AVG(price) > 100;


-- Junções entre tabelas (Joins Perspectiva Complexa): Gera um relatório completo de pedidos: Nome do Cliente, Status do Pedido, Nome do Produto e Método de Pagamento utilizado.
SELECT 
    c.Pname AS Cliente, 
    o.idOrder AS Numero_Pedido,
    o.statusOrder AS Status,
    p.productName AS Produto,
    pay.payment_method AS Forma_Pagamento
FROM client c
INNER JOIN orders o ON c.idClient = o.client_idClient
INNER JOIN Order_Product_Relation opr ON o.idOrder = opr.idPOorder
INNER JOIN product p ON opr.idPOproduct = p.idProduct
LEFT JOIN Payments pay ON o.idOrder = pay.idPorder;
