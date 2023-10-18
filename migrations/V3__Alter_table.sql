-- reviews fix: Замена review_id на id и добавление комментария
alter table reviews
    drop review_id,
    add id uuid not null;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
comment on table reviews is 'Отзывы на товар';

-- Комменты на остальные таблицы
comment on table cities is 'Города';
comment on table product_attributes is 'Атрибуты товаров';
comment on table products is 'Товары';
comment on table products_attributes_values is 'Товар - атрибут';
comment on table products_in_stock is 'Товары в наличии';

