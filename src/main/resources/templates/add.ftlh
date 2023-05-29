<#import "common/template.ftl" as p>
<@p.page>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <div class="container add-screen-container">
                <div class="form-container">
                    <form class="add-ws-form" method="post">
                        <h4>General information</h4>
                        <input class="form-control"
                               name="websiteName"
                               type="text"
                               placeholder="Website name"
                               required=""
                               maxlength="256">
                        <input
                                class="form-control"
                                name="websiteLink"
                                type="text"
                                placeholder="Website link"
                                required="">
                        <input
                                class="form-control"
                                name="channelID"
                                type="text"
                                pattern="^[0-9-]*$"
                                placeholder="Channel ID"
                                required="">
                        <input
                                class="form-control"
                                name="websiteDescription"
                                type="text"
                                placeholder="Description"
                                required="">
                        <hr>
                        <h4>Parser options</h4>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Post:</p>
                            <input class="form-control"
                                   name="parserPost"
                                   type="text"
                                   placeholder="Tag or selector (e.g. article or .post)"
                                   required="">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Heading:</p>
                            <input class="form-control"
                                   name="parserHeading"
                                   type="text"
                                   placeholder="Tag or selector (e.g. h3 or .heading)"
                                   required="">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Content:</p>
                            <input class="form-control"
                                   name="parserContent"
                                   type="text"
                                   placeholder="Tag or selector (e.g. p or .excerpt)"
                                   required="">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Content limit:</p>
                            <input class="form-control"
                                   name="parserContentLimit"
                                   type="number"
                                   name="content-limit"
                                   value="200" min="100"
                                   max="3600">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Link:</p>
                            <input class="form-control"
                                   name="parserLink"
                                   type="text"
                                   placeholder="Tag or selector (e.g. a or .link)"
                                   required="">
                        </div>
                        <div class="form-horizontal-group">
                            <p class="form-horizontal-group-text">Color:</p>
                            <input type="color" class="form-control form-control-color" name="iconColor" value="#22539D" title="Choose color">
                        </div>
                        <hr>
                        <div class="form-buttons">
                            <a class="btn btn-light" role="button"  href="/">Cancel</a>
                            <button class="btn btn-success" type="submit">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
 </@p.page>