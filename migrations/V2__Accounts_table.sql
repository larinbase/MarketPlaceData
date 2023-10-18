-- добавление столбцов в таблицу аккаунт и навешивание constraint
alter table accounts
    add patronymic  varchar(50),
    add birthday    date,
    add profession  varchar(100),
    add nationality varchar(50),
    add check (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    add check ( phone_num  not like '%[^0-9]%'),
    add constraint email unique (email),
    add constraint phone_num unique (phone_num);

-- Изменение ID с serial на UUID

----Удаление связных по ID столбцов , чтобы удалить старый ID
alter table products_in_stock
    drop column producer_id;

alter table reviews
    drop column user_id;

---- Удаление старого ID и добавление нового
alter table accounts
    drop id,
    add id uuid primary key default uuid_generate_v4();

---- Возвращение связных по ID столбцов
alter table products_in_stock
    add column producer_id uuid NOT NULL,
    add constraint producer_id foreign key (producer_id) references accounts;

alter table reviews
    add column user_id uuid NOT NULL,
    add constraint user_id foreign key (user_id) references accounts;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Добавлнение комментария с описанием сути таблицы
comment on table accounts is 'Покупатели и продавцы';