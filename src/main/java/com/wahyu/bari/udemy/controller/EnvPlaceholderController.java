package com.wahyu.bari.udemy.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/environment")
public class EnvPlaceholderController {

     @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @GetMapping("/placeholder")
    public ResponseEntity<Map<String, String>> getEnvironment() {
        Map<String, String> placeholder = new HashMap<>();
        placeholder.put("username", username);
        placeholder.put("password", password);
        return ResponseEntity.ok(placeholder);
    }
}