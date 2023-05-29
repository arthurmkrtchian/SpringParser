package com.marhino.parser.controllers;

import com.marhino.parser.jsoup.Jsoup;
import com.marhino.parser.models.Parser;
import com.marhino.parser.models.Post;
import com.marhino.parser.models.Website;
import com.marhino.parser.repositories.ParserRepository;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class WebsitesController {
    private final WebSiteRepository webSiteRepository;
    private final PostRepository postRepository;

    public WebsitesController(WebSiteRepository webSiteRepository, PostRepository postRepository) {
        this.webSiteRepository = webSiteRepository;
        this.postRepository = postRepository;
    }

    @GetMapping("/add")
    public String addWebSite() {
        return "add";
    }

    @PostMapping("/add")
    public String addWebsite(@RequestParam String websiteName,
                             @RequestParam String websiteLink,
                             @RequestParam String websiteDescription,
                             @RequestParam long channelID,
                             @RequestParam String parserPost,
                             @RequestParam String parserHeading,
                             @RequestParam String parserContent,
                             @RequestParam int parserContentLimit,
                             @RequestParam String parserLink,
                             @RequestParam String iconColor) {
        Parser parser = new Parser(parserPost, parserHeading, parserContent, parserLink, parserContentLimit);
        Website website = new Website(websiteName, websiteDescription, websiteLink, channelID);
        website.setColor(iconColor);
        parser.setWebsite(website);
        website.setParser(parser);
        Jsoup.getPosts(website);
        webSiteRepository.save(website);
        return "redirect:/";
    }

    @GetMapping("/{id}/edit")
    public String websiteDetails(@PathVariable(value = "id") long id, Model model) {
        Optional<Website> website = webSiteRepository.findById(id);
        model.addAttribute("website", website.orElse(null));
        return "edit";
    }

    @PostMapping("/{id}/edit")
    public String websiteUpdate(@PathVariable(value = "id") long id,
                                @RequestParam String websiteName,
                                @RequestParam String websiteLink,
                                @RequestParam String websiteDescription,
                                @RequestParam long channelID,
                                @RequestParam String parserPost,
                                @RequestParam String parserHeading,
                                @RequestParam String parserContent,
                                @RequestParam int parserContentLimit,
                                @RequestParam String parserLink,
                                @RequestParam String iconColor,
                                @RequestParam(value = "isClean", defaultValue = "false") boolean isClean) {
        Website website = webSiteRepository.findById(id).orElseThrow();
        website.setName(websiteName);
        website.setDescription(websiteDescription);
        website.setLink(websiteLink);
        website.setChannelID(channelID);
        website.setColor(iconColor);
        website.getParser().setPostTag(parserPost);
        website.getParser().setHeadingTag(parserHeading);
        website.getParser().setContentTag(parserContent);
        website.getParser().setContentLimit(parserContentLimit);
        website.getParser().setLinkTag(parserLink);
        if (isClean) {
            Iterable<Post> posts = postRepository.findAll();
            for (Post item : posts) {
                if (item.getWebsite().getWebsiteID() == website.getWebsiteID()) {
                    postRepository.delete(item);
                }
            }
        }
        Jsoup.getPosts(website);
        webSiteRepository.save(website);
        return "redirect:/";
    }

    @PostMapping("/{id}/remove")
    public String websiteRemove(@PathVariable(value = "id") long id) {
        Website website = webSiteRepository.findById(id).orElseThrow();
        webSiteRepository.delete(website);
        return "redirect:/";
    }
}
