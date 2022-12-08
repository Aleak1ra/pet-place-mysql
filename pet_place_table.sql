
CREATE TABLE Login (
                ID_Login INT AUTO_INCREMENT NOT NULL,
                Usuario VARCHAR(20) NOT NULL,
                CPF INT NOT NULL,
                Email VARCHAR(50) NOT NULL,
                Telefone BIGINT NOT NULL,
                Nome VARCHAR(50) NOT NULL,
                Senha VARCHAR(10) NOT NULL,
                PRIMARY KEY (ID_Login)
);


CREATE TABLE Premium (
                ID_Premium INT AUTO_INCREMENT NOT NULL,
                ID_Login INT NOT NULL,
                DataInicial DATE NOT NULL,
                DataFinal DATE NOT NULL,
                PRIMARY KEY (ID_Premium, ID_Login)
);


CREATE TABLE Pets (
                ID_Pets INT AUTO_INCREMENT NOT NULL,
                Nome VARCHAR(20) NOT NULL,
                Idade INT NOT NULL,
                Raca VARCHAR(20) NOT NULL,
                Cor VARCHAR(25) NOT NULL,
                ID_Login INT NOT NULL,
                PRIMARY KEY (ID_Pets)
);


CREATE TABLE QRCODE (
                ID_Qrcode INT AUTO_INCREMENT NOT NULL,
                ID_Pets INT NOT NULL,
                PRIMARY KEY (ID_Qrcode, ID_Pets)
);


CREATE TABLE Score (
                ID_Score INT AUTO_INCREMENT NOT NULL,
                ID_Qrcode INT NOT NULL,
                PRIMARY KEY (ID_Score)
);


CREATE TABLE Contador (
                ID_Contador INT AUTO_INCREMENT NOT NULL,
                Contagem INT,
                Data DATE,
                ID_Score INT NOT NULL,
                ID_Login INT NOT NULL,
                PRIMARY KEY (ID_Contador)
);


ALTER TABLE Premium ADD CONSTRAINT login_premium_fk
FOREIGN KEY (ID_Login)
REFERENCES Login (ID_Login)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Contador ADD CONSTRAINT login_contador_fk
FOREIGN KEY (ID_Login)
REFERENCES Login (ID_Login)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pets ADD CONSTRAINT login_pets_fk
FOREIGN KEY (ID_Login)
REFERENCES Login (ID_Login)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE QRCODE ADD CONSTRAINT pets_qrcode_fk
FOREIGN KEY (ID_Pets)
REFERENCES Pets (ID_Pets)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Score ADD CONSTRAINT qrcode_score_fk
FOREIGN KEY (ID_Qrcode)
REFERENCES QRCODE (ID_Qrcode)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Contador ADD CONSTRAINT score_contador_fk
FOREIGN KEY (ID_Score)
REFERENCES Score (ID_Score)
ON DELETE NO ACTION
ON UPDATE NO ACTION;