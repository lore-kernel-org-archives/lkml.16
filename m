Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832C367
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283167; cv=none; b=bFU2NNNREou921kkSj8JASd778FAaPjQgnvLi4APfBZkmd54qL/cQfnifDUsEmPOrCGRGwt71MFf7YS3ZSrSmWak2AqL4tAm4Kbim4iPAcUYWY53yHRsnq7TTuJPCRHvIQ/8GYD6AimjZpDV4KVa5+18cSRqBBr/1SygYWQBRJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283167; c=relaxed/simple;
	bh=rn7+o4EPtcG0oJ6Fi2Yb4BaDa4A0wgw01u7a4616hkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YFpQ1BNiPY1Yo5Pz2jKLcQJB4Skcs/YKWg3P1o5j7ebO/z19wkzm+ADDiGa0ECxY86fYOS4MQ9Tq7HLPufHlDUJn/djrVGxXvAlCarPAJKzXHYp2rvtW8jWnDbhQRh+PTEMvzjViGcLj45rMd43LLTyLmvz+DnG66BIgDhYth6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GodSzr3k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GodSzr3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=BH81id2CJI4866z+gecRvcwrouD/J6fuMh6H8yNd8d4=;
	b=GodSzr3kAD7BYPRoYUC31MignLSP909TsEW2Y5VKhAt2QUd7IVgpg42J5+s4q3A/5HgLJA
	CIq1Q4rhia0HnL6x0VjuLtqPz5gWA8//CpHngiApN4NIcuQRlABBPaj3/eKMOnoZ9Kv8LQ
	Hw+DHedpVi1qacNqPQ+T0ghDVls05C8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-ZtCzUT75PpS_CNbRNwHy4Q-1; Sat,
 03 May 2025 10:39:19 -0400
X-MC-Unique: ZtCzUT75PpS_CNbRNwHy4Q-1
X-Mimecast-MFC-AGG-ID: ZtCzUT75PpS_CNbRNwHy4Q_1746283157
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2E061800264;
	Sat,  3 May 2025 14:39:16 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CDD0D30001A2;
	Sat,  3 May 2025 14:39:11 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 May 2025 16:38:36 +0200 (CEST)
Date: Sat, 3 May 2025 16:38:30 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: [PATCH tip/x86/fpu 1/6] x86/fpu: simplify the switch_fpu_prepare() +
 switch_fpu_finish() logic
Message-ID: <20250503143830.GA8982@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Now that switch_fpu_finish() doesn't load the FPU state, it makes more
sense to fold it into switch_fpu_prepare() renamed to switch_fpu(), and
more importantly, use the "prev_p" task as a target for TIF_NEED_FPU_LOAD.
It doesn't make any sense to delay set_tsk_thread_flag(TIF_NEED_FPU_LOAD)
until "prev_p" is scheduled again.

There is no worry about the very first context switch, fpu_clone() must
always set TIF_NEED_FPU_LOAD.

Also, shift the test_tsk_thread_flag(TIF_NEED_FPU_LOAD) from the callers
to switch_fpu().

Note that the "PF_KTHREAD | PF_USER_WORKER" check can be removed but
this deserves a separate patch which can change more functions, say,
kernel_fpu_begin_mask().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/x86/include/asm/fpu/sched.h | 34 +++++++++-----------------------
 arch/x86/kernel/process_32.c     |  5 +----
 arch/x86/kernel/process_64.c     |  5 +----
 3 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sched.h
