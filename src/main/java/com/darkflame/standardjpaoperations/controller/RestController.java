package com.darkflame.standardjpaoperations.controller;

import com.darkflame.standardjpaoperations.entity.Users;
import com.darkflame.standardjpaoperations.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")

public class RestController {

    private final UsersService usersService;

    public RestController(UsersService usersService) {
        this.usersService = usersService;
    }

    @GetMapping("/users")
    public List<Users> findAll(){
        return usersService.findAll();
    }
}
