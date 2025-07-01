Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE63827EC73
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378227; cv=none; b=KJR+PNZNfq0UYAwYP+H5lw31mOOQeQwIk++Fzyd17+AfhblBrwt50WLT554uqS4CjXsVhqL3pUmCEWN/l3qfRdNcbrWN9x/lfqy9Qp3wvNPg4lnv2iTgmkd+Dx0g9ISdLfsSjvqpnJ3SK6LgSOqbN02DEpsl0Kd/uU6x4daFO18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378227; c=relaxed/simple;
	bh=oJJGSSQc4j6H3A33cfZyxTTalHG3CGfOj84UsBWoA4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YHiIWM0I70wbZgQ5qgOwc79fv1N0VuMJltmrYGbHK2vq3jYIPpcg7E72yWg//ltEs62qwjjU/tQvnBmLwK4UMafGq3wrgytob2juDjLqc/r2vWvwJ9UvD6zNvj9W89s49cJmuKkBqkabpBXsy1iE9RvA/hKQEhMr26Ym6DApwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB432F60;
	Tue,  1 Jul 2025 06:56:50 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B13FC3F58B;
	Tue,  1 Jul 2025 06:57:03 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	x86@kernel.org
Subject: [PATCH 20/23] x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:13 +0100
Message-Id: <20250701135616.29630-21-Dave.Martin@arm.com>
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

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: x86@kernel.org
---
 arch/x86/kernel/ptrace.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 095f04bdabdc..3dcadc13f09a 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -1236,7 +1236,7 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 
 static struct user_regset x86_64_regsets[] __ro_after_init = {
 	[REGSET64_GENERAL] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= sizeof(struct user_regs_struct) / sizeof(long),
 		.size		= sizeof(long),
 		.align		= sizeof(long),
@@ -1244,7 +1244,7 @@ static struct user_regset x86_64_regsets[] __ro_after_init = {
 		.set		= genregs_set
 	},
 	[REGSET64_FP] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= sizeof(struct fxregs_state) / sizeof(long),
 		.size		= sizeof(long),
 		.align		= sizeof(long),
@@ -1253,7 +1253,7 @@ static struct user_regset x86_64_regsets[] __ro_after_init = {
 		.set		= xfpregs_set
 	},
 	[REGSET64_XSTATE] = {
-		.core_note_type	= NT_X86_XSTATE,
+		USER_REGSET_NOTE_TYPE(X86_XSTATE),
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
 		.active		= xstateregs_active,
@@ -1261,7 +1261,7 @@ static struct user_regset x86_64_regsets[] __ro_after_init = {
 		.set		= xstateregs_set
 	},
 	[REGSET64_IOPERM] = {
-		.core_note_type	= NT_386_IOPERM,
+		USER_REGSET_NOTE_TYPE(386_IOPERM),
 		.n		= IO_BITMAP_LONGS,
 		.size		= sizeof(long),
 		.align		= sizeof(long),
@@ -1270,7 +1270,7 @@ static struct user_regset x86_64_regsets[] __ro_after_init = {
 	},
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 	[REGSET64_SSP] = {
-		.core_note_type	= NT_X86_SHSTK,
+		USER_REGSET_NOTE_TYPE(X86_SHSTK),
 		.n		= 1,
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
@@ -1297,7 +1297,7 @@ static const struct user_regset_view user_x86_64_view = {
 #if defined CONFIG_X86_32 || defined CONFIG_IA32_EMULATION
 static struct user_regset x86_32_regsets[] __ro_after_init = {
 	[REGSET32_GENERAL] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= sizeof(struct user_regs_struct32) / sizeof(u32),
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
@@ -1305,7 +1305,7 @@ static struct user_regset x86_32_regsets[] __ro_after_init = {
 		.set		= genregs32_set
 	},
 	[REGSET32_FP] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= sizeof(struct user_i387_ia32_struct) / sizeof(u32),
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
@@ -1314,7 +1314,7 @@ static struct user_regset x86_32_regsets[] __ro_after_init = {
 		.set		= fpregs_set
 	},
 	[REGSET32_XFP] = {
-		.core_note_type	= NT_PRXFPREG,
+		USER_REGSET_NOTE_TYPE(PRXFPREG),
 		.n		= sizeof(struct fxregs_state) / sizeof(u32),
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
@@ -1323,7 +1323,7 @@ static struct user_regset x86_32_regsets[] __ro_after_init = {
 		.set		= xfpregs_set
 	},
 	[REGSET32_XSTATE] = {
-		.core_note_type	= NT_X86_XSTATE,
+		USER_REGSET_NOTE_TYPE(X86_XSTATE),
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
 		.active		= xstateregs_active,
@@ -1331,7 +1331,7 @@ static struct user_regset x86_32_regsets[] __ro_after_init = {
 		.set		= xstateregs_set
 	},
 	[REGSET32_TLS] = {
-		.core_note_type	= NT_386_TLS,
+		USER_REGSET_NOTE_TYPE(386_TLS),
 		.n		= GDT_ENTRY_TLS_ENTRIES,
 		.bias		= GDT_ENTRY_TLS_MIN,
 		.size		= sizeof(struct user_desc),
@@ -1341,7 +1341,7 @@ static struct user_regset x86_32_regsets[] __ro_after_init = {
 		.set		= regset_tls_set
 	},
 	[REGSET32_IOPERM] = {
-		.core_note_type	= NT_386_IOPERM,
+		USER_REGSET_NOTE_TYPE(386_IOPERM),
 		.n		= IO_BITMAP_BYTES / sizeof(u32),
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
-- 
2.34.1

