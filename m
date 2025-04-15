Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11970250C08
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708786; cv=none; b=CSjHGfsvCjNKPi2NqgfAQDpMhpzYDdVfENV9/Rg2Q3Y+Pqh/vOE91xSj7gSRSBS5bD+QqvnTJ4dtOkfIbsKwckzoFVt0hnwXzXAOW/UBnqLuKBEvHydb4ncYKy1fGC+7+ygsnobxOulNCbRM0/+GfQ3GcMyiEk48yb1j9hA+64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708786; c=relaxed/simple;
	bh=LUmlEpZ4Ez9LtPfiPkGnfU5PRDp3fu5I4ZGM8vvkSnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFH9ZSWA1u/zeQXm08krFLWplh+SvN3iYVf4xBwfwPaymywiFw+xxvtmOrKVZGxXYbb2Z8z6zfjuE224u3dU47JjKouRLJLWWfN1G3wLWVFw994kjfS+2ZJgWyNIbp50fxqWts/4ljyMxZyuKtqOsRfs4zsLZszz/gfeG/3drKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxIK+sJP5n38u9AA--.50120S3;
	Tue, 15 Apr 2025 17:19:40 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx7xukJP5nHMyCAA--.57263S2;
	Tue, 15 Apr 2025 17:19:34 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
Date: Tue, 15 Apr 2025 17:19:30 +0800
Message-ID: <20250415091930.19529-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7xukJP5nHMyCAA--.57263S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3JF4rtw48CFy3JFW3Wr4fXrc_yoW3Zr47pr
	nrArn5Cw48GFnav34DJ34jvFZ8Xas5Ga1S93Zrt34fCr1jkr9rurn7Ga1DZFy8Ka48Ar1F
	9r4avF1Sy3WUC3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UUUUU==

Like the other relevant symbols, export some fp, lsx, lasx and lbt
assembly symbols and put the function declarations in header files
rather than source files.

While at it, use "asmlinkage" for the other existing C prototypes
of assembly functions and also do not use the "extern" keyword with
function declarations according to the document coding-style.rst.

Cc: stable@vger.kernel.org # 6.6+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/fpu.h | 38 ++++++++++++++++++--------------
 arch/loongarch/include/asm/lbt.h | 10 ++++++---
 arch/loongarch/kernel/fpu.S      |  6 +++++
 arch/loongarch/kernel/lbt.S      |  4 ++++
 arch/loongarch/kernel/signal.c   | 21 ------------------
 5 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index 3177674228f8..23f5a4b9c32d 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -22,22 +22,28 @@
 struct sigcontext;
 
 #define kernel_fpu_available() cpu_has_fpu
-extern void kernel_fpu_begin(void);
-extern void kernel_fpu_end(void);
-
-extern void _init_fpu(unsigned int);
-extern void _save_fp(struct loongarch_fpu *);
-extern void _restore_fp(struct loongarch_fpu *);
-
-extern void _save_lsx(struct loongarch_fpu *fpu);
-extern void _restore_lsx(struct loongarch_fpu *fpu);
-extern void _init_lsx_upper(void);
-extern void _restore_lsx_upper(struct loongarch_fpu *fpu);
-
-extern void _save_lasx(struct loongarch_fpu *fpu);
-extern void _restore_lasx(struct loongarch_fpu *fpu);
-extern void _init_lasx_upper(void);
-extern void _restore_lasx_upper(struct loongarch_fpu *fpu);
+void kernel_fpu_begin(void);
+void kernel_fpu_end(void);
+
+asmlinkage void _init_fpu(unsigned int);
+asmlinkage void _save_fp(struct loongarch_fpu *);
+asmlinkage void _restore_fp(struct loongarch_fpu *);
+asmlinkage int _save_fp_context(void __user *fpregs, void __user *fcc, void __user *csr);
+asmlinkage int _restore_fp_context(void __user *fpregs, void __user *fcc, void __user *csr);
+
+asmlinkage void _save_lsx(struct loongarch_fpu *fpu);
+asmlinkage void _restore_lsx(struct loongarch_fpu *fpu);
+asmlinkage void _init_lsx_upper(void);
+asmlinkage void _restore_lsx_upper(struct loongarch_fpu *fpu);
+asmlinkage int _save_lsx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
+asmlinkage int _restore_lsx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
+
+asmlinkage void _save_lasx(struct loongarch_fpu *fpu);
+asmlinkage void _restore_lasx(struct loongarch_fpu *fpu);
+asmlinkage void _init_lasx_upper(void);
+asmlinkage void _restore_lasx_upper(struct loongarch_fpu *fpu);
+asmlinkage int _save_lasx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
+asmlinkage int _restore_lasx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
 
 static inline void enable_lsx(void);
 static inline void disable_lsx(void);
diff --git a/arch/loongarch/include/asm/lbt.h b/arch/loongarch/include/asm/lbt.h
index e671978bf552..38566574e562 100644
--- a/arch/loongarch/include/asm/lbt.h
+++ b/arch/loongarch/include/asm/lbt.h
@@ -12,9 +12,13 @@
 #include <asm/loongarch.h>
 #include <asm/processor.h>
 
