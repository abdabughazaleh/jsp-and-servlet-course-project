<%@ page import="model.dto.UserDTO" %>
<html>
<head>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<header>
    <a href="/home" class="logo">
        Java<span class="accent">Mastery</span>
        <span class="sub-text">Noters</span>
    </a>

    <nav>
        <a href="/home" <%--class="active"--%>>Home</a>
        <a href="/notes">My Notes</a>
        <a href="/contact">Contact Us</a>
    </nav>

    <div class="header-actions">
        <%
            if (session.getAttribute("user_data") == null) {
        %>
        <!-- When user is NOT logged in, show these two buttons -->
        <a href="/login" class="btn btn-outline btn-sm">Sign In</a>
        <a href="/register" class="btn btn-primary btn-sm">Sign Up</a>
        <%
        } else {
            UserDTO userData = (UserDTO) session.getAttribute("user_data");
        %>
        <div class="profile-wrap">
            <span style="font-size:14px; font-weight:600; color:var(--ink);"><%=userData.getName()%></span>
            <a href="/profile" class="btn btn-outline btn-sm">Profile</a>
            <a href="/login?action=logout" class="btn btn-sm"
               style="color:var(--danger); border:1.5px solid #fecaca; background:transparent;">Sign Out</a>
        </div>
        <% } %>
    </div>
</header>
</body>
</html>
