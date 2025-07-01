Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AD727381F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378198; cv=none; b=dGlGHZeL8Qw4+OpxjllXo/f12KA63VfkC4aFQ3WAQQBHnhhOiAaI2MhXGd2SyMRsbx2bxNijYLj75FY6WStX450jVdIOX2ESAVBdi2XzNnMPk5X+3OnA9j2mPsI9g4lcTRkPENoQ/PZeOXKh1XiJxH0ojs6wt+MSoJVF7flTvSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378198; c=relaxed/simple;
	bh=wQClYdyWZ7+lUrdBydq9nKTRqMs+zDy48A/ppFPNDFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewNCTakJSTDBhwT6WF416l852sNjjDUPMEo1NqfwxqkNyQijU7HGzk4p1L4WmwU1ropwK4zkXOYXxMlj+fQ/k5wRxAAx5Y30QyjFr3hw/IDXcPAOQkyRL6oZ17i+nDEjHrsJ2KZR5HAMMs0djLRgtvdELlDvN6sAoDVc8SyG5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18672381;
	Tue,  1 Jul 2025 06:56:20 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E573F58B;
	Tue,  1 Jul 2025 06:56:34 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 02/23] regset: Add explicit core note name in struct user_regset
Date: Tue,  1 Jul 2025 14:55:55 +0100
Message-Id: <20250701135616.29630-3-Dave.Martin@arm.com>
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

There is currently hard-coded logic spread around the tree for
determining the note name for regset notes emitted in coredumps.

Now that the names are declared explicitly in <uapi/elf.h>, this can be
simplified.

In preparation for getting rid of the special-case logic, add an
explicit core_note_name field in struct user_regset for specifying the
note name explicitly.  To help avoid mistakes, a convenience macro
USER_REGSET_NOTE_TYPE() is provided to set .core_note_type and
.core_note_name based on the note type.

When dumping core, use the new field to set the note name, if the
regset specifies it.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 fs/binfmt_elf.c        |  8 ++++++--
 include/linux/regset.h | 10 ++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43363d593e5..f1069103ca24 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1727,6 +1727,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	for (view_iter = 1; view_iter < view->n; ++view_iter) {
 		const struct user_regset *regset = &view->regsets[view_iter];
 		int note_type = regset->core_note_type;
+		const char *note_name = regset->core_note_name;
 		bool is_fpreg = note_type == NT_PRFPREG;
 		void *data;
 		int ret;
@@ -1747,8 +1748,11 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 		if (is_fpreg)
 			SET_PR_FPVALID(&t->prstatus);
 
-		fill_note(&t->notes[note_iter], is_fpreg ? NN_PRFPREG : "LINUX",
-			  note_type, ret, data);
+		if (!note_name)
+			note_name = is_fpreg ? NN_PRFPREG : "LINUX";
+
+		fill_note(&t->notes[note_iter], note_name, note_type,
+			  ret, data);
 
 		info->size += notesize(&t->notes[note_iter]);
 		note_iter++;
diff --git a/include/linux/regset.h b/include/linux/regset.h
index 02417e934845..ad1ca6fe04f4 100644
--- a/include/linux/regset.h
+++ b/include/linux/regset.h
@@ -151,6 +151,7 @@ typedef int user_regset_writeback_fn(struct task_struct *target,
  * @align:		Required alignment, in bytes.
  * @bias:		Bias from natural indexing.
  * @core_note_type:	ELF note @n_type value used in core dumps.
+ * @core_note_name:	ELF note name to qualify the note type.
  * @regset_get:		Function to fetch values.
  * @set:		Function to store values.
  * @active:		Function to report if regset is active, or %NULL.
@@ -190,6 +191,10 @@ typedef int user_regset_writeback_fn(struct task_struct *target,
  *
  * If nonzero, @core_note_type gives the n_type field (NT_* value)
  * of the core file note in which this regset's data appears.
+ * @core_note_name specifies the note name.  The preferred way to
+ * specify these two fields is to use the @USER_REGSET_NOTE_TYPE()
+ * macro.
+ *
  * NT_PRSTATUS is a special case in that the regset data starts at
  * offsetof(struct elf_prstatus, pr_reg) into the note data; that is
  * part of the per-machine ELF formats userland knows about.  In
@@ -207,8 +212,13 @@ struct user_regset {
 	unsigned int 			align;
 	unsigned int 			bias;
 	unsigned int 			core_note_type;
+	const char			*core_note_name;
 };
 
+#define USER_REGSET_NOTE_TYPE(type) \
+	.core_note_type			= (NT_ ## type), \
+	.core_note_name			= (NN_ ## type)
+
 /**
  * struct user_regset_view - available regsets
  * @name:	Identifier, e.g. UTS_MACHINE string.
-- 
2.34.1

