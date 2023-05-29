<#import "common/template.ftl" as p>
<@p.page>
    <div class="d-flex flex-column" id="content-wrapper">
    <div id="content">
        <div class="container-fluid">
            <h3 class="text-dark mb-4 mt-5">Posts</h3>
            <div class="card shadow">
                <div class="card-header py-3">
                    <p class="text-primary m-0 fw-bold">Latest posts</p>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 text-nowrap">
                            <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                <label class="form-label">Show&nbsp;
                                    <select id="page-size" onchange="changePageSize()"
                                            class="d-inline-block form-select form-select-sm">
                                        <option value="25" <#if pageSize?c == "25">selected</#if>>25</option>
                                        <option value="50" <#if pageSize?c == "50">selected</#if>>50</option>
                                        <option value="100" <#if pageSize?c == "100">selected</#if>>100</option>
                                    </select>&nbsp;

                                    <script>
                                        function changePageSize() {
                                            const selectBox = document.getElementById('page-size');
                                            const selectedValue = selectBox.options[selectBox.selectedIndex].value;
                                            if (selectedValue !== "") {
                                                window.open('/posts?page=${currentPage}&max=' + selectedValue, "_self");
                                            }
                                        }
                                    </script>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-end dataTables_filter" id="dataTable_filter">
                                <label class="form-label"><input type="search" class="form-control form-control-sm"
                                                                 aria-controls="dataTable" placeholder="Search"></label>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive table mt-2" id="dataTable" role="grid"
                         aria-describedby="dataTable_info">
                        <table class="table my-0" id="dataTable">
                            <thead>
                            <tr>
                                <th>Website</th>
                                <th>Heading</th>
                                <th>Content</th>
                                <th>Date</th>
                                <th>Link</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#if posts?has_content>
                                <#list posts as post>
                                    <tr>
                                        <td><a href="${post.website.link}" style="text-decoration: none;" target="_blank">${post.website.name}</a></td>
                                        <td><b>${post.heading}</b></td>
                                        <td>${post.content}</td>
                                        <td>${post.getCreatedDate()?string.short}</td>
                                        <td><a class="btn btn-link" href="${post.link}" target="_blank" title="Go to post">
                                                <i class="fas fa-external-link-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                            <#else>
                            </#if>
                        </table>
                    </div>
                    <div class="row">
                        <#if posts?has_content  && (totalPages > 1)>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <li class="page-item<#if currentPage == 0> disabled</#if>">
                                            <a class="page-link" aria-label="Previous"
                                               href="/posts?page=${currentPage - 1}">
                                                <span aria-hidden="true">«</span>
                                            </a>
                                        </li>
                                        <#list 0..(totalPages - 1) as page>
                                            <li class="page-item<#if currentPage == page> active</#if>">
                                                <a class="page-link" href="/posts?page=${page}">${page + 1}</a>
                                            </li>
                                        </#list>
                                        <li class="page-item<#if currentPage == totalPages - 1> disabled</#if>">
                                            <a class="page-link" aria-label="Next"
                                               href="/posts?page=${currentPage + 1}">
                                                <span aria-hidden="true">»</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@p.page>