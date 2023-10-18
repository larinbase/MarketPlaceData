package ru.itis;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AccountDAO {
    private final String HOST = "jdbc:postgresql://localhost:5432/MarketplaceDB";
    private final String USER = "postgres";
    private final String PASS = "1234";

    //language=sql
    private static final String SQL_SAVE = "insert into accounts(first_name, last_name, city_id, phone_num, email, tag, patronymic, birthday, profession, nationality) values (?,?,?,?,?,?,?,?,?,?)";

    public void save(Account account) {
        try (Connection connection = DriverManager.getConnection(HOST, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SAVE, PreparedStatement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, account.getFirstName());
            preparedStatement.setString(2, account.getLastName());
            preparedStatement.setInt(3, account.getCityId());
            preparedStatement.setString(4, account.getPhoneNum());
            preparedStatement.setString(5, account.getEmail());
            preparedStatement.setString(6, account.getTag());
            preparedStatement.setString(7, account.getPatronymic());
            preparedStatement.setDate(8, account.getBirthday());
            preparedStatement.setString(9, account.getProfession());
            preparedStatement.setString(10, account.getNationality());

            int affect = preparedStatement.executeUpdate();


            if (affect != 1) {
                throw new SQLException("Cannot insert account");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
