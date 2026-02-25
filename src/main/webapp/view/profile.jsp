<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile — Java Mastery Noters</title>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>


<!-- ═══ MAIN ═══ -->
<main>

    <div style="text-align:center; margin-bottom:44px;" class="anim">
        <div class="kicker">Account</div>
        <h1 style="font-family:'Fraunces',serif; font-size:40px; font-weight:900; letter-spacing:-1px;">Your Profile</h1>
    </div>

    <div class="profile-card anim anim-d1">

        <!-- Avatar initials — replace "AR" with server-side initials -->
        <div class="profile-avatar-lg">AR</div>

        <!-- Replace placeholder text with server-side user values -->
        <h2>Ahmed Al-Rashidi</h2>
        <div class="profile-role">Java Developer · Member since 2026</div>

        <div class="profile-detail">
            <div class="detail-icon">
                <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
            </div>
            <div>
                <span class="detail-label">Full Name</span>
                <span class="detail-value">Ahmed Al-Rashidi</span>
            </div>
        </div>

        <div class="profile-detail">
            <div class="detail-icon">
                <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/></svg>
            </div>
            <div>
                <span class="detail-label">Email Address</span>
                <span class="detail-value">ahmed@example.com</span>
            </div>
        </div>

        <div class="profile-detail">
            <div class="detail-icon">
                <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg>
            </div>
            <div>
                <span class="detail-label">Mobile Number</span>
                <span class="detail-value">+966 5x xxx xxxx</span>
            </div>
        </div>

        <div class="stats-row">
            <div class="stat-box">
                <!-- Replace "4" with server-side notes count -->
                <div class="stat-num">4</div>
                <div class="stat-lbl">Total Notes</div>
            </div>
            <div class="stat-box">
                <div class="stat-num">2026</div>
                <div class="stat-lbl">Member Since</div>
            </div>
            <div class="stat-box">
                <div class="stat-num">☕</div>
                <div class="stat-lbl">Java Dev</div>
            </div>
        </div>

        <div style="margin-top:28px; padding-top:24px; border-top:1px solid var(--border); display:flex; gap:10px;">
            <a href="notes.html" class="btn btn-outline btn-sm">My Notes</a>
            <a href="/logout" class="btn btn-danger btn-sm">Sign Out</a>
        </div>

    </div>
</main>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp" />

</body>
</html>