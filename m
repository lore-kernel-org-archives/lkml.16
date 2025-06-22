Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008B221FBF
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628017; cv=none; b=fdih8qKyYwjZh98xJHyw5LrCwhLhCHqKP7i+SpJ83Pc2pyLarPKcuWdOa68S1VYZPtU/Z2QqXuFDOfjF8ep5V+ZgmYFyKpT5njrCJBcttLOB/F9HXfU/gNBYLJPHdnOYzHUgkCW3df8oNCkAFdIci4BzR+tai7ShQtCyXXf1vl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628017; c=relaxed/simple;
	bh=9K2NpIEVnoAe2alCNOBN1YxBV6/oELFvayApQuoodpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5dXcrOBNANsHHsfxgTHNlKQPYSwX6o43dtvW4WfZVMaM9rXScvu9T/iDBn0z6BXZDsGK4aamk+iKlduipN9MqE0D8xbDxSNsdx1UiYjhi/bUAytJIt78TRmm7ANFObpvytHm4HA+fRz8ar772PwL2vkN9RRGHHUsHOwDWFtOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1Lbw/Lj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1Lbw/Lj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23508d30142so48292085ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628015; x=1751232815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imZ2VRtA0KRhDqFvVOmvCgQSiKBob6JpuoHz1j3Ovlw=;
        b=H1Lbw/LjKpNKvj6OMkBjam83hpR8W3IRRL92EImHzgqt7Q5NKYAR9my3IaeKwiwS8+
         xTNNeu+7cTKhCEkk7MkEk7dXpGlmJO6cSWz5sDWlDcfKdgVBdbvcMeeWCdzStNT1nEb2
         OwnoSVcXJmYs5Qb9+fBxNHvKkTyESBeIlm89Kid8B1smHlCFI+iFoj2fJFMDXb1H1BKE
         ldaEc+blZdnst2KkzVGfcrORmRE8Qwr4dY4GOYhNxQQHNsgnBnxEauo9sSBLVJ8rXfSf
         VxR2zrLoDvTkomURA0a5eIc99EHYra7kAEmkFpHNAkstV/fNcH20+/qX/x2tfemJYD98
         Cf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628015; x=1751232815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imZ2VRtA0KRhDqFvVOmvCgQSiKBob6JpuoHz1j3Ovlw=;
        b=dZ3pzEHZrz32RYGgcO0qf7SckaonyQZXLHG1OTUOg1DjgF28TfcM8vfS53KZJDlX3Z
         MYYO2yJRpWEssFXU6XIZ8vOy1/TfDYQIBaVy/RzjKTngu/Gx7D9HvCpwzwy80YqPha3S
         f7dhnZsUk4foSdbquMolq66PSWIruHWNr8lc7vVcKY9fqvAz5p6q8JCcSfweMX5LLu23
         s2Ja3o2UdRIvrPMMSY6vqQIcSHRMpx4rHq6DmawTtvjdYLmkt0Gd3eQa3p0P28Zko5eG
         sbFM9bVjvyTVfkz4+dq7FKzJh3J5OO46bSJqH/QaSDaifrpFhQ5m8mH7Axx9945+BNe2
         j5xg==
X-Forwarded-Encrypted: i=1; AJvYcCUAzsdpbn8zn7fxCuwL/h2KfhOC4B7pueVKrusyna/hj+PW2EMcG1JCRYrUntPXLqRlwIJ141IdD+5WLv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR03q5odnuK3nGQ3X1Tqt/ebntJyfU0Dz9akYlFf5/nvxXgiBq
	PXfdMJXcm7K1k6lEsvc0O9SbwlloaWwo8f5wgJckIw/p6rCqfXrPUgSy
X-Gm-Gg: ASbGnctgDKX8xbdU2UCEa1hALqHonNn+5+PmJ1H9Wh7ikTNrMQaWzhRCfSQNf2vbyNT
	OwjmiML75KXHNXyhMMv/L2Yrn0jZ96GqTpY1D46CpFvmoQarOSWwe/7m1nx8Gh0FKYX9549C7Jo
	ryB10Qq+QhXzMzgRbVUhNz6TtAiBUn/5UQ7HfKS5NaNNO/tNdWoCA1x7pGcHrYew3z6baqn9kij
	qvGxCOMAdldJCLJ7suXA7o4wLOxF+5rjTdpXaCFzMqRG319n6EcpfxZSzkPnFKCitQNypu06WHr
	jYE7dRZmCHqN0+/VO+04KrDQCsvByujN98WNId2dHd/T6Sn7IKlTgXJ+yIQvUhuAqAzy1JgqRuH
	5tdWKtR9VFJFYyxvZrwq1WDKMEVZbrGKk
