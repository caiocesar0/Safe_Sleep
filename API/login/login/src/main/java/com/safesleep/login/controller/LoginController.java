package com.safesleep.login.controller;

import com.safesleep.login.dto.LoginDto;
import com.safesleep.login.model.LoginModel;
import com.safesleep.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService service;

    @GetMapping()
    public ResponseEntity<LoginModel> validateLogin(@RequestBody @Validated LoginDto loginDto) {
        try {
            LoginModel login = service.validateLogin(loginDto);
            return ResponseEntity.ok().body(login);
        }catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping()
    public ResponseEntity<Void> createLogin(@RequestBody @Validated LoginDto loginDto) {
        Boolean success = service.createLogin(loginDto);
        if (success) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping()
    public ResponseEntity<Void> changePassword(@RequestBody @Validated LoginDto loginDto) {
        Boolean success = service.changePassword(loginDto);
        if (success) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}
