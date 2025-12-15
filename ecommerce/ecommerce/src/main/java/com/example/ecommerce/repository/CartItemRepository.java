package com.example.ecommerce.repository;

import com.example.ecommerce.model.AppUser;
import com.example.ecommerce.model.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    List<CartItem> findByUser(AppUser user);
    Optional<CartItem> findByUserAndProductId(AppUser user, Long productId);
    void deleteByUserAndProductId(AppUser user, Long productId);
}