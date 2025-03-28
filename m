Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943221B8F7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168477; cv=none; b=GwkhCoEQs7I9an4tjyIMcvDDpGpEqqKx2Apu3sGCBLw2xDHKfObDTWCw7absYXAvySqQtS9hFzr3P1br98n8AZ+lM6vNaFONAJL7Dv4xpBJjlBkui+U9WHTkSk7UweKZ+T0EEUFbPLINv/rPvKiztuP2h22gcECAbsHMO3nWLsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168477; c=relaxed/simple;
	bh=Ay9k+hwCwyO8Rw+Z0t7cOKmrOufhTPPEd5PwqwP6Fdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnrRv7xAn6FF2z1SCXF9s0nj/dEgQDn9uTgkySv6cC4629nU0oIryPM1NC1fj623JnHU1BRHUKCcnyKXKEr/pM1yVcgROET1AEC03YtxuwxkE+E14FBMP22fGvp4hidC8+ZrWddNdadLLJuOikYtv9tvsQts564hkH3i/gwnQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkXkaiWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkXkaiWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C422C4CEE5;
	Fri, 28 Mar 2025 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168477;
	bh=Ay9k+hwCwyO8Rw+Z0t7cOKmrOufhTPPEd5PwqwP6Fdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkXkaiWSIfTLcLdAXKSTL5111s4/0fdQkirzpfplPsIp81AqA+XpJJ2kxetKZCijR
	 VnqcSQaLFE5cNqoHA0PK55R5xMkd0w92M28R1VmNKb42hZRhRFdQ7V/lCwIaZfeEZY
	 B1aqyInrfUqUJKcqWZVqS0CPlnFxhS/oGWA+XQMGUX9x3Yf7P2TV7YJm0HCfVawmKO
	 pzn9IzO53+5Bebi9VJJuXB3xO1IQvQBXRi6xA7nhWQTf9MWAO9QBr0UNlAQ6Hv5dHt
	 qZBEvyhGekwip+b4XBOg0J60EJ6Ek6ZKKXJGDp3Ok4a6iry1CRngBIO1ifAboM/nev
	 BE72pZ6JihLSw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 14/49] x86/alternatives: Rename 'text_poke_queue()' to 'smp_text_poke_batch_add()'
Date: Fri, 28 Mar 2025 14:26:29 +0100
Message-ID: <20250328132704.1901674-15-mingo@kernel.org>
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
index 6534c40b7427..20ce4eda6d47 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -41,7 +41,7 @@ extern void *text_poke_set(void *addr, int c, size_t len);
 extern int smp_text_poke_int3_trap_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
-extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void smp_text_poke_batch_finish(void);
 
 #define INT3_INSN_SIZE		1
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index abe6a9fa9be7..3d395128f913 100644
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

