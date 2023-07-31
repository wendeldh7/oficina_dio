create database Oficina;
use Oficina;

-- criar tabela clientes
create table clientes(
	idCliente int auto_increment primary key,
    nomeCompleto varchar(45),
    contato varchar(15),
    tipo enum('PJ', 'PF') default 'PF',
    perfil enum('VIP', 'Padrão', 'Indicado') default 'Padrão'
);

-- criar tabela pedido
create table pedido(
	idPedido int auto_increment primary key,
    idCliente int,
    descricao varchar(255) not null,
    tipoPedido varchar(25) not null,
    prioridade enum('baixa', 'média', 'alta') default 'baixa',
    constraint fk_pedido_cliente foreign key(idCliente) references clientes(idCliente)
);

-- criar tabela responsavel
create table responsavel(
	idResponsavel int auto_increment primary key,
    setor varchar(45) not null,
    matricula varchar(15) not null,
    cargo varchar(45) not null
);

-- criação da tabela pedido gerado
create table pedido_gerado(
	idResponsavel int,
    idPedido int,
    setorResponsavel enum('help-desk', 'oficina Software', 'oficina Hardware', 'recepção', 'direção', 'administrativo') default 'help-desk',
    setorEncaminhado varchar(45) default null,
    dataCriacao datetime,
    primary key(idResponsavel, idPedido),
    constraint fk_pedido_gerado_responsavel 
		foreign key(idResponsavel) 
        references responsavel(idResponsavel),
	constraint fk_pedido_gerado_pedido
		foreign key(idPedido) 
        references pedido(idPedido)
);
-- criar tabela OS
create table OS(
    idResponsavel int,
    idPedido int,
    descricao varchar(255),
    prioridade enum('baixa', 'média', 'alta') default 'baixa',
    status enum('em andamento', 'recebido pelo setor técnico', 'aguardando peças', 'sem solução',
		'concluido com sucesso', 'entregue ao Cliente', 'finalizado'),
	primary key(idResponsavel, idPedido),
	constraint fk_pedido_gerado_OS
		foreign key(idResponsavel, idPedido) 
        references pedido_gerado(idResponsavel, idPedido)	
);


