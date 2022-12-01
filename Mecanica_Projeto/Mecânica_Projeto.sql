-- Mecânica
create database Mecânica
use Mecânica;

-- criar tabela cliente
create table cliente(
idCliente int auto_increment primary key,
Nome varchar(45),
Identificador int,
Endereço varchar(45),
Contato int,
constraint fk_Cliente_Veículo foreign key (idVeículo) references Veículo(idVeículo)
);

create table Veículo(
idVeículo int auto_increment primary key,
Modelo varchar(45),
Placa varchar(45),
Cor varchar(45),
Ano date,
constraint fk_Veículo_TipodeServico foreign key (idTipodeServico) references TipodeServico(idTipodeServico)
);

create table TipodeServiço(
idTipodeServico int auto_increment primary key,
Revisao varchar(45),
Conserto varchar(45),
constraint fk_TipodeServico_OrdemdeServico foreign key (idTipodeServico) references OrdemdeServico(idOdemdeServico)
);

create table OrdemdeServico(
idOrdemdeServico int auto_increment primary key,
OdNúmero int,
OdData date,
OdValorServico int,
OdValorPecas int,
OdPrazodeEntrega date,
OdValorTotal int,
OdStatus varchar(45),
constraint fk_OrdemdeServico_TabeladePrecos foreign key (idTabeladePreco) references idTabeladePreco(idTabeladePreco),
constraint fk_OrdemdeServico_Pagamento foreign key (idPagamento) references idPagamento(idPagamento)
);

create table AutorizacaodoCliente(
constraint fk_OrdemdeServico_Cliente_OrdemdeServico foreign key (idOrdemdeServico) references idOrdemdeServico(idOrdemdeServico) 
);

create table EquipeMecanica(
idEquipeMecanica int auto_increment primary key,
Avaliacao varchar(45),
Execucao varchar(45),
constraint fk_EquipeMecanica_OrdemdeServico1 foreign key (idOrdemdeServico) references idOrdemdeServico(idOrdemdeServico) 
);

create table Mecanico(
idMecanico int auto_increment primary key,
MNome varchar(45),
Matricula int,
MEndereco varchar(45),
Especialidade varchar(45),
constraint fk_Mecanico_EquipeMecanica foreign key (idEquipeMecanica) references idEquipeMecanica(idEquipeMecanica)
);

create table Pagamento(
idPagamento int auto_increment primary key,
CartaodeCredito varchar(45),
CartaodeDebito varchar(45),
Pix varchar(45),
TransferenciaBancaria varchar(45)
);

create table TabeladePrecos(
idTabeladePrecos int auto_increment primary key,
TabelaServico varchar(255),
TabelaPecas varchar(255)
);