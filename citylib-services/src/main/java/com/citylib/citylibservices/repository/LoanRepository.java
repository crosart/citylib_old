package com.citylib.citylibservices.repository;

import com.citylib.citylibservices.model.Loan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface LoanRepository extends JpaRepository<Loan, Long> {
    List<Loan> findByBookIdAndReturnedFalse(long id);
    List<Loan> findByDueLessThanEqualAndReturnedFalse(LocalDate date);
    List<Loan> findByUserId(long id);
}
