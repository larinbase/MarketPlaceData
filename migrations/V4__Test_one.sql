create table projects
(
    id           uuid primary key default uuid_generate_v4(),
    name         varchar(255),
    description  varchar(1000),
    date_start   date not null    default CURRENT_DATE,
    status       varchar(50),
    project_type varchar(50),
    location     varchar(255)
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table users
(
    id         uuid primary key default uuid_generate_v4(),
    first_name varchar(50)  NOT NULL,
    last_name  varchar(50)  NOT NULL,
    phone_num  varchar(50)  NOT NULL unique,
    email      varchar(100) NOT NULL unique,
    role       varchar(50)  NOT NULL,
    constraint email check (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    constraint phone_num check ( phone_num not like '%[^0-9]%')
);


create table tasks
(
    id         bigserial primary key,
    name       varchar(255) NOT NULL,
    comment    varchar(2500),
    link       varchar(200),
    project_id uuid         NOT NULL,
    priority   int,
    foreign key (project_id) references projects (id)
);

create table projects_users
(
    project_id uuid not null,
    user_id    uuid not null,
    foreign key (project_id) references projects (id),
    foreign key (user_id) references users (id)
);


-- заполнение проекта
INSERT INTO projects (name, description, date_start, status, project_type, location, id)
VALUES ('Проект 1', 'Описание проекта 1', '2023-5-20', 'В работе', 'IT', 'Нью-Йорк',
        'e2aefc29-239b-4684-a18c-00a6790d59ea'),
       ('Проект 2', 'Описание проекта 2', '2023-4-20', 'Завершен', 'Строительство', 'Лондон',
        '45c06fde-2dae-4efe-9c29-881914598f26'),
       ('Проект 3', 'Описание проекта 3', '2023-3-20', 'Завершен', 'Маркетинг', 'Париж',
        '990fa362-18f7-4ad9-982f-22d5b056e719'),
       ('Проект 4', 'Описание проекта 4', '2023-2-20', 'В работе', 'IT', 'Сан-Франциско',
        '5f5d86c9-fc46-4bd8-85c1-7b4b8cc0af24'),
       ('Проект 5', 'Описание проекта 5', '2023-11-20', 'Планируется', 'IT', 'Токио',
        '64c66846-b217-4d03-828f-414ef32c7375');

--  заполнение задачи
INSERT INTO tasks (name, comment, link, project_id, priority)
VALUES ('Задача 1', 'Краткий комментарий к задаче 1', 'http://example.com/task1',
        'e2aefc29-239b-4684-a18c-00a6790d59ea', 1),
       ('Задача 2', 'Краткий комментарий к задаче 2', 'http://example.com/task2',
        '45c06fde-2dae-4efe-9c29-881914598f26', 2),
       ('Задача 3', 'Краткий комментарий к задаче 3', 'http://example.com/task3',
        '990fa362-18f7-4ad9-982f-22d5b056e719', 3),
       ('Задача 4', 'Краткий комментарий к задаче 4', 'http://example.com/task4',
        '5f5d86c9-fc46-4bd8-85c1-7b4b8cc0af24', 4),
       ('Задача 5', 'Краткий комментарий к задаче 5', 'http://example.com/task5',
        '64c66846-b217-4d03-828f-414ef32c7375', 5);

-- заполнение пользователя
INSERT INTO users (first_name, last_name, phone_num, email, role)
VALUES ('Иван', 'Иванов', '1234567890', 'ivan@example.com', 'Пользователь'),
       ('Мария', 'Петрова', '9876543210', 'maria@example.com', 'Администратор'),
       ('Алексей', 'Смирнов', '5551234567', 'alex@example.com', 'Модератор'),
       ('Ольга', 'Козлова', '6667778888', 'olga@example.com', 'Пользователь'),
       ('Павел', 'Сидоров', '1110009999', 'pavel@example.com', 'Менеджер');

