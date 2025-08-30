-- Criação do Banco de dados

create database Clinica_Odontológica;

-- Criação das tabelas e colunas

create table pacientes(
id serial primary key,
nome_completo varchar(100) not null,
cpf varchar(11) unique not null,
data_nascimento date not null,
telefone VARCHAR(15) not null,
email varchar unique not null,
endereco varchar(100) not null,
historico_consultas varchar(255)
);

create table consultas(
id serial primary key,
paciente varchar(100) not null,
dentista_responsavel varchar(100) not null,
data_consulta date not null,
hora_consulta time not null,
descricao_atendimento varchar(100) not null,
prescricao varchar (100) null
);

create table consultas_procedimentos(
id serial primary key,
consulta_id int not null,
procedimento_id int not null,
foreign key (consulta_id) references consultas (id), 
foreign key (procedimento_id) references procedimentos_odontologicos (id)
);


create table horarios_atendimento(
id serial primary key,
dentista_id int not null,
dia_semana varchar(20) not null,
hora_inicio time not null,
hora_fim time not null,
foreign key (dentista_id) references dentistas (id)
);


alter table consultas   
add column status varchar(20) not null check (status in ('agendado', 'disponivel'))


-- Criação da chave estrangeira

ALTER TABLE public.consultas 
ALTER COLUMN dentista_responsavel 
TYPE int USING dentista_responsavel::int;

ALTER TABLE public.consultas 
ALTER COLUMN paciente 
TYPE int USING paciente::int;


ALTER TABLE public.consultas 
ADD CONSTRAINT consultas_nome_paciente 
FOREIGN KEY (paciente) 
REFERENCES public.pacientes;

ALTER TABLE public.consultas 
ADD CONSTRAINT consultas_nome_dentista 
FOREIGN KEY (dentista_responsavel) 
REFERENCES public.dentistas;



ALTER TABLE consultas 
add column hora_consulta time not null;


create table dentistas(
id serial primary key,
nome_completo varchar(100) not null,
cpf varchar (11) not null,
cro varchar(50) not null,
especialidade varchar(50) not null,
horario_atendimento time not null
);

create table procedimentos_odontologicos(
id serial primary key,
nome varchar(100) not null,
descricao varchar (255) not null,
duracao_media varchar (100) not null
);

-- inserts na tabela pacientes


insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('William','11122233345','19-10-1995', '(24)87670000','will.p@.com','Nogueira', 'Limpeza Dentária')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Marcos','22233335345','29-04-1975', '(24)98470670','marc.p@.com','Nogueira', 'Canal')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('José','99927233325','05-03-1974', '(24)44670990','jose.p@.com','Correas', 'Ortondotia')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Carol','21375476588','21-10-1993', '(24)87672129','carol.p@.com','Quitandinha', 'Endodontia')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Ana','67877733695','20-11-1970', '(24)83240000','ana.p@.com','Alto da Serra', 'Periodontia ')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Cosme','11190033341','17-06-1969', '(24)87670000','cosme.p@.com','ALto da Serra', 'Dentística')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Messias','11128220945','25-05-1994', '(24)87675322','messi.p@.com','Bonfim', 'Implantodontia')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Carlos','00056699915','10-01-1960', '(24)876761123','carlos.p@.com','Bonfim', 'Harmonização Orofacial')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Vania','14567934100','05-07-1989', '(24)889670561','vania.p@.com','Correas', 'Estomatologia')

insert into pacientes (nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_consultas)
values ('Isabela','09824233178','09-07-2000', '(24)87511060','isa.p@.com','Centro', 'Radiologia')



select * from pacientes order by id asc

--inserção da tabela procedimentos odontologicos

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Limpeza (Profilaxia)', 'Remoção de placa bacteriana e tártaro para prevenir doenças gengivais e cáries',
'30 - 60 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Restauração (Obturação)', 'Reparo de dentes danificados por cáries, restaurando sua forma e função originais.',
'30 - 60 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Clareamento Dental', 'Aplicação de agentes clareadores para remover manchas e deixar os dentes mais brancos.',
'60 - 90 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Tratamento de Canal','Remoção da polpa infectada do dente para salvar a estrutura dental e aliviar a dor.',
'90 - 120 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Extração de Dente', 'Remoção de um dente que não pode ser recuperado ou para fins ortodônticos.', '20 - 40 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Implante Dentário', 'Substituição da raiz do dente por um pino de titânio que suportará uma coroa dentária',
'60 - 120 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Coroa Dentária', 'Cobertura que envolve um dente danificado para restaurar sua forma, tamanho e força.',
'60 - 90 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Aplicação de Flúor', 'Fortalecimento do esmalte dos dentes para torná-los mais resistentes às cáries.',
'10 - 15 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Raspagem Periodontal', 'Limpeza profunda abaixo da linha da gengiva para tratar doenças como a gengivite.',
'60 - 90 minutos');

