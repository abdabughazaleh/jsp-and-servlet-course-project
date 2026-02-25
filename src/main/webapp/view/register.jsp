<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account — Java Mastery Noters</title>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>


<!-- ═══ SIGNUP FORM ═══ -->
<div class="auth-wrap">
    <div class="auth-box anim" style="max-width:460px;">
        <div class="kicker" style="margin-bottom:16px;">Get Started</div>
        <h2>Create your account</h2>
        <p class="sub">Join Java Mastery Noters and start capturing your learnings</p>

        <form action="/register" method="POST">

            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input
                        type="text"
                        id="fullname"
                        name="fullname"
                        placeholder="Ahmed Al-Rashidi"
                        autocomplete="name"
                        required
                >
            </div>

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
                        placeholder="Min. 8 characters"
                        autocomplete="new-password"
                        minlength="8"
                        required
                >
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        placeholder="+966 5x xxx xxxx"
                        autocomplete="tel"
                        required
                >
            </div>

            <button type="submit" class="btn btn-primary btn-full" style="margin-top:4px;">
                Create Account
            </button>

        </form>

        <div class="auth-alt">
            Already have an account? <a href="/login">Sign In</a>
        </div>
    </div>
</div>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp" />

</body>
</html>