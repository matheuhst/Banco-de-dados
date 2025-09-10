CREATE TABLE hospedes (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TYPE quarto_tipo_enum AS ENUM ('Solteiro', 'Casal', 'Família');

CREATE TABLE quartos (
    quarto_id SERIAL PRIMARY KEY,
    tipo quarto_tipo_enum,
    andar INT NOT NULL CHECK (andar > 0),
    valor_diaria DECIMAL(10,2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario > 0)
);

CREATE TYPE categoria_servico_enum AS ENUM ('Zeladoria', 'Roupas', 'Estacionamento', 'Alimentação');

CREATE TABLE servicos (
    servico_id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    categoria categoria_servico_enum,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0)
);

CREATE TABLE colaboradores (
    rf SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE TABLE servicos_colaboradores (
    servico_colaborador_id SERIAL PRIMARY KEY,
    servico_id INT NOT NULL,
    rf_colaborador INT NOT NULL,
    FOREIGN KEY (servico_id) REFERENCES servicos(servico_id),
    FOREIGN KEY (rf_colaborador) REFERENCES colaboradores(rf)
);


CREATE TABLE consumos_produtos (
    consumo_produto_id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    total DECIMAL (10,2) NOT NULL,
    data TIMESTAMP DEFAULT now(),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

CREATE TABLE consumos_servicos (
    consumo_servico_id SERIAL PRIMARY KEY,
    servico_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    total DECIMAL (10,2) NOT NULL,
    data TIMESTAMP DEFAULT now(),
    servico_colaborador_id INT NOT NULL,
    FOREIGN KEY (servico_colaborador_id) REFERENCES servicos_colaboradores(servico_colaborador_id)
);

CREATE TYPE forma_pagamento_enum AS ENUM ('PIX', 'Cartão de crédito');
CREATE TYPE status_pagamento_enum AS ENUM ('Pendente', 'Finalizado');

CREATE TABLE reservas(
    reserva_id SERIAL PRIMARY KEY,
    cpf_hospede VARCHAR(11) NOT NULL,
    quarto_id INT NOT NULL,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL,
    total_consumos DECIMAL(10,2) DEFAULT 0.0 CHECK (total_consumos > 0),
    total_servicos DECIMAL(10,2) DEFAULT 0.0 CHECK (total_servicos > 0),
    percentual_desconto DECIMAL(10,2) DEFAULT 0.0 CHECK (percentual_desconto <= 100),
    total_reserva DECIMAL (10,2) DEFAULT 0.0 CHECK (total_reserva > 0),
    forma_pagamento forma_pagamento_enum,
    status status_pagamento_enum,
    avaliacao TEXT,
    FOREIGN KEY (cpf_hospede) REFERENCES hospedes(cpf),
    FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id)
);

CREATE TABLE reservas_consumos (
    reserva_consumo_id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL,
    consumo_produto_id INT NOT NULL,
    consumo_servico_id INT NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (consumo_produto_id) REFERENCES consumos_produtos(consumo_produto_id),
    FOREIGN KEY (consumo_servico_id) REFERENCES consumos_servicos(consumo_servico_id)
)
