package com.example.Library.service;

import com.example.Library.model.UserPrincipals;
import com.example.Library.model.Users;
import com.example.Library.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Users user= userRepository.findByUsername(username);
        if(user == null){

            throw new UsernameNotFoundException("user not found");
        }
        return new UserPrincipals(user);
    }
}
