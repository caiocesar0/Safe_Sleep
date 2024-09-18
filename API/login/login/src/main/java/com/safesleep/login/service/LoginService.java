package com.safesleep.login.service;

import com.safesleep.login.dto.LoginDto;
import com.safesleep.login.model.LoginModel;
import com.safesleep.login.repository.LoginRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    @Autowired
    private LoginRepository repository;

    @Autowired
    private final ModelMapper modelMapper;

    public LoginModel validateLogin(LoginDto loginDto) {
        LoginModel login =  repository.findByUsername(loginDto.getUsername());
        if (login == null) {
            throw new EntityNotFoundException();
        } else if (login.getPassword().equalsIgnoreCase(loginDto.getPassword())) {
            return login;
        } else {
            throw new EntityNotFoundException();
        }
    }

    public Boolean createLogin(LoginDto loginDto) {
        LoginModel login = modelMapper.map(loginDto, LoginModel.class);
        try {
            repository.save(login);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Boolean changePassword(LoginDto loginDto) {
        LoginModel login = repository.findByUsername(loginDto.getUsername());

        if (login != null && login.getEmail().equalsIgnoreCase(loginDto.getEmail())) {
            assert loginDto.getPassword() != null;
            login.setPassword(loginDto.getPassword());
            try {
                repository.save(login);
                return true;
            } catch (EntityNotFoundException e) {
                return false;
            }
        } else {
            return false;
        }
    }

    public Boolean deleteLogin(LoginDto loginDto) {
        LoginModel login = repository.findByUsername(loginDto.getUsername());
        if (login != null) {
            try {
                repository.delete(login);
                return true;
            } catch (EntityNotFoundException e) {
                return false;
            }
        } else {
            return false;
        }
    }
}
