Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689DA21ADA7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168475; cv=none; b=fpr2WorKrWj0BMHtf4UJLrSevYwdYw7HMlOXsMKM7rrDiHWEZcFP0mmO2MurJhStJEa/EFQrUkt0HGPEdkI1ar5hn2sOzYLq+Yhucev1eccEci0igYe0XLpovEggjUYAwOPt3niC3M+FCa0DAhT3yJniqrtq/FWiDh17TFFkwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168475; c=relaxed/simple;
	bh=HfOvQa+lwoC5GoD+LhBgT7EGXokznWxwSsuvBd33gUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdAXZ7/SmNszPUwDBYJQ2CtrLD7nycq9vjmts7FkdER2ancfW7WC9drm0EsFxTSdvsnyB0Q6zJHm8CvFvPfzImXuyhEZ+YwLYNZX7wBwTO0O3Y7VbZtblbjR2jjmal4ozhJx0EBalyQvvCt86i6zCbNyxkbU8SdZbZxdR6rskPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJh09HAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJh09HAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F186EC4CEEA;
	Fri, 28 Mar 2025 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168474;
	bh=HfOvQa+lwoC5GoD+LhBgT7EGXokznWxwSsuvBd33gUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJh09HAE0icOGLAl4XfwZ/BVrvSh0RF1dYaInxI+7MIDT3Z+HjuRuKYrVXjD2HUAg
	 cWygHF31/zChase/KSMZwNIiZTgq0Ou4NisAjHJ3VyJHISX2PTxNqZ7gdXKawveF8f
	 YPYdA9Gj6rp4HP6ZwTOYdzihoEZXUuPkr6+LydEwqhLN0hOTzDDn5RCjpGyRU5hF4S
	 EtzqQJPHMTKXVjLCZc0U/7gH7T8MJBX+6GR/YAAe5dBt+aGyC1q6Zq4NlDYraOa/UV
	 bP7+cjMvb+LlxXPV0buwXtspCfxPcLE3BuAmlv8OdW51ZWmQL3J7EfbXnCH7333YSr
	 /Zmuw6dU+C63g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 13/49] x86/alternatives: Rename 'text_poke_finish()' to 'smp_text_poke_batch_finish()'
Date: Fri, 28 Mar 2025 14:26:28 +0100
Message-ID: <20250328132704.1901674-14-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This name is actively confusing as well, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_finish()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to smp_text_poke_batch_finish() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 2 +-
 arch/x86/kernel/ftrace.c             | 4 ++--
 arch/x86/kernel/jump_label.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index b7e8fb8f3648..6534c40b7427 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -42,7 +42,7 @@ extern int smp_text_poke_int3_trap_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
-extern void text_poke_finish(void);
+extern void smp_text_poke_batch_finish(void);
 
 #define INT3_INSN_SIZE		1
 #define INT3_INSN_OPCODE	0xCC
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e49c67c3942f..abe6a9fa9be7 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2866,7 +2866,7 @@ static void smp_text_poke_batch_flush(void *addr)
 	}
 }
 
-void text_poke_finish(void)
+void smp_text_poke_batch_finish(void)
 {
 	smp_text_poke_batch_flush(NULL);
 }
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 7175a0404def..c35a928364b9 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -58,7 +58,7 @@ void ftrace_arch_code_modify_post_process(void)
 	 * module load, and we need to finish the text_poke_queue()
 	 * that they do, here.
 	 */
-	text_poke_finish();
+	smp_text_poke_batch_finish();
 	ftrace_poke_late = 0;
 	mutex_unlock(&text_mutex);
 }
@@ -250,7 +250,7 @@ void ftrace_replace_code(int enable)
 		text_poke_queue((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
 		ftrace_update_record(rec, enable);
 	}
-	text_poke_finish();
+	smp_text_poke_batch_finish();
 }
 
 void arch_ftrace_update_code(int command)
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index 166e12037199..28be6eb6cb3d 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -143,6 +143,6 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 void arch_jump_label_transform_apply(void)
 {
 	mutex_lock(&text_mutex);
-	text_poke_finish();
+	smp_text_poke_batch_finish();
 	mutex_unlock(&text_mutex);
 }
-- 
2.45.2