X-Google-Smtp-Source: AGHT+IHUJSJk6kFL23Nwi5JQiUdKibcLCw4cz/mxoOvNKkEO/EWyf7iBCMF7YwsmUB2xpRLlmwLjtA==
X-Received: by 2002:a17:903:4b2b:b0:234:a139:11f0 with SMTP id d9443c01a7336-237d980d949mr156889965ad.7.1750628015092;
        Sun, 22 Jun 2025 14:33:35 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8673d1asm67144255ad.172.2025.06.22.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:33 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 92951EF1EB2; Mon, 23 Jun 2025 06:33:30 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/13] um: nommu: configure fs register on host syscall invocation
Date: Mon, 23 Jun 2025 06:33:05 +0900
Message-ID: <30ea8e4c251b15349f370302b98ceb70f4572180.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As userspace on UML/!MMU also need to configure %fs register when it is
running to correctly access thread structure, host syscalls implemented
in os-Linux drivers may be puzzled when they are called.  Thus it has to
configure %fs register via arch_prctl(SET_FS) on every host syscalls.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/um/include/shared/os.h       |  6 +++
 arch/um/os-Linux/process.c        |  6 +++
 arch/um/os-Linux/start_up.c       | 21 +++++++++
 arch/x86/um/nommu/do_syscall_64.c | 37 ++++++++++++++++
 arch/x86/um/nommu/syscalls_64.c   | 71 +++++++++++++++++++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/arch/um/include/shared/os.h b/arch/um/include/shared/os.h
index 1251f08e26d0..7c6a8bc0447c 100644
--- a/arch/um/include/shared/os.h
+++ b/arch/um/include/shared/os.h
@@ -189,6 +189,7 @@ extern void check_host_supports_tls(int *supports_tls, int *tls_min);
 extern void get_host_cpu_features(
 	void (*flags_helper_func)(char *line),
 	void (*cache_helper_func)(char *line));
+extern int host_has_fsgsbase;
 
 /* mem.c */
 extern int create_mem_file(unsigned long long len);
@@ -213,6 +214,11 @@ extern int os_protect_memory(void *addr, unsigned long len,
 extern int os_unmap_memory(void *addr, int len);
 extern int os_drop_memory(void *addr, int length);
 extern int can_drop_memory(void);
+extern int os_arch_prctl(int pid, int option, unsigned long *arg);
+#ifndef CONFIG_MMU
+extern long long host_fs;
+#endif
+
 
 void os_set_pdeathsig(void);
 
diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
index 8a1ab59a089f..3a6d34ccd12b 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -16,6 +16,7 @@
 #include <sys/prctl.h>
 #include <sys/wait.h>
 #include <asm/unistd.h>
+#include <sys/syscall.h>   /* For SYS_xxx definitions */
 #include <linux/threads.h>
 #include <init.h>
 #include <longjmp.h>
@@ -178,6 +179,11 @@ int __init can_drop_memory(void)
 	return ok;
 }
 
