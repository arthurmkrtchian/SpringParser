package com.marhino.parser.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Website implements Comparable<Website>{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long websiteID;
    private String name;
    private String description;
    private String link;
    private Long channelID;
    private String color;

    private Date updatedDate;
    private Date createdDate;

    @PrePersist
    protected void onCreate() {
        updatedDate = new Date();
        createdDate = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        updatedDate = new Date();
    }

    @OneToMany(mappedBy = "website", cascade = CascadeType.ALL)
    private List<Post> posts;
    @OneToOne(mappedBy = "website", cascade = CascadeType.ALL)
    private Parser parser;

    public Website(String name, String description, String link, Long channelID) {
        this.name = name;
        this.link = link;
        this.channelID = channelID;
        this.description = description;
    }

    public Website() {
    }

    public void addPost(Post post) {
        if (this.posts == null) {
            this.posts = new ArrayList<>();
            this.posts.add(post);
        } else {
            this.posts.add(post);
        }
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setWebsiteID(Long webSiteID) {
        this.websiteID = webSiteID;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public Long getChannelID() {
        return channelID;
    }

    public void setChannelID(Long channelID) {
        this.channelID = channelID;
    }

    public long getWebsiteID() {
        return websiteID;
    }

    public void setWebSiteID(long id) {
        this.websiteID = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Parser getParser() {
        return parser;
    }

    public void setParser(Parser parser) {
        this.parser = parser;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    @Override
    public int compareTo(Website o) {
        if (this.updatedDate.after(o.updatedDate)){
            return 1;
        }
        return 0;
    }
}
