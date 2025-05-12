Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453C2550B4
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032266; cv=none; b=sTt3oYm5QJIVET4BwPgkU4mjia0n1p2unMNhiMY3N7Qcn2fKgnQQ+Oysj8D76z5biOaylvdxOHSrtfDkXtSO7XIOTfJzZOgoEoLF3mZ8uOnhh0w/5SKI0Z6OmMZSUZVtBvNvXsKUEhBbESFvzCKdS4SBzoim50bUyK4TmcizB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032266; c=relaxed/simple;
	bh=TOlDLnyxf9L2S02cRqAbkAVnP5T6+RozN6zFpGxKiPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0lzGXnrLIi1NNRwBVRT93cWmOOOCUmwNZzJe1FM7Y/JYS52I/OEfgMj1kNsBdkV/RsW84nhn6gKMB6WAbs599i55nYQLi5iJ/JMldQ+HqBMuEPtQthnvMwOUkv3/i0g6PAl5KwWei0JtNblDisArhpl35JqVkoYFrnHO3yF3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=SBqZnvSh; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="SBqZnvSh"
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C6hsAw1535999
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 11 May 2025 23:43:58 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C6hsAw1535999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747032239;
	bh=t7smHFhPZ2uf/GM0m8OocHrVY4Vvhn9Iy2JjGqsjIAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SBqZnvShp4Mjqc0kGAdIbuTy9HfModC4TZAusPwVU66HFddQRJ85qEs0oyVHIsBJw
	 iEKAsG2Rv9xl+9XlN8b/4digNl6xrsjNOf4jSZMtlz8EqOBvZVpGzSqtR9TyZMWdtw
	 7UVEAuHTtSuzwPJZUHxjMSoBEETogfjEpHG0+/wlo2oeT6l/kj/SRD50hJIAuQBsPN
	 q/14REikTHKTOhKxNo1jIDeXlfp9mc+bSA/3v0GWkNF7TthM4pP0R56OzvrsKGTl45
	 pfBrkSUZBr7Ey6gm9QCRcsu/xx9rLZe26inlwqEjdXyFKrJ5tDWnQTNsg1vEfavlaU
	 24ZxVFuuKKIeg==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org
Cc: luto@kernel.org, tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, brgerst@gmail.com
Subject: [PATCH v4 1/2] x86/fred: Allow variable-sized event frame
Date: Sun, 11 May 2025 23:43:52 -0700
Message-ID: <20250512064353.1535984-2-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512064353.1535984-1-xin@zytor.com>
References: <20250512064353.1535984-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A FRED event frame could contain different amount of information for
different event types, or perhaps even for different instances of the
same event type. Thus the size of an event frame pushed by a FRED CPU
is not fixed and the address of the pt_regs structure that is used to
save a user level context of current task is not at a fixed offset
from top of current task kernel stack.

Add a new field named 'user_pt_regs' in the thread_info structure to
save the address of user level context pt_regs structure, thus to
eliminate the need of any advance information of event frame size
and allow a FRED CPU to push variable-sized event frame.

For IDT user level event delivery, a pt_regs structure is pushed by
hardware and software _always_ at a fixed offset from top of current
task kernel stack, so simply initialize user_pt_regs to point to the
pt_regs structure no matter whether one is pushed or not.

While for FRED user level event delivery, user_pt_regs is updated with
a pt_regs structure pointer generated in asm_fred_entrypoint_user().

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v3A:
* Add declaration for __top_init_kernel_stack[] (Intel lkp).

Change in v3:
* Replace "(struct pt_regs *)TOP_OF_INIT_STACK - 1" with
  (struct pt_regs *)__top_init_kernel_stack (Brian Gerst).
---
 arch/x86/entry/entry_fred.c        | 10 ++++++++++
 arch/x86/include/asm/processor.h   | 12 ++++++------
 arch/x86/include/asm/thread_info.h | 11 ++++++++---
 arch/x86/kernel/process.c          | 22 ++++++++++++++++++++++
 include/linux/thread_info.h        |  1 +
 kernel/fork.c                      |  6 ++++++
 6 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index f004a4dc74c2..a5f5bdd16ad8 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -228,6 +228,16 @@ __visible noinstr void fred_entry_from_user(struct pt_regs *regs)
 	/* Invalidate orig_ax so that syscall_get_nr() works correctly */
 	regs->orig_ax = -1;
 
