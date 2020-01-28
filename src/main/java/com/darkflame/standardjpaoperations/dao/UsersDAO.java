package com.darkflame.standardjpaoperations.dao;

import com.darkflame.standardjpaoperations.entity.Users;
import org.springframework.data.repository.CrudRepository;

public interface UsersDAO extends CrudRepository<Users, Long> {
}
