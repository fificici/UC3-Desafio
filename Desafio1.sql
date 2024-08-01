USE desafiofelipe;

--------------------------------------

CREATE TABLE Produtos (
    ID_Produto AUTO_INCREMENT INT PRIMARY,
    Nome VARCHAR(100),
    Categoria VARCHAR(100),
    Valor DECIMAL(10, 2),
    Vendedor VARCHAR(50),
    Marca VARCHAR(50),
    Estado VARCHAR(50),
    Descricao TEXT
);

-----------------------------------------

INSERT INTO Produtos (Categoria, Descricao, Estado, Marca, Nome, Valor, Vendedor) VALUES
('Eletrônico', "Smart TV LG 4K 50'' 3a geração", 'Novo', 'LG', 'Smart TV LG', 2000.00, 'Magazine Luiza'),
('Eletrônico', "Celular Samsung A15 5G 256gb", 'Novo', 'Samsung', 'Samsung A15', 1300.00, 'Ponto Frio'),
('Eletrodoméstico', "Air Fryer Philco 12L bivolt", 'Novo', 'Philco', 'Air Fryer Philco', 700.00, 'Casas Bahia'),
('Eletrodoméstico', "Aspirador de pó Electrolux 1200W bivolt", 'Novo', 'Electrolux', 'Aspirador de Pó Electrolux', 300.00, 'Americanas'),
('Mobília', "Cadeira de escritório estofada Viena ergonômica", 'Novo', 'Viena', 'Cadeira de Escritório Viena', 200.00, 'KaBuM!'),
('Mobília', "Cama Queen casal ORTOBOM 156x198x66", 'Novo', 'Ortobom', 'Cama Queen Ortobom', 1700.00, 'Ortobom'),
('Utensílio', "Mochila para trabalho Lenovo 15.6''", 'Novo', 'Lenovo', 'Mochila Lenovo', 150.00, 'Amazon'),
('Utensílio', "Caderno 10 matérias capa dura espiral", 'Novo', 'Lumi', 'Caderno 10 Matérias', 30.00, 'Clip.'),
('Roupa', "Tênis Superstar Adidas branco", 'Novo', 'Adidas', 'Tênis Superstar', 450.00, 'Netshoes'),
('Roupa', "Moletom Nike hoodie algodão", 'Novo', 'Nike', 'Moletom Nike', 350.00, 'Centauro')

-------------------------------------------------------------------------------------------------------

DELETE FROM Produtos
WHERE ID_Produto = 4;
DELETE FROM Produtos
WHERE ID_Produto = 7;

------------------------------------------

ALTER TABLE Pedidos
ADD Sem_estoque BOOLEAN;

--------------------------------------------

USE desafiofelipe;

UPDATE Produtos
SET Sem_estoque = true
WHERE ID_Produto != 2

USE desafiofelipe;

UPDATE Produtos
SET Sem_estoque = false
WHERE ID_Produto = 2;

----------------------------------------------

SELECT *
FROM Produtos
ORDER BY ID_Produto ASC
LIMIT 5;