Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D771A0BC5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341314; cv=none; b=iwtvzUgSZOC222vOzJ1vZJHbI9bm6s9EPXAKY/vEjX+l6N1EtHalsLkpha0y7smNo/oZ5L0ULfKj12Bq603B5GOwtH37ssIhBRyyAsSAi8KtxHGJ229AqteuIuuPcStmoqHZ1RY0d2O1nVTyO1A7nTgfYdDlF2WrgmM6srOCPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341314; c=relaxed/simple;
	bh=JO2KtBBUzB9kmwalO8oEasZFihssbjQC46p9OUxDhcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agD+wcyNuQnQYNZwIFycSdWf/h1OBUutsRY+5xbQFzBq/KAiyrPIR70ZSSZb0Pymx9/nce3b7VaflwZjfb+wNud30bQYBdyzfyNJJ/S5cgIrEQVtnSimtRuzjGLX1ruWPVM+AALdxEhrFysZSj/HyQQH1udw+txuh8xrdi5/f2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ct1POQ3y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ct1POQ3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745341312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=szHYQ7G5Qg0pCM7SYXZ8+VGj8lOfryQyJTB2Zk1s5kU=;
	b=Ct1POQ3y8GAyuFTw4oNke+cMO2BpOeR1/MR8kTIyqKgDOQPHIQAtikkVqNMJGLOc+0adQu
	Ag49QPbx9WCSQcpyEf6O8oXcF63RwupKDqVOr+tfHcHU/2BemVABDc153TjmbHcJCH1cpX
	OmrvA5HpduElcnHvzLHpqbF5i01FaOs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-ItTHBgBYM0-VyaQqx1ZLAQ-1; Tue,
 22 Apr 2025 13:01:47 -0400
X-MC-Unique: ItTHBgBYM0-VyaQqx1ZLAQ-1
X-Mimecast-MFC-AGG-ID: ItTHBgBYM0-VyaQqx1ZLAQ_1745341305
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBA7919560A5;
	Tue, 22 Apr 2025 17:01:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id F40E2195608D;
	Tue, 22 Apr 2025 17:01:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 22 Apr 2025 19:01:06 +0200 (CEST)
Date: Tue, 22 Apr 2025 19:01:00 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: question about switch_fpu_prepare/switch_fpu_finish
Message-ID: <20250422170059.GB1676@redhat.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

I must have missed something, but I can't understand this logic, it
seems unnecessarily complicated today.

1. Now that switch_fpu_finish() doesn't load the FPU state, I think it
   can be folded into switch_fpu_prepare().

2. But the main question is that I fail to understand why
   __switch_to() -> switch_fpu_finish() uses the "next" task to set
   TIF_NEED_FPU_LOAD.

   I think that set_tsk_thread_flag(prev_p, TIF_NEED_FPU_LOAD) makes
   more sense.

   Just in case, note that fpu_clone() sets TIF_NEED_FPU_LOAD, so
   we should not worry about the 1st __switch_to(next_p).

IOW, can you explain why the (untested) patch below could be wrong?

We can even remove the PF_KTHREAD check in switch_fpu_prepare(), kthreads
should never clear TIF_NEED_FPU_LOAD...

Oleg.
---

diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sched.h
index 5fd12634bcc4..cdd60f434289 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -54,18 +54,10 @@ static inline void switch_fpu_prepare(struct task_struct *old, int cpu)
 		 */
 		old_fpu->last_cpu = cpu;
 
+		set_tsk_thread_flag(old, TIF_NEED_FPU_LOAD);
+
 		trace_x86_fpu_regs_deactivated(old_fpu);
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
index 4636ef359973..b398a6ef2923 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -208,8 +208,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 
 	raw_cpu_write(current_task, next_p);
 
-	switch_fpu_finish(next_p);
-
 	/* Load the Intel cache allocation PQR MSR. */
 	resctrl_sched_in(next_p);
 
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 7196ca7048be..e8262e637ea4 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -671,8 +671,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	raw_cpu_write(current_task, next_p);
 	raw_cpu_write(cpu_current_top_of_stack, task_top_of_stack(next_p));
 
-	switch_fpu_finish(next_p);
-
 	/* Reload sp0. */
 	update_task_stack(next_p);
 

