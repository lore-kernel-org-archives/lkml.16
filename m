Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307D2853FD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350111; cv=none; b=pZPwtjUN9vw/YzPeOPjmsDv6gvIFMQNA5itCa8W6OOYYH3InIiywGb6d/UKMnZxdyDNwDQuT+jqbZ9IjRP52SUnEqL4REMV83wfoV9Shzw9kgcufzrG5BwRG5ArGcGwMDhgM4Cipznu91/fdZPQ6ZeDLOiF5Mk1CYLUH2ct8HT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350111; c=relaxed/simple;
	bh=CBCUwNluC97sqq7ctdVuJJUBnC49P33NBLd+/VXkG/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+n648v1AhGSYrl7TjcNPLwEBETFbCyyh//A7LE+dkdU2zQaHUzVGQzDAV2f/Trmo69xvt97X8Du+yHtK62ZvemQ799TQsxRx3x/qZWadbwUc4bI8xKMeApok4sp0rb6213bZbKyZmX30xE1nIODkHCph3HRFqYbl1vrLVa596k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcMv30QH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcMv30QH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB70DC4CEE2;
	Fri, 11 Apr 2025 05:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350110;
	bh=CBCUwNluC97sqq7ctdVuJJUBnC49P33NBLd+/VXkG/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcMv30QHt6FZ5HeU1jXziG3TVyVtgLR+1Trdyb9fL0qD2zD+hLol/0Ev9fktjcCNG
	 wBjTf/dZHNvNGQc5Xji5nIt3bv5ISPkxJAByDgDnGw7eIZ0O5FJAvIsH+L36aMp/H9
	 RrqaCF+6so5NXmMaPlcnt1Tf82xK9xNkXBQIyGvNirz39OPiw76G0nKHvSDcfEXmdE
	 iBgqVzKyvj1lmeqsgBnshZVY1JiVLYAeawtys4UADLJiaMA9MR0Cacplp4IQNno4aM
	 YpCDMWZo7bTZPaqi7+wmtWnHl2mc+vM050SuF6GwtErO1hCYX10iS7/aIDhrCFKBkw
	 t199mF4nuEgaA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 16/53] x86/alternatives: Rename 'text_poke_queue()' to 'smp_text_poke_batch_add()'
Date: Fri, 11 Apr 2025 07:40:28 +0200
Message-ID: <20250411054105.2341982-17-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This name is actively confusing as well, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_queue()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to smp_text_poke_batch_add() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 2 +-
 arch/x86/kernel/ftrace.c             | 6 +++---
 arch/x86/kernel/jump_label.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index f27d29042f8c..f3c9b70afb0c 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -41,7 +41,7 @@ extern void *text_poke_set(void *addr, int c, size_t len);
 extern int smp_text_poke_int3_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
-extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void smp_text_poke_batch_finish(void);
 
 #define INT3_INSN_SIZE		1
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 63561e81bfaf..1c8316e8b7f1 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2871,7 +2871,7 @@ void smp_text_poke_batch_finish(void)
 	smp_text_poke_batch_flush(NULL);
 }
 
-void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate)
+void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc *tp;
 
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index c35a928364b9..0853ba3fd04a 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -55,7 +55,7 @@ void ftrace_arch_code_modify_post_process(void)
 {
 	/*
 	 * ftrace_make_{call,nop}() may be called during
-	 * module load, and we need to finish the text_poke_queue()
+	 * module load, and we need to finish the smp_text_poke_batch_add()
 	 * that they do, here.
 	 */
 	smp_text_poke_batch_finish();
@@ -119,7 +119,7 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
 
 	/* replace the text with the new text */
 	if (ftrace_poke_late)
-		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
+		smp_text_poke_batch_add((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
 	else
 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
 	return 0;
@@ -247,7 +247,7 @@ void ftrace_replace_code(int enable)
 			break;
 		}
 
-		text_poke_queue((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
+		smp_text_poke_batch_add((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
 		ftrace_update_record(rec, enable);
 	}
 	smp_text_poke_batch_finish();
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index 28be6eb6cb3d..a7949a54a0ff 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -135,7 +135,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 
 	mutex_lock(&text_mutex);
 	jlp = __jump_label_patch(entry, type);
-	text_poke_queue((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	smp_text_poke_batch_add((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
 	mutex_unlock(&text_mutex);
 	return true;
 }
-- 
2.45.2

