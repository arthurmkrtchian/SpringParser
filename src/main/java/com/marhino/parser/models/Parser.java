package com.marhino.parser.models;

import jakarta.persistence.*;

@Entity
public class Parser {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long parserID;
    private String postTag;

    public String getPostTag() {
        return postTag;
    }

    public void setPostTag(String postTag) {
        this.postTag = postTag;
    }

    private String headingTag;
    private String contentTag;
    private String linkTag;
    private int contentLimit;

    @OneToOne
    @JoinColumn(name = "websiteid")
    private Website website;

    public Website getWebsite() {
        return website;
    }

    public void setWebsite(Website website) {
        this.website = website;
    }

    public Parser() {
    }

    public Parser(String postTag, String headingTag, String contentTag, String linkTag, int contentLimit) {
        this.postTag = postTag;
        this.headingTag = headingTag;
        this.contentTag = contentTag;
        this.linkTag = linkTag;
        this.contentLimit = contentLimit;
    }

    public Long getParserID() {
        return parserID;
    }

    public void setParserID(Long parserID) {
        this.parserID = parserID;
    }

    public String getHeadingTag() {
        return headingTag;
    }

    public void setHeadingTag(String headingTag) {
        this.headingTag = headingTag;
    }

    public String getContentTag() {
        return contentTag;
    }

    public void setContentTag(String contentTag) {
        this.contentTag = contentTag;
    }

    public String getLinkTag() {
        return linkTag;
    }

    public void setLinkTag(String linkTag) {
        this.linkTag = linkTag;
    }

    public int getContentLimit() {
        return contentLimit;
    }

    public void setContentLimit(int contentLimit) {
        this.contentLimit = contentLimit;
    }
}
