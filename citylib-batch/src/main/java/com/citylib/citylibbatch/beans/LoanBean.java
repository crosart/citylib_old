package com.citylib.citylibbatch.beans;

import lombok.*;

import java.time.LocalDate;

@Data
public class LoanBean {

    private long id;
    private LocalDate due;
    private boolean returned;
    private boolean extended;
    private BookBean book;
    private UserBean user;
    private boolean expired;

}
