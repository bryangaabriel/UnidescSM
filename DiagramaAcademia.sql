CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `email` varchar(255) UNIQUE,
  `senha` varchar(255),
  `data_de_cadastro` timestamp,
  `data_de_atualizacao` timestamp
);

CREATE TABLE `personal` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `email` varchar(255) UNIQUE,
  `senha` varchar(255),
  `data_de_cadastro` timestamp,
  `data_de_atualizacao` timestamp
);

CREATE TABLE `planos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `preco` decimal(10, 2),
  `descricao` text
);

CREATE TABLE `alunos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `data_de_nascimento` date,
  `genero` varchar(255),
  `altura` decimal(5, 2),
  `peso` decimal(5, 2)
);

CREATE TABLE `Matriculas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `aluno_id` int,
  `plano_id` int,
  `data_de_inicio` date,
  `data_de_termino` date,
  `data_de_cadastro` timestamp,
  `data_de_atualizacao` timestamp
);

CREATE TABLE `exercicio_personal` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `descricao` text
);

CREATE TABLE `Aluno_Treinos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `aluno_id` int,
  `data_de_realizacao` date
);

CREATE TABLE `Treino_Exercicios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `exercicio_id` int,
  `series` int,
  `repeticoes` int,
  `carga` decimal(5, 2)
);

CREATE TABLE `Compras_De_Suplementos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` int,
  `data_da_compra` date,
  `produto` varchar(255),
  `quantidade` int,
  `preco_total` decimal(10, 2),
  `status_pagamento` varchar(255)
);

ALTER TABLE `Matriculas` ADD FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`);

ALTER TABLE `Matriculas` ADD FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`);

ALTER TABLE `Aluno_Treinos` ADD FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`);

ALTER TABLE `Treino_Exercicios` ADD FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio_personal` (`id`);

ALTER TABLE `Compras_De_Suplementos` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
