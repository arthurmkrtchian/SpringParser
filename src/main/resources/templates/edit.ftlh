<#import "common/template.ftl" as p>
<@p.page>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <div class="container add-screen-container">
                <div class="form-container">
                    <form action="/${website.websiteID}/edit" class="add-ws-form" method="post">
                        <h4>General information</h4>
                        <div>
                            <p style="margin-bottom: 0 !important;">Website name</p>
                            <input class="form-control"
                                   name="websiteName"
                                   type="text"
                                   placeholder="Website name"
                                   required=""
                                   maxlength="256"
                                   value="${website.name}"></div>
                        <div>
                            <p style="margin-bottom: 0 !important;">Website link</p>
                            <input
                                    class="form-control"
                                    name="websiteLink"
                                    type="text"
                                    placeholder="Website link"
                                    required=""
                                    value="${website.link}">
                        </div>
                        <div>
                            <p style="margin-bottom: 0 !important;">Channel ID</p>
                            <input
                                    class="form-control"
                                    name="channelID"
                                    type="text"
                                    pattern="^[0-9-]*$"
                                    placeholder="Channel ID"
                                    required=""
                                    value="${website.channelID?c}">
                        </div>
                        <div>
                            <p style="margin-bottom: 0 !important;">Description</p>
                            <input
                                    class="form-control"
                                    name="websiteDescription"
                                    type="text"
                                    placeholder="Description"
                                    required=""
                                    value="${website.description}">
                        </div>
                        <hr>
                        <h4>Parser options</h4>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Post:</p>
                            <input class="form-control"
                                   name="parserPost"
                                   type="text"
                                   placeholder="Tag or selector (e.g. article or .post)"
                                   required=""
                                   value="${website.parser.postTag}">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Heading:</p>
                            <input class="form-control"
                                   name="parserHeading"
                                   type="text"
                                   placeholder="Tag or selector (e.g. h3 or .heading)"
                                   required=""
                                   value="${website.parser.headingTag}">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Content:</p>
                            <input class="form-control"
                                   name="parserContent"
                                   type="text"
                                   placeholder="Tag or selector (e.g. p or .excerpt)"
                                   required=""
                                   value="${website.parser.contentTag}">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Content limit:</p>
                            <input class="form-control"
                                   name="parserContentLimit"
                                   type="number"
                                   name="content-limit"
                                   value="200" min="100"
                                   max="3600"
                                   value="${website.parser.contentLimit}">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Link:</p>
                            <input class="form-control"
                                   name="parserLink"
                                   type="text"
                                   placeholder="Tag or selector (e.g. a or .link)"
                                   required=""
                                   value="${website.parser.linkTag}">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Color:</p>
                            <input type="color" class="form-control form-control-color" name="iconColor" value="${website.color}" title="Choose color">
                        </div>
                        <div>
                            <input class="form-check-input" name="isClean" type="checkbox" id="formCheck-1">
                            <label class="form-check-label" for="formCheck-1">Remove previous data</label>
                        </div>
                        <hr>
                        <div class="form-buttons">
                            <a class="btn btn-light" role="button" href="/">Cancel</a>
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@p.page>