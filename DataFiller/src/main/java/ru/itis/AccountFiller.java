package ru.itis;

import net.datafaker.Faker;

import java.sql.Date;


public class AccountFiller {
    Faker faker;
    String[] list = new String[]{"user", "producer"};

    public AccountFiller() {
        faker = new Faker();
    }

    public Account fill() {
        return Account.builder()
                .firstName(faker.name().firstName())
                .lastName(faker.name().lastName())
                .cityId(faker.random().nextInt(1,5))
                .phoneNum(faker.phoneNumber().subscriberNumber(10))
                .email(faker.internet().emailAddress())
                .tag(list[faker.random().nextInt(0,1)])
                .patronymic(faker.name().firstName())
                .birthday(Date.valueOf(faker.date().birthday(1, 110).toLocalDateTime().toLocalDate()))
                .profession(faker.job().title())
                .nationality(faker.nation().nationality())
                .build();
    }
}

