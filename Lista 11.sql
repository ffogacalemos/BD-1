use banco;

select nome
from cliente c
where c.cpf not in(select cpf_cli from
telefone_cliente);

create view vDADOS_BANCARIOS as
select nome, Numero_conta, Saldo
from conta, historico, cliente
where Numero_conta = Num_conta and cpf_cliente = cpf;

SELECT * FROM banco.vdados_bancarios;

create view vAGENCIA_INFO as
select nome, num_agencia, count(*), sum(saldo)
from banco, agencia, conta
where codigo = cod_banco and num_agencia = numero_agencia
group by nome;


SELECT * FROM banco.vagencia_info;

DROP VIEW vagencia_info;


select numero_agencia, MAX(saldo), MIN(saldo), AVG(saldo), sum(saldo)
from agencia, conta
where  num_agencia = numero_agencia
group by numero_agencia;

select cliente.Nome
from cliente, agencia, banco, historico, conta
where  cliente.cpf = historico.Cpf_cliente and 
historico.Num_conta = conta.Numero_conta and
conta.num_agencia = agencia.Numero_agencia and agencia.Cod_banco = banco.banco.codigo 
and banco.banco.Nome = 'Banco do  Brasil';

alter table agencia add column qtd_contas int;

delimiter $$
create trigger tQTDE_CONTAS
after insert on conta
for each row
begin
update agencia set qtd_contas =  (select count(*) from conta where conta.num_agencia = numero_agencia);
end $$
delimiter ;

INSERT INTO CONTA VALUES
('12345-2',700.00,1,3153);

drop trigger tQTDE_CONTAS;