-extern void _init_lbt(void);
-extern void _save_lbt(struct loongarch_lbt *);
-extern void _restore_lbt(struct loongarch_lbt *);
+asmlinkage void _init_lbt(void);
+asmlinkage void _save_lbt(struct loongarch_lbt *);
+asmlinkage void _restore_lbt(struct loongarch_lbt *);
+asmlinkage int _save_lbt_context(void __user *regs, void __user *eflags);
+asmlinkage int _restore_lbt_context(void __user *regs, void __user *eflags);
+asmlinkage int _save_ftop_context(void __user *ftop);
+asmlinkage int _restore_ftop_context(void __user *ftop);
 
 static inline int is_lbt_enabled(void)
 {
diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index 6ab640101457..28caf416ae36 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -458,6 +458,7 @@ SYM_FUNC_START(_save_fp_context)
 	li.w		a0, 0				# success
 	jr		ra
 SYM_FUNC_END(_save_fp_context)
+EXPORT_SYMBOL_GPL(_save_fp_context)
 
 /*
  * a0: fpregs
@@ -471,6 +472,7 @@ SYM_FUNC_START(_restore_fp_context)
 	li.w		a0, 0				# success
 	jr		ra
 SYM_FUNC_END(_restore_fp_context)
+EXPORT_SYMBOL_GPL(_restore_fp_context)
 
 /*
  * a0: fpregs
@@ -484,6 +486,7 @@ SYM_FUNC_START(_save_lsx_context)
 	li.w	a0, 0					# success
 	jr	ra
 SYM_FUNC_END(_save_lsx_context)
+EXPORT_SYMBOL_GPL(_save_lsx_context)
 
 /*
  * a0: fpregs
@@ -497,6 +500,7 @@ SYM_FUNC_START(_restore_lsx_context)
 	li.w	a0, 0					# success
 	jr	ra
 SYM_FUNC_END(_restore_lsx_context)
+EXPORT_SYMBOL_GPL(_restore_lsx_context)
 
 /*
  * a0: fpregs
@@ -510,6 +514,7 @@ SYM_FUNC_START(_save_lasx_context)
 	li.w	a0, 0					# success
 	jr	ra
 SYM_FUNC_END(_save_lasx_context)
+EXPORT_SYMBOL_GPL(_save_lasx_context)
 
 /*
  * a0: fpregs
@@ -523,6 +528,7 @@ SYM_FUNC_START(_restore_lasx_context)
 	li.w	a0, 0					# success
 	jr	ra
 SYM_FUNC_END(_restore_lasx_context)
+EXPORT_SYMBOL_GPL(_restore_lasx_context)
 
 .L_fpu_fault:
 	li.w	a0, -EFAULT				# failure
diff --git a/arch/loongarch/kernel/lbt.S b/arch/loongarch/kernel/lbt.S
index 001f061d226a..71678912d24c 100644
--- a/arch/loongarch/kernel/lbt.S
+++ b/arch/loongarch/kernel/lbt.S
@@ -90,6 +90,7 @@ SYM_FUNC_START(_save_lbt_context)
 	li.w		a0, 0			# success
 	jr		ra
 SYM_FUNC_END(_save_lbt_context)
+EXPORT_SYMBOL_GPL(_save_lbt_context)
 
 /*
  * a0: scr
@@ -110,6 +111,7 @@ SYM_FUNC_START(_restore_lbt_context)
 	li.w		a0, 0			# success
 	jr		ra
 SYM_FUNC_END(_restore_lbt_context)
+EXPORT_SYMBOL_GPL(_restore_lbt_context)
 
 /*
  * a0: ftop
@@ -120,6 +122,7 @@ SYM_FUNC_START(_save_ftop_context)
 	li.w		a0, 0			# success
 	jr		ra
 SYM_FUNC_END(_save_ftop_context)
+EXPORT_SYMBOL_GPL(_save_ftop_context)
 
 /*
  * a0: ftop
@@ -150,6 +153,7 @@ SYM_FUNC_START(_restore_ftop_context)
 	li.w		a0, 0			# success
 	jr		ra
 SYM_FUNC_END(_restore_ftop_context)
+EXPORT_SYMBOL_GPL(_restore_ftop_context)
 
 .L_lbt_fault:
 	li.w		a0, -EFAULT		# failure
diff --git a/arch/loongarch/kernel/signal.c b/arch/loongarch/kernel/signal.c
index 7a555b600171..4740cb5b2388 100644
--- a/arch/loongarch/kernel/signal.c
+++ b/arch/loongarch/kernel/signal.c
@@ -51,27 +51,6 @@
 #define lock_lbt_owner()	({ preempt_disable(); pagefault_disable(); })
 #define unlock_lbt_owner()	({ pagefault_enable(); preempt_enable(); })
 
-/* Assembly functions to move context to/from the FPU */
-extern asmlinkage int
-_save_fp_context(void __user *fpregs, void __user *fcc, void __user *csr);
-extern asmlinkage int
-_restore_fp_context(void __user *fpregs, void __user *fcc, void __user *csr);
-extern asmlinkage int
-_save_lsx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
-extern asmlinkage int
-_restore_lsx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
-extern asmlinkage int
-_save_lasx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
-extern asmlinkage int
-_restore_lasx_context(void __user *fpregs, void __user *fcc, void __user *fcsr);
-
-#ifdef CONFIG_CPU_HAS_LBT
-extern asmlinkage int _save_lbt_context(void __user *regs, void __user *eflags);
-extern asmlinkage int _restore_lbt_context(void __user *regs, void __user *eflags);
-extern asmlinkage int _save_ftop_context(void __user *ftop);
-extern asmlinkage int _restore_ftop_context(void __user *ftop);
-#endif
-
 struct rt_sigframe {
 	struct siginfo rs_info;
 	struct ucontext rs_uctx;
-- 
2.42.0

