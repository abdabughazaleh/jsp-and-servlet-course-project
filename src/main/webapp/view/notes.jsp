<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Notes — Java Mastery Noters</title>
    <style>
        /* ── Inline modal using CSS :target trick — zero JavaScript ── */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.48);
            backdrop-filter: blur(4px);
            z-index: 500;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .modal-overlay:target { display: flex; }

        .modal {
            background: var(--surface);
            border-radius: 18px;
            padding: 38px;
            width: 100%;
            max-width: 480px;
            box-shadow: var(--shadow-lg);
            animation: modalIn .22s ease;
            position: relative;
        }
        .modal.sm { max-width: 380px; }
        @keyframes modalIn {
            from { opacity: 0; transform: scale(.95); }
            to   { opacity: 1; transform: scale(1); }
        }
        .modal h3 {
            font-family: 'Fraunces', serif;
            font-size: 24px;
            font-weight: 900;
            margin-bottom: 4px;
        }
        .modal .sub { font-size: 14px; color: var(--muted); margin-bottom: 26px; }
        .modal-actions { display: flex; gap: 10px; margin-top: 24px; justify-content: flex-end; }
        .modal-close {
            position: absolute;
            top: 16px; right: 18px;
            font-size: 22px;
            color: var(--muted);
            text-decoration: none;
            line-height: 1;
            transition: color .15s;
        }
        .modal-close:hover { color: var(--ink); }
    </style>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>



<!-- ═══ MAIN ═══ -->
<main>

    <div class="page-title-bar anim">
        <h1>My Notes</h1>
        <!-- Opens the Add Note modal -->
        <a href="#modal-add" class="btn btn-primary">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 5v14M5 12h14"/></svg>
            New Note
        </a>
    </div>

    <!-- Notes grid — each card rendered by the server -->
    <div class="notes-grid">

        <div class="note-card anim anim-d1">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 18, 2026</span>
            </div>
            <h3>JVM Memory Model</h3>
            <p>Heap vs Stack memory, garbage collection strategies (G1GC, ZGC), and how to tune JVM flags for production performance tuning.</p>
            <div class="note-actions">
                <a href="#modal-edit-1" class="btn btn-outline btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                    Edit
                </a>
                <a href="#modal-delete-1" class="btn btn-danger btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    Delete
                </a>
            </div>
        </div>

        <div class="note-card anim anim-d2">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 10, 2026</span>
            </div>
            <h3>OOP Principles (SOLID)</h3>
            <p>Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion — applied in a real refactoring exercise.</p>
            <div class="note-actions">
                <a href="#modal-edit-2" class="btn btn-outline btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                    Edit
                </a>
                <a href="#modal-delete-2" class="btn btn-danger btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    Delete
                </a>
            </div>
        </div>

        <div class="note-card anim anim-d3">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Feb 1, 2026</span>
            </div>
            <h3>Spring Boot Annotations</h3>
            <p>Covered @RestController, @Service, @Repository, @Autowired, and @Transactional — when and how to use each one correctly.</p>
            <div class="note-actions">
                <a href="#modal-edit-3" class="btn btn-outline btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                    Edit
                </a>
                <a href="#modal-delete-3" class="btn btn-danger btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    Delete
                </a>
            </div>
        </div>

        <div class="note-card anim anim-d4">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date">Jan 15, 2026</span>
            </div>
            <h3>Java Streams Deep Dive</h3>
            <p>Explored the Stream API including map, filter, reduce, and collectors. Key insight: streams are lazy and never modify the source collection.</p>
            <div class="note-actions">
                <a href="#modal-edit-4" class="btn btn-outline btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                    Edit
                </a>
                <a href="#modal-delete-4" class="btn btn-danger btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    Delete
                </a>
            </div>
        </div>

    </div>
</main>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp" />


<!-- ═══════════════════════════════════════
     MODALS  (CSS :target — no JavaScript)
     ═══════════════════════════════════════ -->

<!-- ADD NOTE MODAL -->
<div id="modal-add" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>New Note</h3>
        <p class="sub">Capture your thoughts and learnings</p>
        <form action="/notes/add" method="POST">
            <div class="form-group">
                <label for="add-title">Title</label>
                <input type="text" id="add-title" name="title" placeholder="e.g. Java Streams Overview" required>
            </div>
            <div class="form-group">
                <label for="add-desc">Description</label>
                <textarea id="add-desc" name="description" placeholder="Write your note here..." required></textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Note</button>
            </div>
        </form>
    </div>
