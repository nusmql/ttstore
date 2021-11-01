drop database if exists tecnotree_store;
drop user if exists 'tecnotree_store'@'%';
-- create db and db user
create database tecnotree_store default character set utf8mb4 collate utf8mb4_unicode_ci;
use tecnotree_store;
create user 'ttstore'@'%' identified by 'ttstore123456';
grant all privileges on tecnotree_store.* to 'ttstore'@'%';
flush privileges;
