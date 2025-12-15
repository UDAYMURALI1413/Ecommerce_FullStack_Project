package com.example.ecommerce.util;

import com.example.ecommerce.model.AppUser;
import com.example.ecommerce.repository.AppUserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class SecurityUtils {

    private final AppUserRepository userRepository;

    public SecurityUtils(AppUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public AppUser getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null) return null;

        String username = auth.getName();
        return userRepository.findByUsername(username).orElse(null);
    }
}