index 5fd12634bcc4..c060549c6c94 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -18,31 +18,25 @@ extern void fpu_flush_thread(void);
 /*
  * FPU state switching for scheduling.
  *
- * This is a two-stage process:
+ * switch_fpu() saves the old state and sets TIF_NEED_FPU_LOAD if
+ * TIF_NEED_FPU_LOAD is not set.  This is done within the context
+ * of the old process.
  *
- *  - switch_fpu_prepare() saves the old state.
- *    This is done within the context of the old process.
- *
- *  - switch_fpu_finish() sets TIF_NEED_FPU_LOAD; the floating point state
- *    will get loaded on return to userspace, or when the kernel needs it.
- *
- * If TIF_NEED_FPU_LOAD is cleared then the CPU's FPU registers
- * are saved in the current thread's FPU register state.
- *
- * If TIF_NEED_FPU_LOAD is set then CPU's FPU registers may not
- * hold current()'s FPU registers. It is required to load the
+ * Once TIF_NEED_FPU_LOAD is set, it is required to load the
  * registers before returning to userland or using the content
  * otherwise.
  *
  * The FPU context is only stored/restored for a user task and
  * PF_KTHREAD is used to distinguish between kernel and user threads.
  */
-static inline void switch_fpu_prepare(struct task_struct *old, int cpu)
+static inline void switch_fpu(struct task_struct *old, int cpu)
 {
-	if (cpu_feature_enabled(X86_FEATURE_FPU) &&
+	if (!test_tsk_thread_flag(old, TIF_NEED_FPU_LOAD) &&
+	    cpu_feature_enabled(X86_FEATURE_FPU) &&
 	    !(old->flags & (PF_KTHREAD | PF_USER_WORKER))) {
 		struct fpu *old_fpu = x86_task_fpu(old);
 
+		set_tsk_thread_flag(old, TIF_NEED_FPU_LOAD);
 		save_fpregs_to_fpstate(old_fpu);
 		/*
 		 * The save operation preserved register state, so the
@@ -50,7 +44,7 @@ static inline void switch_fpu_prepare(struct task_struct *old, int cpu)
 		 * current CPU number in @old_fpu, so the next return
 		 * to user space can avoid the FPU register restore
 		 * when is returns on the same CPU and still owns the
-		 * context.
+		 * context. See fpregs_restore_userregs().
 		 */
 		old_fpu->last_cpu = cpu;
 
@@ -58,14 +52,4 @@ static inline void switch_fpu_prepare(struct task_struct *old, int cpu)
 	}
 }
 
-/*
- * Delay loading of the complete FPU state until the return to userland.
- * PKRU is handled separately.
- */
-static inline void switch_fpu_finish(struct task_struct *new)
-{
-	if (cpu_feature_enabled(X86_FEATURE_FPU))
-		set_tsk_thread_flag(new, TIF_NEED_FPU_LOAD);
-}
-
 #endif /* _ASM_X86_FPU_SCHED_H */
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 4636ef359973..9bd4fa694da5 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -160,8 +160,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 
 	/* never put a printk in __switch_to... printk() calls wake_up*() indirectly */
 
-	if (!test_tsk_thread_flag(prev_p, TIF_NEED_FPU_LOAD))
-		switch_fpu_prepare(prev_p, cpu);
+	switch_fpu(prev_p, cpu);
 
 	/*
 	 * Save away %gs. No need to save %fs, as it was saved on the
@@ -208,8 +207,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 
 	raw_cpu_write(current_task, next_p);
 
-	switch_fpu_finish(next_p);
-
 	/* Load the Intel cache allocation PQR MSR. */
 	resctrl_sched_in(next_p);
 
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 7196ca7048be..d55310d3133c 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -616,8 +616,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ENTRY) &&
 		     this_cpu_read(hardirq_stack_inuse));
 
-	if (!test_tsk_thread_flag(prev_p, TIF_NEED_FPU_LOAD))
-		switch_fpu_prepare(prev_p, cpu);
+	switch_fpu(prev_p, cpu);
 
 	/* We must save %fs and %gs before load_TLS() because
 	 * %fs and %gs may be cleared by load_TLS().
@@ -671,8 +670,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	raw_cpu_write(current_task, next_p);
 	raw_cpu_write(cpu_current_top_of_stack, task_top_of_stack(next_p));
 
-	switch_fpu_finish(next_p);
-
 	/* Reload sp0. */
 	update_task_stack(next_p);
 
-- 
2.25.1.362.g51ebf55

