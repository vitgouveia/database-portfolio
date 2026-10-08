CREATE TABLE cliente(
    cod_cliente VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);
CREATE TABLE categoria(
    cod_categoria VARCHAR(10) PRIMARY KEY,
    desc_categoria VARCHAR(80) NOT NULL,
    valor FLOAT NOT NULL
);
CREATE TABLE veiculo(
    cod_veiculo VARCHAR[10] PRIMARY KEY,
    placa VARCHAR(20) NOT NULL,
    modelo VARCHAR(40) NOT NULL,
    ano_veiculo YEAR NOT NULL,
    cod_categoria VARCHAR(10),

    CONSTRAINT fk_categoria FOREIGN KEY cod_categoria REFERENCES categoria(cod_categoria)
);
CREATE TABLE opcional(
    cod_opcional VARCHAR(10) PRIMARY KEY,
    desc_opcional VARCHAR(80) NOT NULL,
    valor_opcional FLOAT NOT NULL
);
CREATE TABLE locacao(
    num_locacao VARCHAR(10) PRIMARY KEY,
    data_retirada DATE NOT NULL,
    cod_cliente VARCHAR(10) NOT NULL,
    cod_veiculo VARCHAR(10) NOT NULL,
    qtd_dias INT NOT NULL,

    CONSTRAINT fk_cliente FOREIGN KEY cod_cliente REFERENCES cliente(cod_cliente),
    CONSTRAINT fk_veiculo FOREIGN KEY cod_veiculo REFERENCES veiculo(cod_veiculo)
);
CREATE TABLE locacao_opcional(
    num_locacao VARCHAR(10) NOT NULL,
    cod_opcional VARCHAR(10) NOT NULL,

    CONSTRAINT pk_locacao_opcional PRIMARY KEY (num_locacao, cod_opcional),
    CONSTRAINT fk_opcional FOREIGN KEY cod_opcional REFERENCES opcional(cod_opcional),
    CONSTRAINT fk_locacao FOREIGN KEY num_locacao REFERENCES locacao(num_locacao)
);