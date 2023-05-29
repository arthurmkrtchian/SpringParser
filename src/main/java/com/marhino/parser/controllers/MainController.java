package com.marhino.parser.controllers;

import com.marhino.parser.models.Parser;
import com.marhino.parser.models.Post;
import com.marhino.parser.models.Website;
import com.marhino.parser.repositories.PostRepository;
import com.marhino.parser.repositories.WebSiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.print.Pageable;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Controller
public class MainController {

    private final WebSiteRepository webSiteRepository;

    public MainController(WebSiteRepository webSiteRepository) {
        this.webSiteRepository = webSiteRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        Iterable<Website> webSites = webSiteRepository.findAll();
        model.addAttribute("websites", webSites);
        return "index";
    }

//    @GetMapping("/posts")
//    public String posts(Model model) {
//        Iterable<Website> webSites = webSiteRepository.findAll();
//        ((List<Website>) webSites).sort(new Comparator<Website>() {
//            @Override
//            public int compare(Website o1, Website o2) {
//                return o1.getUpdatedDate().compareTo(o2.getUpdatedDate());
//            }
//        });
//
//        model.addAttribute("websites", webSites);
//        return "posts";
//    }


}
