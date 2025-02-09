Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F0A7602D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077469; cv=none; b=brgAqQnLJ1UVM5Ncsx4C0yWeOrNxCUXzWPGWMAiDoewv2tqIN4/40WOZyu4uPs7jcPSIXT8NgHzpN4X+avRxiwWuqGK+0tQbKQt5Ocfv/k4kPnO9Cb21JyFg1EOhXRZJYuFJ+GN2Sf782Yg3fTkGVJgrJTOyn/JAcDfqPbi+uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077469; c=relaxed/simple;
	bh=8yXTe1OVYj5JbnkZl3XT42RRvKOsy4P0SYyjAUxDUnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nw/JfEp+QxF9qnOUPAKHTtennL2Dkr54LvADeG47i8hBp+tEkF+gZY/7r58l2LBoRrbmsjK6Y97E1pnYjIHXYZCUlr/v0MOXJduMH5/HTRgFTLqTGd6/yugq2gWDiuIA7NxI5E7yvOmNcTD6csVvcML1iUBocK+dC1gZvyv/XJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=JSsMXTFE; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="JSsMXTFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739077417;
	bh=Z6ksVB32RXVttz8UCUtXbrkj4oFxmHS+sTWhuis6k8E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JSsMXTFEeXR0OssNbTzmqP5vy4kbzzhZOHWqOk65qjG/qoGVUWa7IbiPPG//0mwFe
	 l4wlnXImm+V51F/7/+2mqmOJcwDoZCNXFZHN/HYvWLUo0EBhbUy3Ttck4uXTwFPSpD
	 gT7FzxMit3CBKlNIdBgojX7h7ciRZkCKWjYpQ1do=
X-QQ-mid: bizesmtpip2t1739077409txaffsj
X-QQ-Originating-IP: Ix4VF44njFOVpDxDUDRswVWHR+c9YaMA2uaiDU6wwTc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Feb 2025 13:03:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15359551948840619641
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenlinxuan@uniontech.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH v2 2/2] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sun,  9 Feb 2025 13:02:58 +0800
Message-ID: <BE6A6E80196F688F+20250209050258.2090416-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250209050258.2090416-1-wangyuli@uniontech.com>
References: <20250209050258.2090416-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MUAUrqfXubadP0KxQlkSUI0GFE1h0MJnPqvENMHiNlciUAysIlE/HUNZ
	BMHnVAaZnTVgmQlfhXpz88k/LcMR+JIC4ZEd2q4KlXcPmiBq/iHD0QBm2JOzUSKZMP+HF7S
	UVuKTZl5ztzbx4UGVZAcKGukGmjeaEfxjPk4uJ6DdA/1lvRwWObVBfrJpNjCMc4wwtCNBoS
	F9abrljTngMr5/1+El7GD4D/pI/4F6ivAQYxhRNjZO2OflUdyVweqsY0kKr2qoBkqdtVWHM
	fLW/ESusi6gAh4jIVr4c/tVywDHdxmyaLZ1SOS0QuShvFaPUNoNv4qsQuS8jmD9mOPU9G2j
	Q4LkbY2P9f2DTPRMRypCzbTHBArLl6jPpfdYgO64SXKnrKM5SY92xYBB+ZcBzsIIV9ktSzE
	8Z8SvUk3gtFQyAdybaeHFhpxc0C/mmPitXpEOWxZB7GM0pUqlGELltHq56D/RoSmZOxI18c
	8aKspAXDhY13Rs3xSLez8hHeiGFTT83LdshdF22edFMKh+lAR8/MVrCl53CmOza0hkmcPJc
	qYqkPvC8CrcLvmpQkyQ2qmXG7zK/yZHB4VkCjCXATBHB5/+QEnIZwbiGp8njO6uVvtRIadx
	57OgCWF8G5Tu5IhKICP1L3I7gamT9aZ6Ijet1yYnoKS9XolN14t5gYM7he7zBnLMmdS3fMl
	1ztXKRv+WwLGelVmIr/5+JZgnu8dnn2b3TdGeJ3Q9WoZGBzBlsCjdd8KYR8f/5PfqsZ3T2o
	VVa/2VWcWo55naE3wQchZNTTKBzHwdI76IgCwd6TtME1ZWwyHii+VTxlB2GjlYy6rY3g+2L
	Q/8BoR6RRbD/KbBxiYBfV91Ey2IdLVnIvGVr7RG8n4ab1ZnQy4f/J6fwKI0QvjDE5viKb1H
	yaNhkCVCDHFSsjjq1o3CQHcE+zy1Yjp76xfn64Uq01rskKlm9Rwcoysgi/TZMD8isM1tf9h
	XSI0w+EHcL/0yRIiKTItc/zpF+mJu+InU/Erv/u0dxhE+dpfhE2rhyRR1Sk44IN2nfDupX8
	Rc+dM8tQPsx20+pHrhdcG+YNyRCHyDRt9ZfpXXxcmSj398xj3K6amT77Kk0HqaCO82RVy5J
	MLrctWQRmsy1NYTv9AFID0=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