</div>


<!-- EDIT NOTE MODALS — one per note (server renders these with pre-filled values) -->

<!-- Edit Note 1 -->
<div id="modal-edit-1" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Edit Note</h3>
        <p class="sub">Update your note details</p>
        <form action="/notes/edit/1" method="POST">
            <div class="form-group">
                <label for="edit-title-1">Title</label>
                <input type="text" id="edit-title-1" name="title" value="JVM Memory Model" required>
            </div>
            <div class="form-group">
                <label for="edit-desc-1">Description</label>
                <textarea id="edit-desc-1" name="description" required>Heap vs Stack memory, garbage collection strategies (G1GC, ZGC), and how to tune JVM flags for production performance tuning.</textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Note 2 -->
<div id="modal-edit-2" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Edit Note</h3>
        <p class="sub">Update your note details</p>
        <form action="/notes/edit/2" method="POST">
            <div class="form-group">
                <label for="edit-title-2">Title</label>
                <input type="text" id="edit-title-2" name="title" value="OOP Principles (SOLID)" required>
            </div>
            <div class="form-group">
                <label for="edit-desc-2">Description</label>
                <textarea id="edit-desc-2" name="description" required>Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion — applied in a real refactoring exercise.</textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Note 3 -->
<div id="modal-edit-3" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Edit Note</h3>
        <p class="sub">Update your note details</p>
        <form action="/notes/edit/3" method="POST">
            <div class="form-group">
                <label for="edit-title-3">Title</label>
                <input type="text" id="edit-title-3" name="title" value="Spring Boot Annotations" required>
            </div>
            <div class="form-group">
                <label for="edit-desc-3">Description</label>
                <textarea id="edit-desc-3" name="description" required>Covered @RestController, @Service, @Repository, @Autowired, and @Transactional — when and how to use each one correctly.</textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Note 4 -->
<div id="modal-edit-4" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Edit Note</h3>
        <p class="sub">Update your note details</p>
        <form action="/notes/edit/4" method="POST">
            <div class="form-group">
                <label for="edit-title-4">Title</label>
                <input type="text" id="edit-title-4" name="title" value="Java Streams Deep Dive" required>
            </div>
            <div class="form-group">
                <label for="edit-desc-4">Description</label>
                <textarea id="edit-desc-4" name="description" required>Explored the Stream API including map, filter, reduce, and collectors. Key insight: streams are lazy and never modify the source collection.</textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>


<!-- DELETE CONFIRM MODALS -->

<!-- Delete Note 1 -->
<div id="modal-delete-1" class="modal-overlay">
    <div class="modal sm">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Delete Note</h3>
        <p class="sub">This cannot be undone. Are you sure you want to delete <strong>"JVM Memory Model"</strong>?</p>
        <div class="modal-actions">
            <a href="#" class="btn btn-outline">Cancel</a>
            <form action="/notes/delete/1" method="POST" style="display:inline;">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>
    </div>
</div>

<!-- Delete Note 2 -->
<div id="modal-delete-2" class="modal-overlay">
    <div class="modal sm">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Delete Note</h3>
        <p class="sub">This cannot be undone. Are you sure you want to delete <strong>"OOP Principles (SOLID)"</strong>?</p>
        <div class="modal-actions">
            <a href="#" class="btn btn-outline">Cancel</a>
            <form action="/notes/delete/2" method="POST" style="display:inline;">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>
    </div>
</div>

<!-- Delete Note 3 -->
<div id="modal-delete-3" class="modal-overlay">
    <div class="modal sm">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Delete Note</h3>
        <p class="sub">This cannot be undone. Are you sure you want to delete <strong>"Spring Boot Annotations"</strong>?</p>
        <div class="modal-actions">
            <a href="#" class="btn btn-outline">Cancel</a>
            <form action="/notes/delete/3" method="POST" style="display:inline;">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>
    </div>
</div>

<!-- Delete Note 4 -->
<div id="modal-delete-4" class="modal-overlay">
    <div class="modal sm">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>Delete Note</h3>
        <p class="sub">This cannot be undone. Are you sure you want to delete <strong>"Java Streams Deep Dive"</strong>?</p>
        <div class="modal-actions">
            <a href="#" class="btn btn-outline">Cancel</a>
            <form action="/notes/delete/4" method="POST" style="display:inline;">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>