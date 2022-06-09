-- nome da base: urna_eletronica_5n
-- usuario do bd = senha = root

-- tabela de usuários do sistema
CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    usuario VARCHAR(20),
    senha VARCHAR(20)
);

-- tabela de eleições
CREATE TABLE tb_eleicao(
    idEleicao INT PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    nomeEleicao VARCHAR(20),
    descricao VARCHAR(100)
);

-- tabela de candidados das eleições (relação 1..1)
CREATE TABLE tb_candidato (
    idCandidado INT PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    nome VARCHAR(60),
    idEleicao INT,
     CONSTRAINT fk_candidato_eleicao FOREIGN KEY(idEleicao)
     REFERENCES tb_eleicao
);

-- tabela utilizada para registro dos votos
CREATE TABLE tb_votos(
    idUsuario INT,
    idEleicao INT,
    idCandidato INT,
     CONSTRAINT fk_voto_usuario FOREIGN KEY(idUsuario)
      REFERENCES usuario,   
     CONSTRAINT fk_voto_eleicao FOREIGN KEY(idEleicao)
      REFERENCES tb_eleicao,
     CONSTRAINT fk_voto_idCandidato FOREIGN KEY(idCandidato)
      REFERENCES tb_candidato
);