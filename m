Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596BD286A1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978541; cv=none; b=irNyxm6CMl4Ip40830zI77rOJM+tSvwPPnZUwi8Ygq/Y8xOX+OuhzknIyYtWd9qfJDYs0R58onxNWvrm3/4bmQRBO8lezRLC4X6WTPezqs7CkAosQJjb71RW8DlmQFFtJ1VtZ4V033cx0YT7p2LC5TVL8MHRxoJLxeX+fh+8EZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978541; c=relaxed/simple;
	bh=FCnIGEA1W8Gdi6HLs/8CaOG461ny2CkaCwENpo878EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fxlWrS+PV951UYNWxj4B1QlivdkD+MXVExY9MR3H8XRjXKCoCOPQzhwPhBIHoCA3ZbMXXPtc86UPuOYGmIizpr1zm7n2KVf/0I16tRU4NQTQ4kLNmUGuGCupJqN8o7F5SFwEQWgUUO9npkfoFe3i11jajZdUv4WpCZZLMsJBISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cpjEAGxX; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cpjEAGxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738978472;
	bh=e/xqHLyJ/T5Q7z8TKyFjea3+EClW7YemhkJ0zAILeKg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cpjEAGxXYuqkT2eKLMwy9hyqLvA65Itl7jM7aGJcDEAW+uqrcrqgrxgslJaL1Gvis
	 0zNAMIZf0HAhc89NoaIL8+Udq5HiqrzNxWtEwSgKNWe4LsiPw3iNmY7b1ozM41KZOO
	 vGOnGdojgZ9p76VB2XDFQQFPnjEBg+gEHtf8iJmE=
X-QQ-mid: bizesmtpip4t1738978440tudhzwp
X-QQ-Originating-IP: NG0u61HUQbT6bj9uCV2n+irMw7n/LpjlyEUkegcep9U=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 09:33:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 581403337225196444
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@unionetch.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sat,  8 Feb 2025 09:33:55 +0800
Message-ID: <3CA1F6E1F2943EAA+20250208013355.401050-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NYlggeZuI0UGXmhme+f+XoDuidKh7i/0lowmDnx2Xgqc5kCAB/iRZiGy
	fWG/C7jpgWP19QblBVEXlFhqvQCeW/0RdoBqUjemJ498+GdshvHVereXAube1j41R1fo8tx
	VPuhI93lvIH+DlHG5vLB05M1NFmWS6Z09pCEEhswGsEqvtRNIOGyhWW+5s2D59f8P4S5GAh
	klhxDcnc1wQBWYum7QRyIKiOyEoVB/lMlzixU+fo4iV42HDYDnqPsETvnp0xCSt35Bz5vgm
	St8VdoCHYmDITIZqjF8OaKQJQ/wl2mRY6NhW2Cdqr+UgnWOUXIzLuSCxv8bpzgiFrGRViwV
	0ko5TT1lIxlIh/65LhE8ceJ9dvEKdNE/Lx5bjo+Sb5kriVUACXsmLNmaPuWkMMWFu7caFUP
	kTYYHGJHsxaLdXbJLKJz87cVgnBDWrzDi+DINJeuZypt2FYZxGQwm5b0v1+7wevYYq4lgt7
	zPFn0+Rsd0LseJo6jATa6LNEjBayKuZCJUx+o2TSXrpV8gW2lUFcKc9SnYnkVeEfyROXyeR
	T3R+VZkfWp+rD5xPZoz1VdYiYepA1b80AC+HCDIJTGEuf9G4Ygl6F2Iid5W6Y5O0LDCDyv/
	EHWcLRqdn+YvJPtdmcGuitQDV5Tkx3Htfg5si/z2mx6PwkxfqYzyp6tzAsGvTPCMi0nnHur
	MjLMKubp/ipMv+I6DlE4U49+nmzTeHELweJZwdhqf7gGYo0QlS/z0UDN/R/fjMC8oU29tkb
	p+CG4Pz7HJgCKwuULdYknq6yw9bExODuYTmQkZoU8Dw10eawtnizOcUsd5nsT90rpiK1g3G
	1YYOh1WEBopx19ss7SXvO87zSybsFDE+/76J4CSfsCuwcuu2Tyx/xdohutRx05w5QLhA1QU
	QmA6b8wX0+8MV70TE1/Ln2QZM2BJdh/PMnxMvE8CWtJfJV8h8CdkqD3ksjyp1+Q1oxNfq1U
	Az+UN0YNDXQPcA3JJ6jl3uOVn94XlBGXCaEGU9V+Nu25W1g==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

The notifier hook mechanism in proc and cpuinfo is actually unnecessary
for LoongArch because it's not used anywhere.

It was originally added to the MIPS code in commit d6d3c9afaab4 ("MIPS:
MT: proc: Add support for printing VPE and TC ids"), and LoongArch
then inherited it.

But as the kernel code stands now, this notifier hook mechanism doesn't
really make sense for either LoongArch or MIPS.

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/cpu-info.h | 19 -------------------
 arch/loongarch/kernel/proc.c          | 22 ----------------------
 2 files changed, 41 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 35e0a230a484..48217f07d37e 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -77,25 +77,6 @@ extern const char *__cpu_full_name[];
 #define cpu_full_name_string()	__cpu_full_name[raw_smp_processor_id()]
 
 struct seq_file;
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
 
 static inline bool cpus_are_siblings(int cpua, int cpub)
 {
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 6ce46d92f1f1..004f494bf43f 100644
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
@@ -98,12 +82,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
-	proc_cpuinfo_notifier_args.m = m;
-	proc_cpuinfo_notifier_args.n = n;
-
-	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
-				&proc_cpuinfo_notifier_args);
-
 	seq_printf(m, "\n");
 
 	return 0;
-- 
2.47.2