+	/*
+	 * A FRED event frame could contain different amount of information
+	 * for different event types, or perhaps even for different instances
+	 * of the same event type. Thus the size of an event frame pushed by
+	 * a FRED CPU is not fixed and the address of the pt_regs structure
+	 * that is used to save a user level context of current task is not
+	 * at a fixed offset from top of current task stack.
+	 */
+	current->thread_info.user_pt_regs = regs;
+
 	switch (regs->fred_ss.type) {
 	case EVENT_TYPE_EXTINT:
 		return fred_extint(regs);
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 50d34698036d..42e5a6a41403 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -645,12 +645,12 @@ static __always_inline void prefetchw(const void *x)
 
 #define task_top_of_stack(task) ((unsigned long)(task_pt_regs(task) + 1))
 
-#define task_pt_regs(task) \
-({									\
-	unsigned long __ptr = (unsigned long)task_stack_page(task);	\
-	__ptr += THREAD_SIZE - TOP_OF_KERNEL_STACK_PADDING;		\
-	((struct pt_regs *)__ptr) - 1;					\
-})
+/*
+ * Note, this can't be converted to an inline function as this header
+ * file defines 'struct thread_struct' which is used in the task_struct
+ * structure definition.
+ */
+#define task_pt_regs(task) ((task)->thread_info.user_pt_regs)
 
 #ifdef CONFIG_X86_32
 #define INIT_THREAD  {							  \
diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index 9282465eea21..07c6a6a92c65 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -56,6 +56,7 @@
  */
 #ifndef __ASSEMBLER__
 struct task_struct;
+struct pt_regs;
 #include <asm/cpufeature.h>
 #include <linux/atomic.h>
 
@@ -66,11 +67,15 @@ struct thread_info {
 #ifdef CONFIG_SMP
 	u32			cpu;		/* current CPU */
 #endif
+	struct pt_regs		*user_pt_regs;
 };
 
-#define INIT_THREAD_INFO(tsk)			\
-{						\
-	.flags		= 0,			\
+extern unsigned long __top_init_kernel_stack[];
+
+#define INIT_THREAD_INFO(tsk)						\
+{									\
+	.flags		= 0,						\
+	.user_pt_regs	= (struct pt_regs *)__top_init_kernel_stack,	\
 }
 
 #else /* !__ASSEMBLER__ */
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 4b668bc683c4..9823880ceaa0 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -104,6 +104,28 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+/*
+ * Initialize thread_info.user_pt_regs for IDT event delivery.
+ *
+ * For IDT user level event delivery, a pt_regs structure is pushed by both
+ * hardware and software and always resides at a fixed offset from top of
+ * current task kernel stack, thus thread_info.user_pt_regs is a per-task
+ * constant and NEVER changes after initialization.
+ *
+ * While for FRED user level event delivery, user_pt_regs is updated in
+ * fred_entry_from_user() immediately after user level event delivery.
+ *
+ * Note: thread_info.user_pt_regs of the init task is initialized at build
+ * time.
+ */
+void arch_init_user_pt_regs(struct task_struct *tsk)
+{
+	unsigned long top_of_stack = (unsigned long)task_stack_page(tsk) + THREAD_SIZE;
+
+	top_of_stack -= TOP_OF_KERNEL_STACK_PADDING;
+	tsk->thread_info.user_pt_regs = (struct pt_regs *)top_of_stack - 1;
+}
+
 #ifdef CONFIG_X86_64
 void arch_release_task_struct(struct task_struct *tsk)
 {
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index dd925d84fa46..f95d38ed04d7 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -225,6 +225,7 @@ void arch_task_cache_init(void); /* for CONFIG_SH */
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst,
 				struct task_struct *src);
+void arch_init_user_pt_regs(struct task_struct *tsk);
 
 #endif	/* __KERNEL__ */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 1f5d8083eeb2..5b806e74f766 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1110,6 +1110,10 @@ int __weak arch_dup_task_struct(struct task_struct *dst,
 	return 0;
 }
 
+void __weak arch_init_user_pt_regs(struct task_struct *tsk)
+{
+}
+
 void set_task_stack_end_magic(struct task_struct *tsk)
 {
 	unsigned long *stackend;
@@ -1137,6 +1141,8 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	if (err)
 		goto free_tsk;
 
+	arch_init_user_pt_regs(tsk);
+
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	refcount_set(&tsk->stack_refcount, 1);
 #endif
-- 
2.49.0

