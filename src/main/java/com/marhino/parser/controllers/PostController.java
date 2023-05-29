package com.marhino.parser.controllers;

import com.marhino.parser.models.Post;
import com.marhino.parser.repositories.PostRepository;
import com.marhino.parser.repositories.WebSiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PostController {


    private final PostRepository postRepository;

    public  PostController(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @GetMapping("/posts")
    public String posts(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "25") int max , Model model) {
        Pageable pageable = PageRequest.of(page, max, Sort.by("createdDate").descending());
        Page<Post> postPage = postRepository.findAll(pageable);
        List<Post> posts = postPage.getContent();

        model.addAttribute("posts", posts);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", max);
        model.addAttribute("totalPages", postPage.getTotalPages());
        return "posts";
    }
}
