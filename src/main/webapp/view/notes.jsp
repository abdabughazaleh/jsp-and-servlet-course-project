<%@ page import="model.dto.NoteDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            background: rgba(0, 0, 0, 0.48);
            backdrop-filter: blur(4px);
            z-index: 500;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .modal-overlay:target {
            display: flex;
        }

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

        .modal.sm {
            max-width: 380px;
        }

        @keyframes modalIn {
            from {
                opacity: 0;
                transform: scale(.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .modal h3 {
            font-family: 'Fraunces', serif;
            font-size: 24px;
            font-weight: 900;
            margin-bottom: 4px;
        }

        .modal .sub {
            font-size: 14px;
            color: var(--muted);
            margin-bottom: 26px;
        }

        .modal-actions {
            display: flex;
            gap: 10px;
            margin-top: 24px;
            justify-content: flex-end;
        }

        .modal-close {
            position: absolute;
            top: 16px;
            right: 18px;
            font-size: 22px;
            color: var(--muted);
            text-decoration: none;
            line-height: 1;
            transition: color .15s;
        }

        .modal-close:hover {
            color: var(--ink);
        }
    </style>
</head>
<body>

<!-- ═══ HEADER ═══ -->
<jsp:include page="layout/header.jsp"></jsp:include>


<!-- ═══ MAIN ═══ -->
<main>
    <%
        String noteCode = request.getParameter("noteCode");
        if (noteCode == null) {
    %>
    <div class="page-title-bar anim">
        <h1>My Notes</h1>
        <!-- Opens the Add Note modal -->
        <a href="#modal-add" class="btn btn-primary">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v14M5 12h14"/>
            </svg>
            New Note
        </a>
    </div>

    <div class="notes-grid">
        <%
            Object noteObj = request.getAttribute("notes");
            List<NoteDTO> notes = new ArrayList<>();
            if (noteObj != null)
                notes = (List<NoteDTO>) noteObj;
            for (NoteDTO note : notes) {
        %>
        <div class="note-card anim anim-d1">
            <div class="note-meta">
                <span class="note-tag">Note</span>
                <span class="note-date"><%= note.createdAt() %></span>
            </div>
            <h3><%= note.title() %>
            </h3>
            <p>
                <%= note.note() %>
            </p>
            <div class="note-actions">
                <a href="/notes?noteCode=<%= note.noteCode() %>" class="btn btn-outline btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                    </svg>
                    Edit
                </a>
                <a onclick="deleteByCode('<%= note.noteCode() %>' , 'view')"
                   class="btn btn-danger btn-sm">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                    </svg>
                    Delete
                </a>
            </div>
        </div>
        <%}%>
    </div>
    <%
    } else {
        NoteDTO noteDto = (NoteDTO) request.getAttribute("note_dto");
    %>
    <div class="note-card anim anim-d1">
        <%
            String status = request.getParameter("status");
            if (status != null && status.equals("updated")) {
        %>
        <div style="background-color: greenyellow;
        margin: 10px;
        color: black; font-weight:
        bold; padding: 20px;
        border-radius: 5px;">
            The note has updated successfully!
        </div>
        <%}%>
        <h3>Edit Note</h3>
        <p class="sub">Update your note details</p>
        <form action="/notes?action=update&noteCode=<%= noteDto.noteCode() %>" method="POST">
            <div class="form-group">
                <label for="edit-title-1">Title</label>
                <input type="text" id="edit-title-1" name="title" value="<%= noteDto.title() %>" required>
            </div>
            <div class="form-group">
                <label for="edit-desc-1">Note </label>
                <textarea id="edit-desc-1" name="note" required><%= noteDto.note() %></textarea>
            </div>
            <div class="modal-actions">
                <div>
                    Lasts update : <%= noteDto.updatedAt() %>
                </div>
                <a href="/notes" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
    <%}%>
</main>


<!-- ═══ FOOTER ═══ -->
<jsp:include page="layout/footer.jsp"/>


<!-- ═══════════════════════════════════════
     MODALS  (CSS :target — no JavaScript)
     ═══════════════════════════════════════ -->

<!-- ADD NOTE MODAL -->
<div id="modal-add" class="modal-overlay">
    <div class="modal">
        <a href="#" class="modal-close" title="Close">×</a>
        <h3>New Note</h3>
        <p class="sub">Capture your thoughts and learnings</p>
        <form action="/notes" method="POST">
            <div class="form-group">
                <label for="add-title">Title</label>
                <input type="text" id="add-title" name="title" placeholder="e.g. Java Streams Overview" required>
            </div>
            <div class="form-group">
                <label for="add-desc">Note</label>
                <textarea id="add-desc" name="note" placeholder="Write your note here..." required></textarea>
            </div>
            <div class="modal-actions">
                <a href="#" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Note</button>
            </div>
        </form>
    </div>
</div>


<!-- DELETE CONFIRM MODALS -->

<!-- Delete Note 1 -->
<div id="modal-delete" class="modal-overlay">
    <div class="modal sm">
        <a href="#" class="modal-close" title="Close">X</a>
        <h3>Delete Note</h3>
        <p class="sub">This cannot be undone. Are you sure you want to delete <strong>"JVM Memory Model"</strong>?</p>
        <div class="modal-actions">
            <button onclick="cancelDelete()" class="btn btn-outline">Cancel</button>
            <button onclick="deleteByCode(null , 'delete')" class="btn btn-danger">Delete</button>
        </div>
    </div>
</div>

<script>
    const model = document.getElementById('modal-delete');
    let selectedNoteCode = null;

    function deleteByCode(code, action) {
        if (code != null && action === 'view') {
            model.style.display = 'block';
            selectedNoteCode = code;
        }
        if (action === 'delete' && selectedNoteCode != null) {
            window.location.href = '/notes?action=delete&noteCode=' + selectedNoteCode;
        }
    }

    function cancelDelete() {
        model.style.display = 'none';
    }


</script>


</body>
</html>