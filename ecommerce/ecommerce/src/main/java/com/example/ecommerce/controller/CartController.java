package com.example.ecommerce.controller;

import com.example.ecommerce.model.AppUser;
import com.example.ecommerce.model.CartItem;
import com.example.ecommerce.service.CartService;
import com.example.ecommerce.util.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final SecurityUtils securityUtils;

    public CartController(CartService cartService, SecurityUtils securityUtils) {
        this.cartService = cartService;
        this.securityUtils = securityUtils;
    }

    @GetMapping
    public String viewCart(Model model) {

        AppUser user = securityUtils.getCurrentUser();
        if (user == null) return "redirect:/login";

        List<CartItem> items = cartService.getCartItemsForUser(user);
        model.addAttribute("items", items);

        double total = 0;
        for (CartItem item : items) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        model.addAttribute("total", total);

        return "cart"; // cart.jsp
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam Long productId,
                            @RequestParam int quantity) {

        AppUser user = securityUtils.getCurrentUser();
        if (user == null) return "redirect:/login";

        cartService.addToCart(user, productId, quantity);

        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam Long cartItemId) {

        AppUser user = securityUtils.getCurrentUser();
        if (user == null) return "redirect:/login";

        cartService.removeFromCart(user, cartItemId);

        return "redirect:/cart";
    }
}
