Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D91219312
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233116; cv=none; b=t6YSdZXHLZ5t4QpKrQdsfzme7z4e9h8yzYPygbf0DlVwKpjDipQpscQxU/U4Cs4Y/VkiciLhHQ6byf+CAUk2p+11zYwPpfO+D1BY96k88EsJoPl12TFyVih7ahRYT1Xk8t3c0fsrk+IlVXQvnAAAVMoDRNyNHBwcByRFHEhPm74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233116; c=relaxed/simple;
	bh=mAxo/zY5+9TlvBWUkZPn3jnHud65Iaij3MTL0+7tdVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EB6zBOQ/4g7+HVshAHWnOEx63W7ht1BR6DgPoTUl0SORjh+M/pncpEt8wmX2GYn2A8MsbturT0wuUgR+mGm7lawD61QM79VoN8HzplS/j2RsaDrGmhM1vBoU32DeUl5kYhf9VDik7vz2MLVO6surSvP9hqpxLG71pA+Re7Gm6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMqsDVd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMqsDVd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42607C4CEE2;
	Wed,  9 Apr 2025 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233115;
	bh=mAxo/zY5+9TlvBWUkZPn3jnHud65Iaij3MTL0+7tdVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMqsDVd8Na/c/R2uoTk89VcUlyaE4cbo/DpS76fwE/C0je+BJYnNnX21p0VWAKWQO
	 u5kcoxK7a9P3hy3b/YQysmftZDSkNYl+Ogux/kfiCXFAzzNk98y8Ame6h7umnVkaUM
	 wC8fQMPOq8D/FyGWKEmwmF4iDanrVgjRqIy5bH3W0CsoZPqaYl5FNYPeBxK40WiUMW
	 QbQdfeqL8OYcKuzEOI6sClTFxkqNBuBaT2mAkO5/4w6orIVpJ0xcEJwZd34cGeGXAc
	 99mOJ3XTy2X5BgATUHKkrfLcD4pMRNkpMN26NOo3MVX4tsTU7s1oq6IrrdxbrxJGuJ
	 4moCnAWTDITlw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 5/8] x86/fpu: Push 'fpu' pointer calculation into the fpu__drop() call
Date: Wed,  9 Apr 2025 23:11:24 +0200
Message-ID: <20250409211127.3544993-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This encapsulates the fpu__drop() functionality better, and it
will also enable other changes that want to check a task for
PF_KTHREAD before calling x86_task_fpu().

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/fpu/sched.h | 2 +-
 arch/x86/kernel/fpu/core.c       | 4 +++-
 arch/x86/kernel/process.c        | 3 +--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sched.h
index 1feaa68b7567..5fd12634bcc4 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -10,7 +10,7 @@
 #include <asm/trace/fpu.h>
 
 extern void save_fpregs_to_fpstate(struct fpu *fpu);
-extern void fpu__drop(struct fpu *fpu);
+extern void fpu__drop(struct task_struct *tsk);
 extern int  fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 		      unsigned long shstk_addr);
 extern void fpu_flush_thread(void);
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 974b276ff0da..e4c20908ee49 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -681,8 +681,10 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
  * a state-restore is coming: either an explicit one,
  * or a reschedule.
  */
-void fpu__drop(struct fpu *fpu)
+void fpu__drop(struct task_struct *tsk)
 {
+	struct fpu *fpu = x86_task_fpu(tsk);
+
 	preempt_disable();
 
 	if (fpu == x86_task_fpu(current)) {
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 88868a90459e..5fb502c97b08 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -120,7 +120,6 @@ void arch_release_task_struct(struct task_struct *tsk)
 void exit_thread(struct task_struct *tsk)
 {
 	struct thread_struct *t = &tsk->thread;
-	struct fpu *fpu = x86_task_fpu(tsk);
 
 	if (test_thread_flag(TIF_IO_BITMAP))
 		io_bitmap_exit(tsk);
@@ -128,7 +127,7 @@ void exit_thread(struct task_struct *tsk)
 	free_vm86(t);
 
 	shstk_free(tsk);
-	fpu__drop(fpu);
+	fpu__drop(tsk);
 }
 
 static int set_new_tls(struct task_struct *p, unsigned long tls)
-- 
2.45.2

