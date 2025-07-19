package com.sb.deployment.controller;

import com.sb.deployment.model.Item;
import com.sb.deployment.repo.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/items")
public class ItemController {

    @Autowired
    private ItemRepository itemRepository;

    @PostMapping
    public Item createItem(@RequestBody Item item){
        return itemRepository.save(item);
    }

    @GetMapping
    public List<Item> getAllItem(){
        return itemRepository.findAll();
    }
}
