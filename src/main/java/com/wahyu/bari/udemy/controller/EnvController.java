 package com.wahyu.bari.udemy.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/environment")
 public class EnvController {

 @Value("${app.message}")
    private String message;

    @GetMapping("/message")
    public ResponseEntity<String> getEnvironment() {
        return ResponseEntity.ok(message);
    }

 }