insert into procedimentos_odontologicos (nome, descricao, duracao_media)
values ('Aparelho Ortodôntico', 'Correção do alinhamento dos dentes e da mandíbula para melhorar a mordida e a estética.',
'60 - 120 minutos');
 
select * from procedimentos_odontologicos 
select * from consultas_procedimentos 
select * from consultas 

ALTER TABLE public.consultas ALTER COLUMN paciente TYPE varchar USING paciente::varchar;

-- insert tabela dentistas

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Julio Cesar Silva', '12121212121', 'SP12345', 'Clínico Geral');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Nicolau Pereira Gomes', '17587984812', 'RJ54321', 'Ortodentia');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Thayane Senju Cruz', '19735678201', 'BA47345', 'Endodentista');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Claudia Unohana de Souza', '12765438921', 'PR12345', 'Periodontia');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Susana Ysane', '18429846721', 'ES12345', 'Implantodontia');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Drauzio Santos Rodrigues', '13538505932', 'AM12345', 'Odontopediatria');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Amélia Silva da Cruz', '12354367421', 'PR12345', 'Prótese Dentária');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Douglas Tesch Reis', '12765438921', 'RJ12398', 'Cirurgia Bucomaxilofacial');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Stanier Juno Sepulcro', '12765438921', 'SP13365', 'Odonto Estética');

insert into dentistas (nome_completo, cpf, cro, especialidade)
values('Ana Clara Lima Reis', '12765438921', 'BA12795', 'Clinico Geral');

select * from dentistas 

select 
horarios_atendimento.id as nome
from horarios_atendimento 
--insert na tabela consultas

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (1 ,1,'01/09/2025', '15:15','Limpeza dentária - ','cloroxedina 100mg para antissepsia. Creme fluoretado 1500ppm sensibilizante,  ', 'agendado')

