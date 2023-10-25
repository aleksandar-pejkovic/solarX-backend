package com.alpey.solarXbackend.repository;

import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Repository;

import com.alpey.solarXbackend.model.entity.User;

@Repository
public interface UserRepository extends ListCrudRepository<User, Long> {
}
