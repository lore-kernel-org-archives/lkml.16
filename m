Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA25219312
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233113; cv=none; b=MhNTKy1FfuRs6p90n9nOLFenegjBp2s0cTph4mGQUHyWr+akyCYHQRjeGcCfhVjj+fnVfigycFA4gOeiEM4AEYvc9Tl0sMGm+44acWMsp2NcCkY+fI9fl0lNiZK3IG73bDacMb6QG2cIAXHAMs9dEODfcwgMbMk8oML0wpRMSXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233113; c=relaxed/simple;
	bh=gIsSH7NLDAYfvrqsitKKMX80cNwtsfaHUeTr2OobYTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4JSzsG4hK/5llzxAFUFIU+FAs8SpJfCUfQtlxxdBpTBpI+Lyw3bbphBzCvLIJTMX+bwsmoSmzp8JA53e5tQwT0in4ramQnQYbo2qGiiu0d1aypxDamOYq5Lr/kp+jV3jhYVKzysfcw3jfbwQYBYa7H1AMW4CzTQcSSNYFVlKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjhWI0ad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjhWI0ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F538C4CEE2;
	Wed,  9 Apr 2025 21:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233112;
	bh=gIsSH7NLDAYfvrqsitKKMX80cNwtsfaHUeTr2OobYTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjhWI0adDOMsF+5uu3DN2H6nDT0foDq7caTYZCamXxDs/Xm7Slz8dQL/JXL/J0Dsy
	 QX1WHRWFCFONJmL28FEmCJP1azG/nxZsdxveSb+NCxhYSIr0R9LQCV4aUkDSb1mNA0
	 pFQbdJWonjP3bGouCsoFXMwhAYDHAcAI/SbCBBA2MoJaJRayN8Xfv3JQF7HdOLYm6n
	 tnoVjT5/1C46b7dEThRe4fbSH8Xa+3+emZMLaEW3fMov8E/46WdbCJn1GRVO6fKeXS
	 0oJcHpjTBFI810nhlCjZV6Jvp2lijrlkqSczIDr2DLQK9arQqX78aPOlQp+KqC9aNt
	 ZHx0aQxRiS5Bg==
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
	Ingo Molnar <mingo@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Date: Wed,  9 Apr 2025 23:11:23 +0200
Message-ID: <20250409211127.3544993-5-mingo@kernel.org>
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

As suggested by Oleg, remove the thread::fpu pointer, as we can
calculate it via x86_task_fpu() at compile-time.

This improves code generation a bit:

   kepler:~/tip> size vmlinux.before vmlinux.after
   text        data        bss        dec         hex        filename
   26475405    10435342    1740804    38651551    24dc69f    vmlinux.before
   26475339    10959630    1216516    38651485    24dc65d    vmlinux.after

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
Link: https://lore.kernel.org/r/20240605083557.2051480-3-mingo@kernel.org
---
 arch/x86/include/asm/processor.h | 5 +----
 arch/x86/kernel/fpu/core.c       | 4 +---
 arch/x86/kernel/fpu/init.c       | 1 -
 arch/x86/kernel/process.c        | 2 --
 arch/x86/kernel/vmlinux.lds.S    | 4 ++++
 5 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 5ea7e5d2c4de..b7f7c9c83409 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -514,12 +514,9 @@ struct thread_struct {
 
 	struct thread_shstk	shstk;
 #endif
-
-	/* Floating point and extended processor state */
-	struct fpu		*fpu;
 };
 
-#define x86_task_fpu(task) ((task)->thread.fpu)
+#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
 
 /*
  * X86 doesn't need any embedded-FPU-struct quirks:
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 853a738fdf2d..974b276ff0da 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -600,13 +600,11 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	 * This is safe because task_struct size is a multiple of cacheline size.
 	 */
 	struct fpu *src_fpu = x86_task_fpu(current);
-	struct fpu *dst_fpu = (void *)dst + sizeof(*dst);
+	struct fpu *dst_fpu = x86_task_fpu(dst);
 
 	BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);
 	BUG_ON(!src_fpu);
 
-	dst->thread.fpu = dst_fpu;
-
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
 
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 848ea79886ba..da41a1d2c40f 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -76,7 +76,6 @@ static struct fpu x86_init_fpu __attribute__ ((aligned (64))) __read_mostly;
 static void __init fpu__init_system_early_generic(void)
 {
 	fpstate_reset(&x86_init_fpu);
-	current->thread.fpu = &x86_init_fpu;
 	set_thread_flag(TIF_NEED_FPU_LOAD);
 	x86_init_fpu.last_cpu = -1;
 
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 3ce4cce46f3f..88868a90459e 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -102,8 +102,6 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 #ifdef CONFIG_VM86
 	dst->thread.vm86 = NULL;
 #endif
-	/* Drop the copied pointer to current's fpstate */
-	dst->thread.fpu = NULL;
 
 	return 0;
 }
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index ccdc45e5b759..d9ca2d1754da 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -181,6 +181,10 @@ SECTIONS
 		/* equivalent to task_pt_regs(&init_task) */
 		__top_init_kernel_stack = __end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE;
 
+		__x86_init_fpu_begin = .;
+		. = __x86_init_fpu_begin + 128*PAGE_SIZE;
+		__x86_init_fpu_end = .;
+
 #ifdef CONFIG_X86_32
 		/* 32 bit has nosave before _edata */
 		NOSAVE_DATA
-- 
2.45.2

