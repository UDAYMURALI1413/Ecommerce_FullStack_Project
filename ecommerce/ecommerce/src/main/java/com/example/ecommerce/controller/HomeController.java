package com.example.ecommerce.controller;

import com.example.ecommerce.model.AppUser;
import com.example.ecommerce.service.CartService;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.util.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    private final ProductService productService;
    private final CartService cartService;
    private final SecurityUtils securityUtils;

    public HomeController(ProductService productService,
                          CartService cartService,
                          SecurityUtils securityUtils) {
        this.productService = productService;
        this.cartService = cartService;
        this.securityUtils = securityUtils;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "home";
    }

    @PostMapping("/add-to-cart")
    public String addToCart(
            @RequestParam("productId") Long productId,
            @RequestParam("quantity") int quantity
    ) {
        AppUser user = securityUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/login";   // user must login to add to cart
        }

        cartService.addToCart(user, productId, quantity);

        return "redirect:/cart";
    }
}