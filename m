Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F91EB5C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108874; cv=none; b=gFDx7FNTtmIdHcj4Nh8h8w8bZ+Q0TAt0Bopm1GEm3SRmxHe1OfjDOClAJ35RJEx7iU2NNaCMh4Nf9v4dnUitsdxTsv6xjOPI/jW1buvBMOCKwB6g5bFLKNFFR9vPyNhWvT/p+PvefnmDTRzNy4PGBl8xzFEx/SRmw8Z+njEel1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108874; c=relaxed/simple;
	bh=8eNzgbPU9418HKn6ZODmEq9IQh57gGCtuZbwYKe4FDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irWGtSh2Y5hh8wXhTnVAt3Dl+icpaGrjJxFW8X2DdAI0Nuj/5kB0/WnD/gWuxGUOHt7ZIYWvq3tKEbWIAnsCzFcA0apcVNxWYCUTTTIiPa6ZNbYCDR6TsmvXBOewJnSUhICr1NXMsk48mf6c8B9NJuydbzSXzkXSWAzQYS1Phyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq0IEeSy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq0IEeSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C51C4CEDD;
	Thu, 27 Mar 2025 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108874;
	bh=8eNzgbPU9418HKn6ZODmEq9IQh57gGCtuZbwYKe4FDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hq0IEeSyIYHz1MN1i4ysIyqaBsu5MbfWsoVkR+leb4Xiq3ub4t7iZDBmVGW5Rn+RT
	 s6uu2U2UEFhl0IexMtbooVncfOh75hmtWkhx7+nqfRM1g1JP7Empj8oOZ4pUtD4dZt
	 yyxjoVACgKEy5GyKPCWSTILV6y/wZXRbO5QOwOVw0Q64fvi9m/gz9Y1tGs3pM1gDkq
	 pozZStH9wz35IrkCDvy0wN1DXmCx2CfL1N/GrvtdmHY43Pbz0Uzyei8seGxsJqcHWj
	 hkmVe0Ln2EYQFSP/kYpec+UKMGAjb07w9IxaIdy+oZ4QISS75OresbldJTgIPG0hok
	 lOoTdy07wP5ng==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 14/41] x86/alternatives: Rename 'text_poke_finish()' to 'text_poke_int3_finish()'
Date: Thu, 27 Mar 2025 21:53:27 +0100
Message-ID: <20250327205355.378659-15-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
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

Rename it to text_poke_int3_finish() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 2 +-
 arch/x86/kernel/ftrace.c             | 4 ++--
 arch/x86/kernel/jump_label.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index c2dbb0e4d80d..43c5f3aecf02 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -42,7 +42,7 @@ extern int text_poke_int3_handler(struct pt_regs *regs);
 extern void text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
-extern void text_poke_finish(void);
+extern void text_poke_int3_finish(void);
 
 #define INT3_INSN_SIZE		1
 #define INT3_INSN_OPCODE	0xCC
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index bf8080a68f66..cc86c1399a7b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2866,7 +2866,7 @@ static void text_poke_int3_flush(void *addr)
 	}
 }
 
-void text_poke_finish(void)
+void text_poke_int3_finish(void)
 {
 	text_poke_int3_flush(NULL);
 }
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 4e284ff674f1..7ab5657078a4 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -58,7 +58,7 @@ void ftrace_arch_code_modify_post_process(void)
 	 * module load, and we need to finish the text_poke_queue()
 	 * that they do, here.
 	 */
-	text_poke_finish();
+	text_poke_int3_finish();
 	ftrace_poke_late = 0;
 	mutex_unlock(&text_mutex);
 }
@@ -250,7 +250,7 @@ void ftrace_replace_code(int enable)
 		text_poke_queue((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
 		ftrace_update_record(rec, enable);
 	}
-	text_poke_finish();
+	text_poke_int3_finish();
 }
 
 void arch_ftrace_update_code(int command)
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index 94e2dcc94d9d..5a1adf229fcf 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -143,6 +143,6 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 void arch_jump_label_transform_apply(void)
 {
 	mutex_lock(&text_mutex);
-	text_poke_finish();
+	text_poke_int3_finish();
 	mutex_unlock(&text_mutex);
 }
-- 
2.45.2

