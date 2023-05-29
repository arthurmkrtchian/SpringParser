package com.marhino.parser.models;

import jakarta.persistence.*;

import java.util.Date;
import java.util.Objects;

@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long postID;
    private String heading;
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    private String link;
    private String shortLink;

    @ManyToOne
    @JoinColumn(name = "websiteid")
    private Website website;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return this.link.equals(((Post) o).link);
    }

    @Override
    public int hashCode() {
        return 0;
    }

    @PrePersist
    protected void onCreate() {
        createdDate = new Date();
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public Post() {
    }

    public Post(String heading, String content, String link) {
        this.heading = heading;
        this.content = content;
        this.link = link;
    }

    public Long getPostID() {
        return postID;
    }

    public void setPostID(Long postID) {
        this.postID = postID;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getShortLink() {
        return shortLink;
    }

    public void setShortLink(String shortLink) {
        this.shortLink = shortLink;
    }

    public Website getWebsite() {
        return website;
    }

    public void setWebsite(Website website) {
        this.website = website;
    }
}
