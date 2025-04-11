Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606FA281536
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350108; cv=none; b=svd3JUHcdNiCJg+Fd3WpvFPQau7dLoYCd+/Wjys+koWlYA909EL2sRGmIrBODrny2KeXK7sXZSUWEz5d5wswuNk9LpmG+zOZ6pMkizTvs8mX4iCVw/yWfVfEzD9ePgMfROn2xfKUmcsVr/Tn3YB6x7bd6CjbdocN65bIFCpowTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350108; c=relaxed/simple;
	bh=CtYdubQzU/wKiIbjdpR3sYf3OATSeMckXnWIpeQyi98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQnH+SWkJPxoZjm2mZe/zbYmBFaUeNaDhj4Gv7adud1u21sUKfqBUwafaurM9zaGhXQu8aME3kuovX+QVxDjFOUABtfqKgvQeX8JMKrwICMzuRaJBLPi0eJaRreF9Unm1phHS7p6/KtzU1iYa5uTA7MAFi9sGKy0b+xjA3Mzwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn5fSagN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn5fSagN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA98C4CEE2;
	Fri, 11 Apr 2025 05:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350108;
	bh=CtYdubQzU/wKiIbjdpR3sYf3OATSeMckXnWIpeQyi98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pn5fSagN2qxOTTGne15Py8nlssPv548QtIhOGcrqnDzrLGmDriSVHd8GHzwZkRvLC
	 LrVSkVbbMePDBUoAN25ABoHzFOV6UOKLHJ9rrUpadqKbVpiRnhi2hqO0LNY4+UzM1I
	 BtXNezeqyLxNnd63xgATVnaJz+zjgGDHALVtxdLPoZHfKXg0+qK4sDL7oBrAx96oZI
	 j0sX3mKw7ReJzK/++JcnZJ8IPbDNcvaJLxoo9QqrgXk8xhK+AO8iRp1+deE4wBEgpA
	 tHlJcAyl9ErJFTXAeRBvJIq+aFoOVD96GHMtbxfuWYrkmsEmEZ6Tpg7wDzF219jHzD
	 aY6N/j+D82uXQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 15/53] x86/alternatives: Rename 'text_poke_finish()' to 'smp_text_poke_batch_finish()'
Date: Fri, 11 Apr 2025 07:40:27 +0200
Message-ID: <20250411054105.2341982-16-mingo@kernel.org>
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
index 7e3527385708..f27d29042f8c 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -42,7 +42,7 @@ extern int smp_text_poke_int3_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
-extern void text_poke_finish(void);
+extern void smp_text_poke_batch_finish(void);
 
 #define INT3_INSN_SIZE		1
 #define INT3_INSN_OPCODE	0xCC
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 35a89ead153c..63561e81bfaf 100644
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

