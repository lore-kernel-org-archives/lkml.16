Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEFCA31
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612393; cv=none; b=LETwS+EsKSrV8386qFrKNrwxmtE4S+j6+TxjRlS5eX80wPP6mZ9uqhwmw3ctdBQpXiwqLMe24bii8LWvZ1EgvfxFRFR5ejYoIRJSeDU1neXmIYqWH/Tzn9MDsAlsVe3zXCNqpRvJwpcy//OTbfh+kb3sSRVmx1Yglw3tbA3ImhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612393; c=relaxed/simple;
	bh=TkYjw2gY1eODfPiUtFnFZw5vNxrfJTGcP3anVqaHl7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gCY7/b0XHY1efySliYl81QyPmun9WEsC77+adR+lB3EbQl0W+SzAvBd/nxiojIbbC0M+rCHgBOfh7dJP2IGIwlFh1mRmLgqli09/50dO/9hCjaiy9Q8uMnVfGEfApvJi9goAycbRxpwh3HlQxswd5b8rOcGOQ+nyteB6/kFKoLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8CxieCjMBtoHwvYAA--.48533S3;
	Wed, 07 May 2025 18:06:27 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBxXsWiMBtoQcS5AA--.13196S2;
	Wed, 07 May 2025 18:06:26 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: loongarch@lists.linux.dev,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH] Loongarch:Prevent cond_resched occurring within kernel-fpu
Date: Wed,  7 May 2025 18:06:24 +0800
Message-Id: <20250507100624.8925-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXsWiMBtoQcS5AA--.13196S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uryrJrW3Cw4rJr1fCF1fKrX_yoW8uF1rpr
	yS9r95tr4UJ3ZIvay3Jr18Gry5J3ykGw1xWFZxGa4rA3y5Xry8Xwn2gr12qFy29FWIvFWf
	ZFn5XrWIg3WUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOa93UUUUU=

When CONFIG_PREEMPT_COUNT is not configured, preempt_disable/preempt_enable
merely acts as a barrier. However, cond_resched can still trigger a
context switch and modify the EUEN, resulting in do_fpu being activated
within kernel-fpu critical section, as demonstrated in the following path:

dcn32_calculate_wm_and_dlg
    DC_FP_START
	dcn32_calculate_wm_and_dlg_fpu
	    dcn32_find_dummy_latency_index_for_fw_based_mclk_switch
		dcn32_internal_validate_bw
		    dcn32_enable_phantom_stream
			dc_create_stream_for_sink
			   kzalloc(GFP_KERNEL)
				__kmem_cache_alloc_node
				    __cond_resched
    DC_FP_END

This patch is similar to d02198550423a0b695e7a24ec77153209ad45b09
(x86/fpu: Improve crypto performance by making kernel-mode FPU reliably
usablein softirqs),to avoids the issue, and extends kernel-fpu application
scenarios to softirq.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 arch/loongarch/kernel/kfpu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/kfpu.c b/arch/loongarch/kernel/kfpu.c
index ec5b28e570c9..e60bbaca357a 100644
--- a/arch/loongarch/kernel/kfpu.c
+++ b/arch/loongarch/kernel/kfpu.c
@@ -18,11 +18,28 @@ static unsigned int euen_mask = CSR_EUEN_FPEN;
 static DEFINE_PER_CPU(bool, in_kernel_fpu);
 static DEFINE_PER_CPU(unsigned int, euen_current);
 
+static inline void fpu_lock(void)
+{
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_disable();
+	else
+		preempt_disable();
+}
+
+static inline void fpu_unlock(void)
+{
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_enable();
+	else
+		preempt_enable();
+}
+
 void kernel_fpu_begin(void)
 {
 	unsigned int *euen_curr;
 
-	preempt_disable();
+	if (!irqs_disabled())
+		fpu_lock();
 
 	WARN_ON(this_cpu_read(in_kernel_fpu));
 
@@ -73,7 +90,8 @@ void kernel_fpu_end(void)
 
 	this_cpu_write(in_kernel_fpu, false);
 
-	preempt_enable();
+	if (!irqs_disabled())
+		fpu_unlock();
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_end);
 
-- 
2.20.1

