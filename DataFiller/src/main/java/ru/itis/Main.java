package ru.itis;



public class Main {
    public static void main(String[] args) {

        AccountDAO acountDAO = new AccountDAO();
        AccountFiller accountFiller = new AccountFiller();

        for (int i = 0; i < 1000; i++) {
            acountDAO.save(accountFiller.fill());
        }

    }
}