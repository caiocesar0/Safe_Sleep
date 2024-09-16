package com.safesleep.login.repository;

import com.safesleep.login.model.LoginModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LoginRepository extends JpaRepository<LoginModel, Long> {

    @Query(value = "SELECT p FROM LoginModel p WHERE p.username = :username")
    LoginModel findByUsername(String username);

}