insert into consultas (paciente, dentista_responsavel, data_consulta, hora_consulta, descricao_atendimento, prescricao, status)
values (11,6,'10/09/2025', '09:00','Canal','Alérgico à penicilina - Clindamicina 300 mg, 1 cápsula de 6/6h por 7 dias. ', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (10,7,'04-09-2025', '14:00','Ortodontia','Reajuste de aparelho MBT', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (9, 3,'05/09/2025', '10:30','Endondotia - relato de dores e desconforto','Ibuprofeno para dor e Betametasona para possíveis inflamações', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (8, 4,'01/09/2025', '09:30','Periodontia','Amoxilina 500mg+ Metronidazol 400mg, ambas a cada 8 horas por 10 dias','agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (7, 5,'03/09/2025', '10:00','Dentítica','inttrodução de lentes de contato', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (6, 8,'05/09/2025', '16:00','Implantodontia','alergico à dipirona - paracetamol 1g', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (5, 9,'10/09/2025', '14:00','Harmonização Orofacial','Anti-inflamatório: cetorolaco 10mg a cada 8 horas para control de dor e inflamação. Evitar exercícios físicos intensos e exposições solares prolonadas', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (4, 6,'12/09/2025', '14:30','Estomatologia','Amoxicilina um dia antes, continua por 7 dias após a cirurgia tomando a medicação.', 'agendado')

insert into consultas (paciente, dentista_responsavel ,data_consulta, hora_consulta, Descricao_atendimento, prescricao, status)
values (3, 10,'09/09/2025', '10:30','Radiologia','Raio x intrabucal', 'disponivel')

select * from consultas 



--insert tabela consultas_procedimentos


insert into consultas_procedimentos (consulta_id, procedimento_id)
values (16,1)

 insert into consultas_procedimentos (consulta_id, procedimento_id)
values (14,2)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (15,3)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (12,4)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (5,5)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (13,6)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (8,7)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (7,8)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (6,9)

insert into consultas_procedimentos (consulta_id, procedimento_id)
values (11, 10)

select * from consultas_procedimentos  

--inserção da tabela horarios atendimento

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (1, 'Segunda-feira', '09:00:00', '18:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (2, 'Quarta-feira', '07:15:00', '10:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (3, 'Sexta-feira', '14:30:00', '16:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (4, 'Sábado', '08:00:00', '11:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (5, 'Segunda-feira', '17:00:00', '18:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (6, 'Segunda-feira', '11:00:00', '11:30:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (7, 'Terça-Feira', '06:00:00', '16:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (8, 'Quarta-Feira', '08:00:00', '17:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (9, 'Quinta-Feira', '12:00:00', '21:00:00')

INSERT INTO horarios_atendimento (dentista_id, dia_semana, hora_inicio, hora_fim) 
VALUES (10, 'Sábado', '07:00:00', '17:00:00')

select * from dentistas 
ALTER TABLE public.horarios_atendimento ALTER COLUMN dia_semana TYPE varchar USING dia_semana::varchar;



-- consulta dos pacientes agengados

select 
    consultas.id,
    pacientes.nome_completo as paciente,
    dentistas.nome_completo as dentista,
    consultas.data_consulta,
    consultas.hora_consulta,
    consultas.descricao_atendimento,
    consultas.prescricao,
    consultas.status
from consultas 
join pacientes  on consultas.paciente = pacientes.id
join dentistas  on consultas.dentista_responsavel = dentistas.id;


select * from 
consulta_por_datas 

select 
    consultas.id,
    pacientes.nome_completo as paciente,
    dentistas.nome_completo as dentista,
    consultas.data_consulta,
    consultas.hora_consulta,
    consultas.descricao_atendimento,
    consultas.prescricao,
    consultas.status,
    dentistas.cpf,
    dentistas.cro,
    dentistas.especialidade 
from consultas 
join pacientes  on consultas.paciente = pacientes.id
join dentistas  on consultas.dentista_responsavel = dentistas.id;

-- realizar 3 updates com condição

UPDATE consultas
SET status = 'realizada'
WHERE id = 3;

update pacientes 
set telefone = '000000000'
where cpf =  '11122233345';

UPDATE consultas
SET prescricao = 'Reavaliar medicação'
WHERE status = 'atrasada';


--SQL de 3 exclusão de registros com condições em alguma tabela

delete from pacientes 
where cpf = '09824233278'

delete from pacientes 
where endereco = 'bonfim'

delete from dentistas 
where cro = 'RJ8864'


-- SQL de dois índices coerentes;

-- Indice idpaciente da tabela consulta

CREATE INDEX idx_consultas_paciente ON Consultas(paciente);

--indice id_dentista da tabela consulta também

CREATE INDEX idx_consultas_dentista ON Consultas(dentista_responsavel);



-- 1ª - Quantidade de consultas por especialidade: selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.


select dentistas.especialidade, count(consultas.id) as total_consultas
from dentistas 
left join consultas on dentistas.id = consultas.dentista_responsavel 
group by dentistas.especialidade 



-- 2ª - Quantidade de consultas realizadas por cada dentista: selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por cada um e exiba em ordem decrescente pela quantidade de consultas

select d.nome_completo, count(c.id) as quantidade_de_consultas 
from dentistas d
left join consultas c on d.id = c.dentista_responsavel 
group by d.nome_completo order by quantidade_de_consultas desc; 



--3ª - Pacientes com maior número de consultas: liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente pelo número de consultas.


select 
pacientes.nome_completo as paciente,
count(consultas.id) as total_consultas
from pacientes 
join consultas on pacientes.id = consultas.paciente
group by pacientes.nome_completo 
order by total_consultas desc;

-- 4ª criando uma View com lista de consultas ordenadas por data: 

create view consulta_por_datas as
select 
    consultas.id,
    pacientes.nome_completo as paciente,
    dentistas.nome_completo as dentista,
    consultas.data_consulta,
    procedimentos_odontologicos.nome as procedimentos_realizados
from consultas
join pacientes  on consultas.paciente = pacientes.id
join dentistas  on consultas.dentista_responsavel = dentistas.id
join consultas_procedimentos  on consultas.id =consultas_procedimentos.consulta_id 
join procedimentos_odontologicos on consultas_procedimentos.procedimento_id = procedimentos_odontologicos.id
order by data_consulta desc;

select * from consulta_por_datas 


-- 5ª - Média de consultas por dentista: calcule a média de consultas realizadas por dentista.


select avg (total_consultas ) as media_consultas
from(
select dentistas.nome_completo , count(*) as total_consultas
from consultas 
join dentistas on consultas.dentista_responsavel = dentistas.id 
group by dentistas.nome_completo 
) as consultas_por_dentista;





