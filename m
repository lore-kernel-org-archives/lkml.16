Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45F1264F90
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104490; cv=none; b=TMknX3Q3+PmaATDIe3ex31Cv5ECt9o8ZeU5NVKHbtBTZ7ij83KUaSna0PLu8qiyg6jROrAVFQKGmYh3HrAkMGiCKTR0+sPkr/yGsdNB+wDhYB5Y4t0IdLfi4pNwbsQjy6r0eAkvb3zNz2fg/3gh25xKu51XSUH6E7zVXsCV3tlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104490; c=relaxed/simple;
	bh=eyqOzFeAfWPRcomofF0iPt9yEMcU5b0bxRDqwp3CnvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIwcXu7aSX/jDpg+1x4WuDBM+x0rkGm1jMwSJbc6Rr/rSGXxPnez7Z5Vn37tm2IYgFkiixBgGZ0GKh1o3Fa7ctoLFpGtJznE4jm4e2smBVldwXJ1+TaLwm7mZSqeAjhZ7YWjful7sLkTeN28RxLTPf/8nkd2tawNF1/vNnsMEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx364f7PRnRRC1AA--.21063S3;
	Tue, 08 Apr 2025 17:27:59 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxLscd7PRnF350AA--.24496S2;
	Tue, 08 Apr 2025 17:27:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Enhance robust of kprobe
Date: Tue,  8 Apr 2025 17:27:56 +0800
Message-ID: <20250408092756.22339-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLscd7PRnF350AA--.24496S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1kKFyfJw1DGFW7XFy5trc_yoW8WryfpF
	47Cas5tr4kW3W0va4qv34xur10yFWDCrWxWw4UA345Kws8uwn0vr1xG3WDXF95W3yFqr1S
	vF1rKrWIqF1DCFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUUUUUU=

Currently, interrupts need to be disabled before single-step mode is set,
it requires that the CSR_PRMD_PIE must be cleared in save_local_irqflag()
which is called by setup_singlestep(), this is reasonable.

But in the first kprobe breakpoint exception, if the irq is enabled at the
beginning of do_bp(), it will not be disabled at the end of do_bp() due to
the CSR_PRMD_PIE has been cleared in save_local_irqflag(). For this case,
it may corrupt exception context when restoring exception after do_bp() in
handle_bp(), this is not reasonable.

Based on the above analysis, in order to make sure the irq is disabled at
the end of do_bp() for the first kprobe breakpoint exception, it is proper
to disable irq first before clearing CSR_PRMD_PIE in save_local_irqflag().

Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Co-developed-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/kprobes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 8ba391cfabb0..6eab97636e6b 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -113,6 +113,7 @@ NOKPROBE_SYMBOL(set_current_kprobe);
 static void save_local_irqflag(struct kprobe_ctlblk *kcb,
 			       struct pt_regs *regs)
 {
+	local_irq_disable();
 	kcb->saved_status = regs->csr_prmd;
 	regs->csr_prmd &= ~CSR_PRMD_PIE;
 }
-- 
2.42.0

