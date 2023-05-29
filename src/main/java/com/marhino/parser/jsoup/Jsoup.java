package com.marhino.parser.jsoup;

import com.marhino.parser.models.Post;
import com.marhino.parser.models.Website;
import com.marhino.parser.repositories.PostRepository;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;


@Service
public class Jsoup {

    @Autowired
    PostRepository postRepository;
    public static void getPosts(Website website) {
        Document document = null;

        try {
            document = org.jsoup.Jsoup.connect(website.getLink()).get();
            Elements elements = getCollection(document, website.getParser().getPostTag());
            for (Element element : elements) {
                String link = getElement(element, website.getParser().getLinkTag());
                if (link != null && !link.equals("")) {
                    if (link.charAt(0) == '/') {
                        link = website.getLink() + link;
                    }
                }
                Post post = new Post(
                        getElement(element, website.getParser().getHeadingTag()),
                        getElement(element, website.getParser().getContentTag()),
                        link
                );

                if (website.getPosts() == null || !website.getPosts().contains(post)){
                    post.setWebsite(website);
                    website.addPost(post);
                }

            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static Elements getCollection(Document document, String selector) {
        if (selector.charAt(0) == '.') {
            return document.select(selector.trim().toLowerCase());
        } else {
            return document.getElementsByTag(selector.trim().toLowerCase());
        }
    }

    private static String getElement(Element element, String selector) {
        if (selector.trim().equalsIgnoreCase("a")) {
            return element.getElementsByTag("a").attr("href");
        }
        if (selector.trim().equalsIgnoreCase("aastext")) {
            return element.getElementsByTag("a").text();
        }
        if (selector.trim().charAt(0) == '#') {
            try {
                return Objects.requireNonNull(element.getElementById(selector.trim().toLowerCase())).text();
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        if (selector.trim().charAt(0) == '.') {
            return element.select(selector.trim().toLowerCase()).text();
        } else {
            return element.getElementsByTag(selector.trim().toLowerCase()).text();
        }
    }
}
