package com.example.ecommerce.service;

import com.example.ecommerce.model.AppUser;
import com.example.ecommerce.model.CartItem;
import com.example.ecommerce.model.Product;
import com.example.ecommerce.repository.AppUserRepository;
import com.example.ecommerce.repository.CartItemRepository;
import com.example.ecommerce.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    private final CartItemRepository cartItemRepository;
    private final ProductRepository productRepository;
    private final AppUserRepository userRepository;

    public CartService(CartItemRepository cartItemRepository,
                       ProductRepository productRepository,
                       AppUserRepository userRepository) {
        this.cartItemRepository = cartItemRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    public List<CartItem> getCartItemsForUser(AppUser user) {
        return cartItemRepository.findByUser(user);
    }

    public void addToCart(AppUser user, Long productId, int quantity) {

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Product not found"));

        // If cart item already exists → update quantity
        var existing = cartItemRepository.findByUserAndProductId(user, productId);

        if (existing.isPresent()) {
            CartItem item = existing.get();
            item.setQuantity(item.getQuantity() + quantity);
            cartItemRepository.save(item);
            return;
        }

        // Otherwise create a new row
        CartItem item = new CartItem(product, quantity, user);
        cartItemRepository.save(item);
    }

    public void removeFromCart(AppUser user, Long cartItemId) {

        CartItem item = cartItemRepository.findById(cartItemId)
                .orElse(null);

        if (item != null && item.getUser().getId().equals(user.getId())) {
            cartItemRepository.delete(item);
        }
    }
}