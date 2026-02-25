<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us — Java Mastery Noters</title>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>



<!-- ═══ MAIN ═══ -->
<main>

    <!-- Heading -->
    <div style="text-align:center; margin-bottom:52px;" class="anim">
        <div class="kicker">Support</div>
        <h1 style="font-family:'Fraunces',serif; font-size:44px; font-weight:900; letter-spacing:-1.5px; margin-bottom:12px;">
            We're here to help
        </h1>
        <p style="font-size:16px; color:var(--muted); max-width:420px; margin:0 auto; line-height:1.65;">
            Reach out to the <strong>Java Mastery Noters</strong> support team — we'll get back to you quickly.
        </p>
    </div>

    <!-- Grid -->
    <div class="contact-grid">

        <!-- Info card -->
        <div class="contact-info-card anim anim-d1">
            <h2>Contact Information</h2>
            <p>Have questions about your notes, account, or our courses? We're always ready to assist.</p>

            <div class="contact-item">
                <div class="c-icon">
                    <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg>
                </div>
                <div>
                    <div class="c-label">Customer Support</div>
                    <div class="c-value">+966-666-223-44</div>
                </div>
            </div>

            <div class="contact-item">
                <div class="c-icon">
                    <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/></svg>
                </div>
                <div>
                    <div class="c-label">Support Email</div>
                    <div class="c-value">customercare@java-mastery.com</div>
                </div>
            </div>

            <div class="contact-item">
                <div class="c-icon">
                    <svg viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <div>
                    <div class="c-label">Support Hours</div>
                    <div class="c-value">Sun – Thu, 9 AM – 6 PM AST</div>
                </div>
            </div>
        </div>

        <!-- Form card -->
        <div class="contact-form-card anim anim-d2">
            <h2>Send a Message</h2>
            <p class="sub">Fill in the form and we'll respond within 24 hours.</p>

            <form action="/contact" method="POST">

                <div class="form-group">
                    <label for="cf-name">Your Name</label>
                    <input type="text" id="cf-name" name="name" placeholder="Ahmed Al-Rashidi" required>
                </div>

                <div class="form-group">
                    <label for="cf-email">Email Address</label>
                    <input type="email" id="cf-email" name="email" placeholder="you@example.com" required>
                </div>

                <div class="form-group">
                    <label for="cf-subject">Subject</label>
                    <input type="text" id="cf-subject" name="subject" placeholder="e.g. Question about my account" required>
                </div>

                <div class="form-group">
                    <label for="cf-message">Message</label>
                    <textarea id="cf-message" name="message" style="min-height:130px;" placeholder="How can we help you?" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-full">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/></svg>
                    Send Message
                </button>

            </form>
        </div>

    </div>
</main>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp" />

</body>
</html>