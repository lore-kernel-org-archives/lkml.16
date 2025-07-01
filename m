Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26282777E2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378200; cv=none; b=S/InZOfMN9NOtlbdRw5n9FpDMu9WCJEfDjWKPQdWnnHf+3gMcVU0Qd0Cr4TnwxBGIyOWac84XMCS9LngA674C6TSiXu6OXMmgkiBl0WPVbv/zml6Nx9mqdctMC3F3uA8G8VXuj5UTVGgdfPMMYzr4qmF5ktUeK65h2FikNMW1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378200; c=relaxed/simple;
	bh=W+kCIfTCQUoCgl6X32zm/tFOFqY0TcwVE/cx63X5Eo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EyrjIbpfL9Tq61LhgkXC3KwUF4aRDfYkvgLnsX2XDIJMhM/LIeQb4F+OKY7I2M/9br6GBKZHtyOb5KydjMl4tFsn0yryiohdxyE3CCvwl6Ttg+W52+4xkLfq14iwUTOaBPjOFFjo/3xEyuFRx7IAVPjv06A0EIgidqJ7z97fMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD0DB26A4;
	Tue,  1 Jul 2025 06:56:21 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8EF3F58B;
	Tue,  1 Jul 2025 06:56:36 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 03/23] binfmt_elf: Dump non-arch notes with strictly matching name and type
Date: Tue,  1 Jul 2025 14:55:56 +0100
Message-Id: <20250701135616.29630-4-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The note names for some arch-independent coredump notes are specified
manually, albeit by referring to the NN_<foo> #define corresponding
to the NT_<foo> #define that specifies the note type.

Now that there are no exceptional cases, refactor fill_note() to pick
the correct NN_ and NT_ macros implcitly for the requested note type.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 fs/binfmt_elf.c       | 27 ++++++++++++++-------------
 fs/binfmt_elf_fdpic.c | 17 +++++++++--------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index f1069103ca24..89063d1d9e9a 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1450,8 +1450,8 @@ static void fill_elf_note_phdr(struct elf_phdr *phdr, int sz, loff_t offset)
 	phdr->p_align = 4;
 }
 
