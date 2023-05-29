<#import "common/template.ftl" as p>
<@p.page>
<div class="d-flex flex-column" id="content-wrapper">
    <div id="content">
        <div class="container">
            <div class="d-xxl-flex justify-content-xxl-end mb-2 mt-5">
                <a class="btn btn-success" role="button" href="/add">Add new</a>
            </div>
            <#if websites?has_content>
                <div class="cards-container">
                <#list websites?reverse as website>
                    <div class="card ws-card">
                        <div class="card-body p-4">
                            <div>
                                <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center d-inline-block mb-3 bs-icon"
                                     style="background: ${website.color};">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                         fill="currentColor"
                                         viewBox="0 0 16 16" class="bi bi-globe">
                                        <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm7.5-6.923c-.67.204-1.335.82-1.887 1.855A7.97 7.97 0 0 0 5.145 4H7.5V1.077zM4.09 4a9.267 9.267 0 0 1 .64-1.539 6.7 6.7 0 0 1 .597-.933A7.025 7.025 0 0 0 2.255 4H4.09zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a6.958 6.958 0 0 0-.656 2.5h2.49zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5H4.847zM8.5 5v2.5h2.99a12.495 12.495 0 0 0-.337-2.5H8.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5H4.51zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5H8.5zM5.145 12c.138.386.295.744.468 1.068.552 1.035 1.218 1.65 1.887 1.855V12H5.145zm.182 2.472a6.696 6.696 0 0 1-.597-.933A9.268 9.268 0 0 1 4.09 12H2.255a7.024 7.024 0 0 0 3.072 2.472zM3.82 11a13.652 13.652 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5H3.82zm6.853 3.472A7.024 7.024 0 0 0 13.745 12H11.91a9.27 9.27 0 0 1-.64 1.539 6.688 6.688 0 0 1-.597.933zM8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855.173-.324.33-.682.468-1.068H8.5zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.65 13.65 0 0 1-.312 2.5zm2.802-3.5a6.959 6.959 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5h2.49zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7.024 7.024 0 0 0-3.072-2.472c.218.284.418.598.597.933zM10.855 4a7.966 7.966 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4h2.355z"></path>
                                    </svg>
                                </div>
                                <h4>${website.name}</h4>
                                <p>${website.description}</p>
                            </div>
                            <div class="actions">
                                <a class="btn btn-warning edit-button" role="button" href="${website.websiteID}/edit" title="Edit">
                                    <i class="fas fa-pen"></i>
                                </a>
                                <a class="btn btn-primary edit-button" role="button" target="_blank" href="${website.link}" title="Visit site">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                                <a href="#" class="btn btn-danger" onclick="openModal('${website.websiteID}')">
                                    <i class="fas fa-trash-alt"></i>
                                </a>

                            </div>

                        </div>
                    </div>
                </#list>
            <#else>
                <div class="empty-wb">
                    <h4 class="empty-heading">No websites have been set up yet</h4>
                    <a class="btn btn-success" role="button" href="/add">Add new</a>
                </div>
                </div>
            </#if>
        </div>
    </div>
</div>
<div class="modal fade " role="dialog" tabindex="-1" id="remove-confirmation">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="rc-text" style="text-align: center; font-size: 18px;">Are you sure you want to delete the entry?</p>
                <form id="confirmation-form" action="" method="post">
                    <div class="modal-footer">
                        <button class="btn btn-light" type="button" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-danger" type="submit" id="confirm-btn">Yes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function openModal(elementId) {
            var modal = new bootstrap.Modal(document.getElementById('remove-confirmation'));
            var formAction = document.getElementById("confirmation-form");
            formAction.setAttribute('action', elementId + '/remove');
            modal.show();
        }
    </script>
    </@p.page>
