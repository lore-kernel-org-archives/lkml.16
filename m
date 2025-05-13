Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495D82153FB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128096; cv=none; b=EHFvXiQws+QQ8IaHi/FXU9OegmMN5HDxSq1UqI9EkWNAMag9YyWRj0vnB0o7L0LxLA6Wftl1c4HHsQWj+Mlby2PNn+AVPJfXUTVIXqdESQ7Plb9AnimWjzLec0PeHE67mVpmYSCkNtWTF4fhC82g0Xnnge2DBFXcCla+2Bt9zNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128096; c=relaxed/simple;
	bh=2vAwU4cDwiZhv96PVgUCzv9MZVhXiHX0JuYdlZLRjio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtZtKpEjDSwhC26ljcfV71Q4FsIz0yXEPu6KH/HA0sFGhP3tcswDaHW7/oQemH/yyJUDTfbRsyf4N0Ywc5ossTm8XutNUG0N9K/FhNLaFtOkf24cMtVOwzW5Cryv1mIjdG01RWTyG5FrwYfa3mcUHP7Rag99OBSeF6It7GuAOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrnIZDyNoQsXjAA--.44064S3;
	Tue, 13 May 2025 17:21:29 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxb8cNDyNoLKzNAA--.63602S3;
	Tue, 13 May 2025 17:21:26 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: uprobe: Remove user_{en,dis}able_single_step()
Date: Tue, 13 May 2025 17:21:15 +0800
Message-ID: <20250513092116.25979-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMBxb8cNDyNoLKzNAA--.63602S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF15tryrGw4xtr1fJrWUtrc_yoW8ZF4fpa
	nrAw13tFW8WFZ5KFyDJ3ykZrySy395u3srWanrC34fC3yDtr18XF1xKFW3XF45AwsYgryF
	qr40y34jvF9rAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

When executing "perf probe" and "perf stat" test case about cryptographic
algorithm, the output shows that "Trace/breakpoint trap", this is because
it uses the software singlestep breakpoint for uprobe on LoongArch, so no
need to use the hardware singlestep, just remove the related function call
user_{en,dis}able_single_step() for uprobe on LoongArch.

How to reproduce:

Please make sure CONFIG_UPROBE_EVENTS is set and openssl supports algorithm
sm2, then execute the following command.

cd tools/perf && make
sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery openssl speed sm2

Fixes: 19bc6cb64092 ("LoongArch: Add uprobes support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/uprobes.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/uprobes.c
index 87abc7137b73..0ab9d8d631c4 100644
--- a/arch/loongarch/kernel/uprobes.c
+++ b/arch/loongarch/kernel/uprobes.c
@@ -42,7 +42,6 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	utask->autask.saved_trap_nr = current->thread.trap_nr;
 	current->thread.trap_nr = UPROBE_TRAP_NR;
 	instruction_pointer_set(regs, utask->xol_vaddr);
-	user_enable_single_step(current);
 
 	return 0;
 }
@@ -59,8 +58,6 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	else
 		instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
 
-	user_disable_single_step(current);
-
 	return 0;
 }
 
@@ -70,7 +67,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	current->thread.trap_nr = utask->autask.saved_trap_nr;
 	instruction_pointer_set(regs, utask->vaddr);
-	user_disable_single_step(current);
 }
 
 bool arch_uprobe_xol_was_trapped(struct task_struct *t)
-- 
2.42.0

