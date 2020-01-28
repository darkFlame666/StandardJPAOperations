package com.darkflame.standardjpaoperations.service;

import com.darkflame.standardjpaoperations.dao.UsersDAO;
import com.darkflame.standardjpaoperations.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDAO usersDAO;

    @Override
    @Transactional
    public List<Users> findAll(){
        return (List<Users>) usersDAO.findAll();
    }

    @Override
    public Users findById(Long aLong) {
        return null;
    }

    @Override
    public void save(Users object) {

    }

    @Override
    public void deleteById(Long aLong) {

    }

}
