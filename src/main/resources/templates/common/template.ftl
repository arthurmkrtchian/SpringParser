<#macro page>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
        <div class="container-fluid d-flex flex-column p-0">
            <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fab fa-telegram-plane"></i></div>
                <div class="sidebar-brand-text mx-3"><span>TGRover</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link" href="/"><i
                                class="fas fa-tachometer-alt"></i><span>Websites</span></a></li>
                <li class="nav-item"><a class="nav-link" href="/posts"><i
                                class="fas fa-table"></i><span>Posts</span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
            </div>
        </div>
    </nav>
<#nested>
</div>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/bs-init.js"></script>
<script src="/js/theme.js"></script>
</body>
</html>
</#macro>