The notifier hook mechanism in proc and cpuinfo is actually unnecessary
for LoongArch because it's not used anywhere.

It was originally added to the MIPS code in commit d6d3c9afaab4 ("MIPS:
MT: proc: Add support for printing VPE and TC ids"), and LoongArch
then inherited it.

But as the kernel code stands now, this notifier hook mechanism doesn't
really make sense for either LoongArch or MIPS.

In addition, the seq_file declaration needs to be moved to its proper
place, as only the show_ipi_list() function in smp.c requires it.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Liupu Wang <wangliupu@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>
Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/cpu-info.h | 21 ---------------------
 arch/loongarch/include/asm/smp.h      |  1 +
 arch/loongarch/kernel/proc.c          | 22 ----------------------
 3 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 35e0a230a484..7f5bc0ad9d50 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -76,27 +76,6 @@ extern const char *__cpu_full_name[];
 #define cpu_family_string()	__cpu_family[raw_smp_processor_id()]
 #define cpu_full_name_string()	__cpu_full_name[raw_smp_processor_id()]
 
-struct seq_file;
-struct notifier_block;
-
-extern int register_proc_cpuinfo_notifier(struct notifier_block *nb);
-extern int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v);
-
-#define proc_cpuinfo_notifier(fn, pri)					\
-({									\
-	static struct notifier_block fn##_nb = {			\
-		.notifier_call = fn,					\
-		.priority = pri						\
-	};								\
-									\
-	register_proc_cpuinfo_notifier(&fn##_nb);			\
-})
-
-struct proc_cpuinfo_notifier_args {
-	struct seq_file *m;
-	unsigned long n;
-};
-
 static inline bool cpus_are_siblings(int cpua, int cpub)
 {
 	struct cpuinfo_loongarch *infoa = &cpu_data[cpua];
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 3383c9d24e94..34ba80c312d0 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -91,6 +91,7 @@ extern void calculate_cpu_foreign_map(void);
 /*
  * Generate IPI list text
  */
+struct seq_file;
 extern void show_ipi_list(struct seq_file *p, int prec);
 
 static inline void arch_send_call_function_single_ipi(int cpu)
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 56a230238c9c..cea30768ae92 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -13,28 +13,12 @@
 #include <asm/processor.h>
 #include <asm/time.h>
 
-/*
- * No lock; only written during early bootup by CPU 0.
- */
-static RAW_NOTIFIER_HEAD(proc_cpuinfo_chain);
-
-int __ref register_proc_cpuinfo_notifier(struct notifier_block *nb)
-{
-	return raw_notifier_chain_register(&proc_cpuinfo_chain, nb);
-}
-
-int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v)
-{
-	return raw_notifier_call_chain(&proc_cpuinfo_chain, val, v);
-}
-
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	unsigned long n = (unsigned long) v - 1;
 	unsigned int isa = cpu_data[n].isa_level;
 	unsigned int version = cpu_data[n].processor_id & 0xff;
 	unsigned int fp_version = cpu_data[n].fpu_vers;
-	struct proc_cpuinfo_notifier_args proc_cpuinfo_notifier_args;
 
 #ifdef CONFIG_SMP
 	if (!cpu_online(n))
@@ -97,12 +81,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
-	proc_cpuinfo_notifier_args.m = m;
-	proc_cpuinfo_notifier_args.n = n;
-
-	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
-				&proc_cpuinfo_notifier_args);
-
 	seq_printf(m, "\n\n");
 
 	return 0;
-- 
2.47.2