-static void fill_note(struct memelfnote *note, const char *name, int type,
-		unsigned int sz, void *data)
+static void __fill_note(struct memelfnote *note, const char *name, int type,
+			unsigned int sz, void *data)
 {
 	note->name = name;
 	note->type = type;
@@ -1459,6 +1459,9 @@ static void fill_note(struct memelfnote *note, const char *name, int type,
 	note->data = data;
 }
 
+#define fill_note(note, type, sz, data) \
+	__fill_note(note, NN_ ## type, NT_ ## type, sz, data)
+
 /*
  * fill up all the fields in prstatus from the given task struct, except
  * registers which need to be filled up separately.
@@ -1549,14 +1552,14 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 	do
 		i += 2;
 	while (auxv[i - 2] != AT_NULL);
-	fill_note(note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
+	fill_note(note, AUXV, i * sizeof(elf_addr_t), auxv);
 }
 
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
 	copy_siginfo_to_external(csigdata, siginfo);
-	fill_note(note, NN_SIGINFO, NT_SIGINFO, sizeof(*csigdata), csigdata);
+	fill_note(note, SIGINFO, sizeof(*csigdata), csigdata);
 }
 
 /*
@@ -1652,7 +1655,7 @@ static int fill_files_note(struct memelfnote *note, struct coredump_params *cprm
 	}
 
 	size = name_curpos - (char *)data;
-	fill_note(note, NN_FILE, NT_FILE, size, data);
+	fill_note(note, FILE, size, data);
 	return 0;
 }
 
@@ -1713,8 +1716,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	regset_get(t->task, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS,
-		  PRSTATUS_SIZE, &t->prstatus);
+	fill_note(&t->notes[0], PRSTATUS, PRSTATUS_SIZE, &t->prstatus);
 	info->size += notesize(&t->notes[0]);
 
 	do_thread_regset_writeback(t->task, &view->regsets[0]);
@@ -1751,8 +1753,8 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 		if (!note_name)
 			note_name = is_fpreg ? NN_PRFPREG : "LINUX";
 
-		fill_note(&t->notes[note_iter], note_name, note_type,
-			  ret, data);
+		__fill_note(&t->notes[note_iter], note_name, note_type,
+			    ret, data);
 
 		info->size += notesize(&t->notes[note_iter]);
 		note_iter++;
@@ -1771,8 +1773,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	fill_prstatus(&t->prstatus.common, p, signr);
 	elf_core_copy_task_regs(p, &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS, sizeof(t->prstatus),
-		  &(t->prstatus));
+	fill_note(&t->notes[0], PRSTATUS, sizeof(t->prstatus), &t->prstatus);
 	info->size += notesize(&t->notes[0]);
 
 	fpu = kzalloc(sizeof(elf_fpregset_t), GFP_KERNEL);
@@ -1782,7 +1783,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	}
 
 	t->prstatus.pr_fpvalid = 1;
-	fill_note(&t->notes[1], NN_PRFPREG, NT_PRFPREG, sizeof(*fpu), fpu);
+	fill_note(&t->notes[1], PRFPREG, sizeof(*fpu), fpu);
 	info->size += notesize(&t->notes[1]);
 
 	return 1;
@@ -1802,7 +1803,7 @@ static int fill_note_info(struct elfhdr *elf, int phdrs,
 	psinfo = kmalloc(sizeof(*psinfo), GFP_KERNEL);
 	if (!psinfo)
 		return 0;
-	fill_note(&info->psinfo, NN_PRPSINFO, NT_PRPSINFO, sizeof(*psinfo), psinfo);
+	fill_note(&info->psinfo, PRPSINFO, sizeof(*psinfo), psinfo);
 
 #ifdef CORE_DUMP_USE_REGSET
 	view = task_user_regset_view(dump_task);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 9133f3827f90..68b884df2011 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1275,8 +1275,8 @@ static inline void fill_elf_note_phdr(struct elf_phdr *phdr, int sz, loff_t offs
 	return;
 }
 
-static inline void fill_note(struct memelfnote *note, const char *name, int type,
-		unsigned int sz, void *data)
+static inline void __fill_note(struct memelfnote *note, const char *name, int type,
+			       unsigned int sz, void *data)
 {
 	note->name = name;
 	note->type = type;
@@ -1285,6 +1285,9 @@ static inline void fill_note(struct memelfnote *note, const char *name, int type
 	return;
 }
 
+#define fill_note(note, type, sz, data) \
+	__fill_note(note, NN_ ## type, NT_ ## type, sz, data)
+
 /*
  * fill up all the fields in prstatus from the given task struct, except
  * registers which need to be filled up separately.
@@ -1398,8 +1401,7 @@ static struct elf_thread_status *elf_dump_thread_status(long signr, struct task_
 	regset_get(p, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS, sizeof(t->prstatus),
-		  &t->prstatus);
+	fill_note(&t->notes[0], PRSTATUS, sizeof(t->prstatus), &t->prstatus);
 	t->num_notes++;
 	*sz += notesize(&t->notes[0]);
 
@@ -1416,8 +1418,7 @@ static struct elf_thread_status *elf_dump_thread_status(long signr, struct task_
 	}
 
 	if (t->prstatus.pr_fpvalid) {
-		fill_note(&t->notes[1], NN_PRFPREG, NT_PRFPREG, sizeof(t->fpu),
-			  &t->fpu);
+		fill_note(&t->notes[1], PRFPREG, sizeof(t->fpu), &t->fpu);
 		t->num_notes++;
 		*sz += notesize(&t->notes[1]);
 	}
@@ -1531,7 +1532,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 	 */
 
 	fill_psinfo(psinfo, current->group_leader, current->mm);
-	fill_note(&psinfo_note, NN_PRPSINFO, NT_PRPSINFO, sizeof(*psinfo), psinfo);
+	fill_note(&psinfo_note, PRPSINFO, sizeof(*psinfo), psinfo);
 	thread_status_size += notesize(&psinfo_note);
 
 	auxv = (elf_addr_t *) current->mm->saved_auxv;
@@ -1539,7 +1540,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 	do
 		i += 2;
 	while (auxv[i - 2] != AT_NULL);
-	fill_note(&auxv_note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
+	fill_note(&auxv_note, AUXV, i * sizeof(elf_addr_t), auxv);
 	thread_status_size += notesize(&auxv_note);
 
 	offset = sizeof(*elf);				/* ELF header */
-- 
2.34.1

