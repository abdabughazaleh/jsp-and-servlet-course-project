<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In — Java Mastery Noters</title>
    <style>
        .error-message {
            padding: 20px;
            background-color: #ff5e63;
            color: black;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>


<!-- ═══ LOGIN FORM ═══ -->
<div class="auth-wrap">
    <div class="auth-box anim">
        <div class="kicker" style="margin-bottom:16px;">Welcome Back</div>
        <h2>Sign in to your account</h2>
        <p class="sub">Access your notes and continue learning</p>

        <form action="/login" method="POST">

            <div class="form-group">
                <label for="email">Email address</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="you@example.com"
                        autocomplete="email"
                        required
                >
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="••••••••"
                        autocomplete="current-password"
                        required
                >
            </div>

            <button type="submit" class="btn btn-primary btn-full" style="margin-top:4px;">
                Sign In
            </button>

        </form>

        <div class="auth-alt">
            Don't have an account? <a href="/register">Create an Account</a>
        </div>
        <%
            String status = request.getParameter("err");
            if (status != null && status.equals("register_error")) {
        %>
        <div class="error-message">
            Something went wrong, check data...!
        </div>
        <%}%>
    </div>
</div>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp"/>

</body>
</html>