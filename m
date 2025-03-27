Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404B1EEA36
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108877; cv=none; b=DP0I03WqDo6oEy8FDgxOeRUVKydctDijZzMf2zdiYgDhDOTZxw1KPj4qMew0Puu5edj/IRTuuMLf/fKsMdKnnwa5g+A9Zvbd/uX+lhk6qOo7x1/Uk3YserIs1vp1exarBG9u/4rsQnR7tEiOiBZlDndEkKV7Mb5XPlRjNlaJdnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108877; c=relaxed/simple;
	bh=Rcm7aODbPt6k9TQCqfcINk0B2Wgiw5pPYjpzJmh42nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0BuRObU74fFeKDxZlmtATT74pcQdb/MoLxpLhLLhhpHSMuyZNgDBdnC+oJcYW3tzKMrTgqQxhfXex3CYPo10fI5AZVQDqFXJBAtZ+J/M+GSrZjaKyHJpFWtS5z+KASXPnKlFRTB+UB5EZwl6EE0HLn/3TIxqQguNzgDXHhQ7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbsRmzQC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbsRmzQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC77C4CEE8;
	Thu, 27 Mar 2025 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108876;
	bh=Rcm7aODbPt6k9TQCqfcINk0B2Wgiw5pPYjpzJmh42nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sbsRmzQCHWvhZwPqeuOkD9/tXEaPe7WEBIS4EB7bT+wmr3sztpGT7cMTWiJuFCJZ9
	 sIu9WCgnd60+MvETnGy4rE3R3IJ8kBwee98f9mSaDTOvrSH2OnzYgmOcfyWW3VKccy
	 a9ap20ZjMk8N3515iSQJBchvcRJeQzZzNgVSiauS1pUn3o2Vv/pX4wLVjw1Hagokid
	 ZflYEYhsBpaBOH1J5zgccEnDXwbNcrNXt7g+FEWeI7EmR9eVbukvLgWk/tC7+IC4ep
	 x8mmeMeGsZlF1oFWcTko4nrsQSsdrCV3OXMVmULwAHpBP6bNDVGR9HXyCTJwainfeP
	 NwauHikSl+gzA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 15/41] x86/alternatives: Rename 'text_poke_queue()' to 'text_poke_int3_queue()'
Date: Thu, 27 Mar 2025 21:53:28 +0100
Message-ID: <20250327205355.378659-16-mingo@kernel.org>
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
APIs use MM-switching based code patching, while text_poke_queue()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to text_poke_int3_queue() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 2 +-
 arch/x86/kernel/ftrace.c             | 6 +++---
 arch/x86/kernel/jump_label.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 43c5f3aecf02..7deb06aec467 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -41,7 +41,7 @@ extern void *text_poke_set(void *addr, int c, size_t len);
 extern int text_poke_int3_handler(struct pt_regs *regs);
 extern void text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate);
 
-extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void text_poke_int3_finish(void);
 
 #define INT3_INSN_SIZE		1
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cc86c1399a7b..89ab3a11f26e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2871,7 +2871,7 @@ void text_poke_int3_finish(void)
 	text_poke_int3_flush(NULL);
 }
 
-void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate)
+void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc *tp;
 
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 7ab5657078a4..ff3cdd08f28f 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -55,7 +55,7 @@ void ftrace_arch_code_modify_post_process(void)
 {
 	/*
 	 * ftrace_make_{call,nop}() may be called during
-	 * module load, and we need to finish the text_poke_queue()
+	 * module load, and we need to finish the text_poke_int3_queue()
 	 * that they do, here.
 	 */
 	text_poke_int3_finish();
@@ -119,7 +119,7 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
 
 	/* replace the text with the new text */
 	if (ftrace_poke_late)
-		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
+		text_poke_int3_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
 	else
 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
 	return 0;
@@ -247,7 +247,7 @@ void ftrace_replace_code(int enable)
 			break;
 		}
 
-		text_poke_queue((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
+		text_poke_int3_queue((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
 		ftrace_update_record(rec, enable);
 	}
 	text_poke_int3_finish();
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index 5a1adf229fcf..f72738e6d7d4 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -135,7 +135,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 
 	mutex_lock(&text_mutex);
 	jlp = __jump_label_patch(entry, type);
-	text_poke_queue((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	text_poke_int3_queue((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
 	mutex_unlock(&text_mutex);
 	return true;
 }
-- 
2.45.2

