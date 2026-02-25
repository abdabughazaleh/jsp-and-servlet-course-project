<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home — Java Mastery Noters</title>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>


<!-- ═══ MAIN ═══ -->
<main>

    <!-- Hero -->
    <section style="text-align:center; margin-bottom:72px; margin-top:16px;" class="anim">
        <div class="kicker">Your Learning Journal</div>
        <h1 style="font-family:'Fraunces',serif; font-size:60px; font-weight:900; line-height:1.05; letter-spacing:-2px; margin-bottom:18px;">
            Write. <em style="font-style:italic; color:var(--accent);">Learn.</em><br>Remember.
        </h1>
        <p style="font-size:17px; color:var(--muted); max-width:480px; margin:0 auto 36px; line-height:1.65;">
            Capture every insight from your Java journey. Organized notes, always at hand.
        </p>
        <div style="display:flex; align-items:center; justify-content:center; gap:16px; flex-wrap:wrap;">
            <a href="notes.html" class="btn btn-primary">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 5v14M5 12h14"/></svg>
                New Note
            </a>
            <a href="notes.html" class="link-subtle">View all notes →</a>
        </div>
    </section>

    <!-- Recent Notes -->
    <div class="section-hdr anim anim-d1">
        <h2>Recent Notes</h2>
        <a href="notes.html" class="link-subtle">View all →</a>
    </div>

    <div class="notes-grid">

        <div class="note-card anim anim-d1">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 18, 2026</span>
            </div>
            <h3>JVM Memory Model</h3>
            <p>Heap vs Stack memory, garbage collection strategies (G1GC, ZGC), and how to tune JVM flags for production performance.</p>
            <a href="notes.html" style="display:inline-flex; align-items:center; gap:4px; margin-top:14px; font-size:13px; font-weight:600; color:var(--accent);">
                Read more
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M12 5l7 7-7 7"/></svg>
            </a>
        </div>

        <div class="note-card anim anim-d2">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 10, 2026</span>
            </div>
            <h3>OOP Principles (SOLID)</h3>
            <p>Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion — applied in a real refactoring exercise.</p>
            <a href="notes.html" style="display:inline-flex; align-items:center; gap:4px; margin-top:14px; font-size:13px; font-weight:600; color:var(--accent);">
                Read more
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M12 5l7 7-7 7"/></svg>
            </a>
        </div>

        <div class="note-card anim anim-d3">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 1, 2026</span>
            </div>
            <h3>Spring Boot Annotations</h3>
            <p>Covered @RestController, @Service, @Repository, @Autowired, and @Transactional — when and how to use each one correctly.</p>
            <a href="notes.html" style="display:inline-flex; align-items:center; gap:4px; margin-top:14px; font-size:13px; font-weight:600; color:var(--accent);">
                Read more
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M12 5l7 7-7 7"/></svg>
            </a>
        </div>

    </div>
</main>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp" />

</body>
</html>