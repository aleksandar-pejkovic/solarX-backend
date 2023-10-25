package com.alpey.solarXbackend.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.alpey.solarXbackend.model.entity.User;
import com.alpey.solarXbackend.repository.UserRepository;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {UserService.class})
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @Test
    public void whenCreateUser_thenReturnNewUser() {
        User user = new User();
        user.setUsername("John89");
        user.setEmail("john@example.com");

        when(userRepository.save(any(User.class))).thenReturn(user);

        User created = userService.createUser(user);

        assertEquals(user.getUsername(), created.getUsername());
        assertEquals(user.getEmail(), created.getEmail());
    }

    @Test
    public void whenCreateUser_withNull_thenReturnException() {
        assertThrows(IllegalArgumentException.class, () -> userService.createUser(null));
    }
}