+int os_arch_prctl(int pid, int option, unsigned long *arg2)
+{
+	return syscall(SYS_arch_prctl, option, arg2);
+}
+
 void init_new_thread_signals(void)
 {
 	set_handler(SIGSEGV);
diff --git a/arch/um/os-Linux/start_up.c b/arch/um/os-Linux/start_up.c
index 4e1f05360c49..55dd92bd2a0b 100644
--- a/arch/um/os-Linux/start_up.c
+++ b/arch/um/os-Linux/start_up.c
@@ -20,6 +20,8 @@
 #include <sys/resource.h>
 #include <asm/ldt.h>
 #include <asm/unistd.h>
+#include <sys/auxv.h>
+#include <asm/hwcap2.h>
 #include <init.h>
 #include <os.h>
 #include <kern_util.h>
@@ -36,6 +38,8 @@
 #include <skas.h>
 #include "internal.h"
 
+int host_has_fsgsbase;
+
 static void ptrace_child(void)
 {
 	int ret;
@@ -459,6 +463,20 @@ __uml_setup("seccomp=", uml_seccomp_config,
 "    This is insecure and should only be used with a trusted userspace\n\n"
 );
 
+static void __init check_fsgsbase(void)
+{
+	unsigned long auxv = getauxval(AT_HWCAP2);
+
+	os_info("Checking FSGSBASE instructions...");
+	if (auxv & HWCAP2_FSGSBASE) {
+		host_has_fsgsbase = 1;
+		os_info("OK\n");
+	} else {
+		host_has_fsgsbase = 0;
+		os_info("disabled\n");
+	}
+}
+
 void __init os_early_checks(void)
 {
 	int pid;
@@ -484,6 +502,9 @@ void __init os_early_checks(void)
 	using_seccomp = 0;
 	check_ptrace();
 
+	/* probe fsgsbase instruction */
+	check_fsgsbase();
+
 	pid = start_ptraced_child();
 	if (init_pid_registers(pid))
 		fatal("Failed to initialize default registers");
diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_syscall_64.c
index 6b08daab6afe..74d5bcc4508d 100644
--- a/arch/x86/um/nommu/do_syscall_64.c
+++ b/arch/x86/um/nommu/do_syscall_64.c
@@ -2,10 +2,38 @@
 
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
+#include <asm/fsgsbase.h>
+#include <asm/prctl.h>
 #include <kern_util.h>
 #include <sysdep/syscalls.h>
 #include <os.h>
 
+static int os_x86_arch_prctl(int pid, int option, unsigned long *arg2)
+{
+	if (!host_has_fsgsbase)
+		return os_arch_prctl(pid, option, arg2);
+
+	switch (option) {
+	case ARCH_SET_FS:
+		wrfsbase(*arg2);
+		break;
+	case ARCH_SET_GS:
+		wrgsbase(*arg2);
+		break;
+	case ARCH_GET_FS:
+		*arg2 = rdfsbase();
+		break;
+	case ARCH_GET_GS:
+		*arg2 = rdgsbase();
+		break;
+	default:
+		pr_warn("%s: unsupported option: 0x%x", __func__, option);
+		break;
+	}
+
+	return 0;
+}
+
 __visible void do_syscall_64(struct pt_regs *regs)
 {
 	int syscall;
@@ -13,6 +41,9 @@ __visible void do_syscall_64(struct pt_regs *regs)
 	syscall = PT_SYSCALL_NR(regs->regs.gp);
 	UPT_SYSCALL_NR(&regs->regs) = syscall;
 
+	/* set fs register to the original host one */
+	os_x86_arch_prctl(0, ARCH_SET_FS, (void *)host_fs);
+
 	if (likely(syscall < NR_syscalls)) {
 		PT_REGS_SET_SYSCALL_RETURN(regs,
 				EXECUTE_SYSCALL(syscall, regs));
@@ -22,4 +53,10 @@ __visible void do_syscall_64(struct pt_regs *regs)
 
 	/* handle tasks and signals at the end */
 	interrupt_end();
+
+	/* restore back fs register to userspace configured one */
+	os_x86_arch_prctl(0, ARCH_SET_FS,
+		      (void *)(current->thread.regs.regs.gp[FS_BASE
+						     / sizeof(unsigned long)]));
+
 }
diff --git a/arch/x86/um/nommu/syscalls_64.c b/arch/x86/um/nommu/syscalls_64.c
index e88e93e9d80a..f213251c5e35 100644
--- a/arch/x86/um/nommu/syscalls_64.c
+++ b/arch/x86/um/nommu/syscalls_64.c
@@ -13,8 +13,70 @@
 #include <asm/prctl.h> /* XXX This should get the constants from libc */
 #include <registers.h>
 #include <os.h>
+#include <asm/thread_info.h>
+#include <asm/mman.h>
 #include "syscalls.h"
 
+/*
+ * The guest libc can change FS, which confuses the host libc.
+ * In fact, changing FS directly is not supported (check
+ * man arch_prctl). So, whenever we make a host syscall,
+ * we should be changing FS to the original FS (not the
+ * one set by the guest libc). This original FS is stored
+ * in host_fs.
+ */
+long long host_fs = -1;
+
+long arch_prctl(struct task_struct *task, int option,
+		unsigned long __user *arg2)
+{
+	long ret = -EINVAL;
+	unsigned long *ptr = arg2, tmp;
+
+	switch (option) {
+	case ARCH_SET_FS:
+		if (host_fs == -1)
+			os_arch_prctl(0, ARCH_GET_FS, (void *)&host_fs);
+		ret = 0;
+		break;
+	case ARCH_SET_GS:
+		ret = 0;
+		break;
+	case ARCH_GET_FS:
+	case ARCH_GET_GS:
+		ptr = &tmp;
+		break;
+	}
+
+	ret = os_arch_prctl(0, option, ptr);
+	if (ret)
+		return ret;
+
+	switch (option) {
+	case ARCH_SET_FS:
+		current->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)] =
+			(unsigned long) arg2;
+		break;
+	case ARCH_SET_GS:
+		current->thread.regs.regs.gp[GS_BASE / sizeof(unsigned long)] =
+			(unsigned long) arg2;
+		break;
+	case ARCH_GET_FS:
+		ret = put_user(current->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)], arg2);
+		break;
+	case ARCH_GET_GS:
+		ret = put_user(current->thread.regs.regs.gp[GS_BASE / sizeof(unsigned long)], arg2);
+		break;
+	}
+
+	return ret;
+}
+
+SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
+{
+	return arch_prctl(current, option, (unsigned long __user *) arg2);
+}
+
 void arch_switch_to(struct task_struct *to)
 {
 	/*
@@ -42,3 +104,12 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHIFT);
 }
+
+static int __init um_nommu_setup_hostfs(void)
+{
+	/* initialize the host_fs value at boottime */
+	os_arch_prctl(0, ARCH_GET_FS, (void *)&host_fs);
+
+	return 0;
+}
+arch_initcall(um_nommu_setup_hostfs);
-- 
2.43.0

