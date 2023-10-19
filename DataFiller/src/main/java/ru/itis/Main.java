package ru.itis;


import com.sun.jdi.connect.spi.Connection;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class Main {
    public static void main(String[] args) {

        final String HOST = "jdbc:postgresql://localhost:5432/MarketplaceDB";
        final String USER = "postgres";
        final String PASS = "1234";

        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setJdbcUrl(HOST);
        hikariConfig.setUsername(USER);
        hikariConfig.setPassword(PASS);
        hikariConfig.setDriverClassName("org.postgresql.Driver");

        HikariDataSource dataSource = new HikariDataSource(hikariConfig);

        AccountDAO accountDAO = new AccountDAO(dataSource);

        AccountFiller accountFiller = new AccountFiller();

        for (int i = 0; i < 1000; i++) {
            accountDAO.save(accountFiller.fill());
        }
    }
}