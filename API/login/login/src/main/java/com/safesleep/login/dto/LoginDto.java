package com.safesleep.login.dto;

import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.annotation.Nonnull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LoginDto {

    @Nullable
    private Long id;

    @Nonnull
    private String username;

    @Nullable
    private String password;

    @Nullable
    private String email;

    @Nullable
    private String name;

}
