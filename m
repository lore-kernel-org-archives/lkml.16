Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1822221F02
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128099; cv=none; b=gC83NhLbpw+IWgpYNBpYsINAuhGQVxN/oiht1JHK/XUUHYlUl/2dPZXn9BGtv+U/d/3q6Or9wAWOQw7NDjkd3zMJ1gNFvgH8p08MMft9yipEE+vJ+V1G2Sn7+JoGpdMwen4lGA3Zy+NyWYkqGmABGeIaQKlKCHHDjWCPqjSvC4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128099; c=relaxed/simple;
	bh=XsY62iyKXlbhiLGEgh6So7HoZ24Pd1HbJ9dYgWyKHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nq0lIquSm8irKFCcs6CNnikTqkxVkmu2tLpyjbxXfJYJl27ZCvO/nCHb42nMUda1kVdEl5DYdmgFq1uwYGzAvEiKK170HyAT4gZCLuFcYsN7lX649DOsvk3mCUsJwXX+PIRmcVWtB1qOm5nqYL5jPFIJvT/M09Iz4xBz9deN31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx22odDyNoZMXjAA--.8727S3;
	Tue, 13 May 2025 17:21:33 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxb8cNDyNoLKzNAA--.63602S4;
	Tue, 13 May 2025 17:21:29 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: uprobe: Remove redundant code about resume_era
Date: Tue, 13 May 2025 17:21:16 +0800
Message-ID: <20250513092116.25979-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250513092116.25979-1-yangtiezhu@loongson.cn>
References: <20250513092116.25979-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxb8cNDyNoLKzNAA--.63602S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury7JFWrCFyktw4kKFy8WFX_yoW8Zrykp3
	ZrCwn3GF45Wrn3AryDJ3yDZr10y3ykGr42g3W29a4fA3W2qr15Xw18tayDXFyYywsYg34I
	qw4Fy34jvayxA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jY38nUUUUU=

arch_uprobe_skip_sstep() returns true if instruction was emulated,
that is to say, there is no need to single step for the emulated
instructions, it will point to the destination address directly
after the exception, so the resume_era related code is redundant,
just remove them.

Fixes: 19bc6cb64092 ("LoongArch: Add uprobes support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/uprobes.h | 1 -
 arch/loongarch/kernel/uprobes.c      | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/include/asm/uprobes.h
index 99a0d198927f..025fc3f0a102 100644
--- a/arch/loongarch/include/asm/uprobes.h
+++ b/arch/loongarch/include/asm/uprobes.h
@@ -15,7 +15,6 @@ typedef u32 uprobe_opcode_t;
 #define UPROBE_XOLBP_INSN	__emit_break(BRK_UPROBE_XOLBP)
 
 struct arch_uprobe {
-	unsigned long	resume_era;
 	u32	insn[2];
 	u32	ixol[2];
 	bool	simulate;
diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/uprobes.c
index 0ab9d8d631c4..6022eb0f71db 100644
--- a/arch/loongarch/kernel/uprobes.c
+++ b/arch/loongarch/kernel/uprobes.c
@@ -52,11 +52,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	WARN_ON_ONCE(current->thread.trap_nr != UPROBE_TRAP_NR);
 	current->thread.trap_nr = utask->autask.saved_trap_nr;
-
-	if (auprobe->simulate)
-		instruction_pointer_set(regs, auprobe->resume_era);
-	else
-		instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
+	instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
 
 	return 0;
 }
@@ -86,7 +82,6 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	insn.word = auprobe->insn[0];
 	arch_simulate_insn(insn, regs);
-	auprobe->resume_era = regs->csr_era;
 
 	return true;
 }
-- 
2.42.0

