USE desafiofelipe;

------------------------------------------------------

CREATE TABLE Livros (
	ID_Livro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(50),
    Autor VARCHAR(50),
    Valor DECIMAL(10, 2),
    Sinopse TEXT,
    AnoPublicacao INT,
    Idioma VARCHAR(20)
);

----------------------------------------------------------------------------------------

USE desafiofelipe;

INSERT INTO Livros (AnoPublicacao, Autor, Idioma, Sinopse, Titulo, Valor)
VALUES
(1612, 'Miguel de Cervantes', 'Português', '...', 'Dom Quixote', 30.00),
(1859, 'Charles Dickens', 'Português', '...', 'Um Conto de Duas Cidades', 40.00),
(1954, 'J. R. R. Tolkien', 'Português', '...', 'O Senhor dos Anéis', 60.00),
(1943, 'Antoine de Saint-Exupéry', 'Português', '...', 'O Pequeno Príncipe', 35.00),
(1997, 'J.K. Rowling', 'Português', '...', 'Harry Potter e a Pedra Filosofal', 45.00),
(1939, 'Agatha Christie', 'Português', '...', 'E Não Sobrou Nenhum', 42.00),
(1754, 'Cao Xueqin', 'Português', '...', 'O Sonho da Câmara Vermelha', 47.00),
(1886, 'H. Rider Haggard', 'Português', '...', 'Ela, a Feiticeira', 37.00),
(1886, 'C.S. Lewis', 'Português', '...', 'O Leão, a Feiticeira e o Guarda-Roupa', 32.00),
(2003, 'Dan Brown', 'Português', '...', 'O Código de Vinci', 50.00)

--------------------------------------------------------------------------------------------

CREATE TABLE Autores (
    ID_Autor INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100),
    Nacionalidade VARCHAR(50),
    Genero VARCHAR(50),
    AnoNascimento INT,
    Vendas INT
);

------------------------------------------------------------------------------

INSERT INTO Autores(AnoNascimento, Genero, Nacionalidade, Nome, Vendas) VALUES
(1547,  'Romance, Teatro, Poesia', 'Espanhol', 'Miguel de Cervantes', 2000),
(1812, 'Romance', 'Inglês', 'Charles Dickens', 3000),
(1892, 'Fantasia', 'Inglês', 'J. R. R. Tolkien', 1500),
(1900, 'Romance, Infantil', 'Francês', 'Antoine de Saint-Exupéry', 3500),
(1965, 'Fantasia, Drama', 'Inglês', 'J. K. Rowling', 4000);

--------------------------------------------------------------------------

CREATE TABLE Emprestimos (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
	Quantidade_Itens INT,
    Data DATE,
    Tipo VARCHAR(100),
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

-------------------------------------------------------------------------

CREATE TABLE Clientes (
    ID_Cliente INT FOREIGN KEY AUTO_INCREMENT,
    Nome VARCHAR(100)
);

-----------------------------------------------------------

INSERT INTO Emprestimos (Quantidade_Itens, Data, Tipo, ID_Cliente, ID_Livro) VALUES
(1, '2001-01-01', 'Longo Prazo', 1, 1),
(1, '2001-01-01', 'Longo Prazo', 1, 2),
(1, '2001-01-01', 'Longo Prazo', 1, 3),
(1, '2001-01-01', 'Curto Prazo', 1, 4),
(1, '2001-01-01', 'Curto Prazo', 1, 5),
(1, '2001-01-01', 'Curto Prazo', 1, 6),
(1, '2002-02-02', 'Longo Prazo', 2, 1),
(1, '2002-02-02', 'Longo Prazo', 2, 2),
(1, '2002-02-02', 'Longo Prazo', 2, 3),
(1, '2002-02-02', 'Curto Prazo', 2, 4),
(1, '2002-02-02', 'Curto Prazo', 2, 5),
(1, '2002-02-02', 'Curto Prazo', 2, 6),
(1, '2003-03-03', 'Longo Prazo', 3, 7),
(1, '2003-03-03', 'Longo Prazo', 3, 8),
(1, '2003-03-03', 'Curto Prazo', 3, 9),
(1, '2003-03-03', 'Curto Prazo', 3, 10),
(1, '2004-04-04', 'Longo Prazo', 4, 7),
(1, '2004-04-04', 'Longo Prazo', 4, 8),
(1, '2004-04-04', 'Curto Prazo', 4, 9),
(1, '2004-04-04', 'Curto Prazo', 4, 10),
(1, '2005-05-05', 'Longo Prazo', 5, 1),
(1, '2005-05-05', 'Longo Prazo', 5, 2),
(1, '2005-05-05', 'Curto Prazo', 5, 3),
(1, '2005-05-05', 'Curto Prazo', 5, 4),
(1, '2001-01-01', 'Longo Prazo', 1, 7),
(1, '2001-01-01', 'Longo Prazo', 1, 8),
(1, '2005-05-05', 'Curto Prazo', 5, 5),
(1, '2002-02-02', 'Longo Prazo', 2, 7),
(1, '2003-03-03', 'Curto Prazo', 3, 1),
(1, '2004-04-04', 'Longo Prazo', 4, 1);

------------------------------------------------------------------

USE desafiofelipe;

SELECT Emprestimos.ID_Cliente, Clientes.Nome, SUM(Emprestimos.Quantidade_Itens * Livros.Valor) AS Valor_Total, SUM(Emprestimos.Quantidade_Itens)
FROM Emprestimos
INNER JOIN Livros ON Emprestimos.ID_Livro = Livros.ID_Livro
INNER JOIN Clientes ON Emprestimos.ID_Cliente = Clientes.ID_Cliente
GROUP BY Emprestimos.ID_Cliente;

------------------------------------------------------------------------