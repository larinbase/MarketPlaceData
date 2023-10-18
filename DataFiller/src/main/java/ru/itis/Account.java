package ru.itis;

import lombok.*;

import java.sql.Date;
import java.util.UUID;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Account {
    private UUID id;
    private String firstName;
    private String lastName;
    private Integer cityId;
    private String phoneNum;
    private String email;
    private String tag;
    private String patronymic;
    private Date birthday;
    private String profession;
    private String nationality;

}
