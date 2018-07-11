-- *****************************************************
-- CRIACAO DO BANCO DE DADOS
-- *****************************************************
CREATE DATABASE BD_HomeService
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- *****************************************************
-- CRIACAO DAS TABELAS
-- *****************************************************

USE BD_HomeService;

-- *****************************************************
-- Tabela..........: USUARIO
-- Elemento do DER.: Entidade Usuario
-- *****************************************************
CREATE TABLE IF NOT EXISTS USUARIO(
  ID_Usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  DataDeNascimento Date,
  Telefone VARCHAR(15),
  Email VARCHAR(35) UNIQUE KEY,
  Login VARCHAR(30) NOT NULL UNIQUE KEY,
  Senha VARCHAR(62) NOT NULL,
  FotoDoPerfil VARCHAR(200)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: RECLAMACAO
-- Elemento do DER.: Entidade Reclamacao
-- *****************************************************
CREATE TABLE IF NOT EXISTS RECLAMACAO (
  ID_Rec INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Email VARCHAR(30) NOT NULL,
  Assunto VARCHAR(30) NOT NULL,
  Mensagem TEXT NOT NULL

)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: MAISSERVICO
-- Elemento do DER.: Entidade MaisServico
-- *****************************************************
CREATE TABLE IF NOT EXISTS MAISSERVICO (
  ID_MaisServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Valor FLOAT NOT NULL,
  Nova_Categoria VARCHAR(30) NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: MAISVISIBILIDADE
-- Elemento do DER.: Entidade MaisVisibilidade
-- *****************************************************
CREATE TABLE IF NOT EXISTS MAISVISIBILIDADE (
  ID_MaisVisibilidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Valor FLOAT NOT NULL,
  Nova_Categoria VARCHAR(30) NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: LOCALIZACAO
-- Elemento do DER.: Entidade Localizacao
-- *****************************************************
CREATE TABLE IF NOT EXISTS LOCALIZACAO (
  ID_Localizacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pais VARCHAR(30) NOT NULL DEFAULT 'Brasil',
  Estado VARCHAR(30) NOT NULL,
  CEP VARCHAR(10) NOT NULL,
  Cidade VARCHAR(30) NOT NULL,
  Rua VARCHAR(30) NOT NULL,
  Numero INT NOT NULL,
  Latitude FLOAT NOT NULL,
  Longitude FLOAT NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: COMPROMISSO
-- Elemento do DER.: Entidade Compromisso
-- *****************************************************
CREATE TABLE IF NOT EXISTS COMPROMISSO (
  ID_Compromisso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DataComp DATE NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: SERVICO
-- Elemento do DER.: Entidade Servico
-- *****************************************************
CREATE TABLE IF NOT EXISTS SERVICO (
  ID_Servico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  StatusDeContratacao BOOLEAN NOT NULL DEFAULT FALSE,
  Prioridade INT NOT NULL DEFAULT 0,
  Categoria VARCHAR(50) NOT NULL,
  Descricao TEXT,
  Latitude FLOAT NOT NULL,
  Longitude FLOAT NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: CONTRACACAO
-- Elemento do DER.: Entidade Contratacao
-- *****************************************************
CREATE TABLE IF NOT EXISTS CONTRATACAO (
  ID_Contratacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Data DATE NOT NULL,
  idContratante INT NOT NULL,
  idServico INT NOT NULL,
  FOREIGN KEY (idContratante) REFERENCES USUARIO(ID_Usuario),
  FOREIGN KEY (idServico) REFERENCES SERVICO(ID_Servico)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: NOTIFICACAOCONTRACACAO
-- Elemento do DER.: Entidade Mensagem
-- *****************************************************
CREATE TABLE IF NOT EXISTS NOTIFICACAOCONTRACACAO (
  ID_NotificacaoContratacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idContratacao int NOT NULL,
  Status BOOLEAN,
  FOREIGN KEY (idContratacao) REFERENCES CONTRATACAO(ID_Contratacao)
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: CONTRACACAOPENDENTE
-- Elemento do DER.: Entidade ContratacaoPendente
-- *****************************************************
CREATE TABLE IF NOT EXISTS CONTRATACAOPENDENTE (
  ID_ContratacaoPendente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Data DATE NOT NULL,
  idContratante INT NOT NULL,
  idPrestador INT NOT NULL,
  idServico INT NOT NULL,
  FOREIGN KEY (idContratante) REFERENCES USUARIO(ID_Usuario),
  FOREIGN KEY (idPrestador) REFERENCES USUARIO(ID_Usuario),
  FOREIGN KEY (idServico) REFERENCES SERVICO(ID_Servico)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: REQUISICAOSERVICO
-- Elemento do DER.: Entidade RequisicaoServico
-- *****************************************************
CREATE TABLE IF NOT EXISTS REQUISICAOSERVICO (
  ID_Requisicao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Titulo VARCHAR(30) NOT NULL,
  LocalServ VARCHAR(30) NOT NULL,
  Descricao TEXT,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: GALERIA
-- Elemento do DER.: Entidade Galeria
-- *****************************************************
CREATE TABLE IF NOT EXISTS GALERIA (
  idUsuario INT NOT NULL,
  URL_Imagem VARCHAR(200),
  FOREIGN KEY (idUsuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: ADMINISTRADOR
-- Elemento do DER.: Entidade Administrador
-- *****************************************************
CREATE TABLE IF NOT EXISTS ADMINISTRADOR (
  ID_Adm INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL UNIQUE KEY,
  Login VARCHAR(30) NOT NULL UNIQUE KEY,
  Senha VARCHAR(30) NOT NULL,
  Email VARCHAR(35) NOT NULL UNIQUE KEY
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: ACAO
-- Elemento do DER.: Entidade Acao
-- *****************************************************
CREATE TABLE IF NOT EXISTS ACAO (
  ID_Acao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DataAcao date NOT NULL,
  Dado VARCHAR(30) NOT NULL,
  Descricao TEXT,
  idAdm INT NOT NULL,
  FOREIGN KEY (idAdm) REFERENCES ADMINISTRADOR(ID_Adm)
)ENGINE = INNODB;

-- *****************************************************
-- Tabela..........: QUALIFICACAOCON
-- Elemento do DER.: Entidade QualificacaoContratante
-- *****************************************************
CREATE TABLE IF NOT EXISTS QUALIFICACAOCON (
  ID_QualificacaoCon INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  notaDeAvaliacao INT NOT NULL,
  comentario TEXT,
  idContratante INT NOT NULL,
  idPrestador INT NOT NULL,
  FOREIGN KEY (idContratante) REFERENCES USUARIO(ID_Usuario),
  FOREIGN KEY (idPrestador) REFERENCES USUARIO(ID_Usuario)
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: QUALIFICACAOSERV
-- Elemento do DER.: Entidade QualificacaoServico
-- *****************************************************
CREATE TABLE IF NOT EXISTS QUALIFICACAOSERV (
  ID_QualificacaoServ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  notaDeAvaliacao INT NOT NULL,
  comentario TEXT,
  idServico INT NOT NULL,
  idContratante INT NOT NULL,
  FOREIGN KEY (idServico) REFERENCES SERVICO(ID_Servico),
  FOREIGN KEY (idContratante) REFERENCES USUARIO(ID_Usuario)
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: MENSAGEM
-- Elemento do DER.: Entidade Mensagem
-- *****************************************************
CREATE TABLE IF NOT EXISTS MENSAGEM (
  ID_Mensagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idRemetente INT NOT NULL,
  idDestinatario INT NOT NULL,
  Texto TEXT,
  HoraMensagem DATETIME,
  FOREIGN KEY (idRemetente) REFERENCES USUARIO(ID_Usuario),
  FOREIGN KEY (idDestinatario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: NOTIFICACAOMENSAGEM
-- Elemento do DER.: Entidade Mensagem
-- *****************************************************
CREATE TABLE IF NOT EXISTS NOTIFICACAOMENSAGEM (
  ID_NotificacaoMensagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idMensagem int NOT NULL,
  Status BOOLEAN,
  FOREIGN KEY (idMensagem) REFERENCES MENSAGEM(ID_Mensagem)
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: BOLETIM
-- Elemento do DER.: Entidade BoletimInformativo
-- *****************************************************
CREATE TABLE IF NOT EXISTS BOLETIM (
  ID_Boletim INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Email VARCHAR(35) NOT NULL UNIQUE KEY
)ENGINE = InnoDB;

-- *****************************************************
-- Tabela..........: FAVORITOS
-- Elemento do DER.: Entidade FAVORITOS
-- *****************************************************
CREATE TABLE IF NOT EXISTS FAVORITOS (
  ID_Favorito INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idServico INT NOT NULL,
  idContratante INT NOT NULL,
  FOREIGN KEY (idServico) REFERENCES SERVICO(ID_Servico),
  FOREIGN KEY (idContratante) REFERENCES USUARIO (ID_Usuario)
)ENGINE = InnoDB;
-- *****************************************************
-- Tabela..........: DENUNCIASERV
-- Elemento do DER.: Entidade DenunciaServico
-- *****************************************************
CREATE TABLE IF NOT EXISTS DENUNCIASERV (
  ID_DenunciaServ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  motivo VARCHAR(30) NOT NULL,
  Descricao TEXT NOT NULL,
  ID_Servico INT NOT NULL,
  ID_Usuario INT NOT NULL,
  FOREIGN KEY (ID_Servico) REFERENCES SERVICO(ID_Servico),
  FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario)
)ENGINE = InnoDB;

