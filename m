Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C3277028
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320047; cv=none; b=NR+xdDXXhyREJIV76CzSakgb0Ojt1mBOlp2MUHu/zz1iA91jJdKyGuFyTemSkhDiKrIuatNK9mXLnLuogkH9T/9q3zAF/pYYwRODhIv55NB6aOvdZHU6vdi2gtUs+lbwATWeGiUsg6YZxi6gSE8leGFgfCezJ+t/LHJEATN26Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320047; c=relaxed/simple;
	bh=qRcTpfruip6kHRva7+FyKLAHcFuHUWIZNcTKgEO1qv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuyR6qZwVySN/4Q2CwlVAMDH5RkrJZRtw2Ey5YHYoNTHbdDjc+flTDbkceMGjE2oBmO0yQayLWK6iVyZiuiK05MIp7rf6B9tfw4uPjSPLUieinw5yknn5VHUpQatqFJcx30u37+QCCIqRisa1846cghe6zaI0iwU0iL4yrB6ElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxLGtqeAdoAfzDAA--.62192S3;
	Tue, 22 Apr 2025 19:07:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxbsVneAdoe9yPAA--.33268S4;
	Tue, 22 Apr 2025 19:07:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] LoongArch: Make do_xyz() handlers more robust
Date: Tue, 22 Apr 2025 19:07:19 +0800
Message-ID: <20250422110719.15673-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250422110719.15673-1-yangtiezhu@loongson.cn>
References: <20250422110719.15673-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVneAdoe9yPAA--.33268S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAw4kKryrtF1kZrykXFy8tFc_yoWrtry7pa
	y7Ca13KrWkWF1kZa9rJa4IyF17JrZav3yxCw4UCa4fWFsxC3sYgrn7K3W7ZFyjyrZ5AF1x
	ZFyjyw1FvFn8CFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SksDUUUUU==

Currently, interrupts need to be disabled before single-step mode is set,
it requires that the CSR_PRMD_PIE must be cleared in save_local_irqflag()
which is called by setup_singlestep(), this is reasonable.

But in the first kprobe breakpoint exception, if the irq is enabled at the
beginning of do_bp(), it will not be disabled at the end of do_bp() due to
the CSR_PRMD_PIE has been cleared in save_local_irqflag(). For this case,
it may corrupt exception context when restoring exception after do_bp() in
handle_bp(), this is not reasonable.

In order to restore exception safely in handle_bp(), it needs to make sure
the irq is disabled at the end of do_bp(), so just add a local variable to
record the original interrupt status in the parent context, then use it as
check condition to enable and disable irq in do_bp().

While at it, do the similar thing for the other do_xyz() handlers to make
them more robust.

Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Suggested-by: Jinyang He <hejinyang@loongson.cn>
Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
Co-developed-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/traps.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 2ec3106c0da3..7de38d34efc6 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -547,6 +547,7 @@ int no_unaligned_warning __read_mostly = 1;	/* Only 1 warning by default */
 
 asmlinkage void noinstr do_ale(struct pt_regs *regs)
 {
+	bool pie = regs_irqs_disabled(regs);
 	irqentry_state_t state = irqentry_enter(regs);
 
 #ifndef CONFIG_ARCH_STRICT_ALIGN
@@ -555,7 +556,7 @@ asmlinkage void noinstr do_ale(struct pt_regs *regs)
 #else
 	unsigned int *pc;
 
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_enable();
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, regs->csr_badvaddr);
@@ -582,7 +583,7 @@ asmlinkage void noinstr do_ale(struct pt_regs *regs)
 	die_if_kernel("Kernel ale access", regs);
 	force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *)regs->csr_badvaddr);
 out:
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_disable();
 #endif
 	irqentry_exit(regs, state);
@@ -621,12 +622,13 @@ static void bug_handler(struct pt_regs *regs)
 asmlinkage void noinstr do_bce(struct pt_regs *regs)
 {
 	bool user = user_mode(regs);
+	bool pie = regs_irqs_disabled(regs);
 	unsigned long era = exception_era(regs);
 	u64 badv = 0, lower = 0, upper = ULONG_MAX;
 	union loongarch_instruction insn;
 	irqentry_state_t state = irqentry_enter(regs);
 
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_enable();
 
 	current->thread.trap_nr = read_csr_excode();
@@ -692,7 +694,7 @@ asmlinkage void noinstr do_bce(struct pt_regs *regs)
 	force_sig_bnderr((void __user *)badv, (void __user *)lower, (void __user *)upper);
 
 out:
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_disable();
 
 	irqentry_exit(regs, state);
@@ -710,11 +712,12 @@ asmlinkage void noinstr do_bce(struct pt_regs *regs)
 asmlinkage void noinstr do_bp(struct pt_regs *regs)
 {
 	bool user = user_mode(regs);
+	bool pie = regs_irqs_disabled(regs);
 	unsigned int opcode, bcode;
 	unsigned long era = exception_era(regs);
 	irqentry_state_t state = irqentry_enter(regs);
 
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_enable();
 
 	if (__get_inst(&opcode, (u32 *)era, user))
@@ -780,7 +783,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 	}
 
 out:
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_disable();
 
 	irqentry_exit(regs, state);
@@ -1015,6 +1018,7 @@ static void init_restore_lbt(void)
 
 asmlinkage void noinstr do_lbt(struct pt_regs *regs)
 {
+	bool pie = regs_irqs_disabled(regs);
 	irqentry_state_t state = irqentry_enter(regs);
 
 	/*
@@ -1024,7 +1028,7 @@ asmlinkage void noinstr do_lbt(struct pt_regs *regs)
 	 * (including the user using 'MOVGR2GCSR' to turn on TM, which
 	 * will not trigger the BTE), we need to check PRMD first.
 	 */
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_enable();
 
 	if (!cpu_has_lbt) {
@@ -1038,7 +1042,7 @@ asmlinkage void noinstr do_lbt(struct pt_regs *regs)
 	preempt_enable();
 
 out:
-	if (regs->csr_prmd & CSR_PRMD_PIE)
+	if (!pie)
 		local_irq_disable();
 
 	irqentry_exit(regs, state);
-- 
2.42.0

