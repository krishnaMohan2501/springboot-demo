package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

//    private ProductRepository productRepository;

//    @Autowired
//    public ProductController(ProductRepository productRepository) {
//        this.productRepository = productRepository;
//    }

    @GetMapping("/products")
    public String getProducts() {
        return "Hello World";
    }

//    @PostMapping("/products")
//    public Product save(@RequestBody Product product) {
//        return productRepository.save(product);
//    }
}