Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4A18EFD4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295092; cv=none; b=ZvcsLyc3Xj4tnEXEjjfzqLxaoEIGMXqphHQDGsE9V290gEv+1t8JN95kMZY/JHT5zo6/rPCxnP9x7olnN//+lkChZ8OQ4AJMcl2rmway05wviJKj1k1BpUlB0PFogjpLPVpZR42nMc8+iKsLpsiLmiv/+y+SCBMZoR1eQlkt9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295092; c=relaxed/simple;
	bh=O2JwOhGN7x6zkLg/VfIyxgWYO5ZxuKclp2S+k/vZwws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ys5t+1u42bovqxQUm3a9araKil0w+Zb8JeUAduhk+8tTfGosPtNy4G0GvmYoWYWTdl3UJeJtx0GmkTIbiPLQOQmAaZysyQ/Hgvobg289CWGoGoXuByEb7265ik/KhtlkmCE1BG2tzEsqTL38dPiT/P+/vunaXt1pXGLb+R+P0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJe1yag6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJe1yag6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e81d37a7so138458b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295090; x=1750899890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihdFXWNIx+H443+kP6md5Dj55CMYh0h9g6RuQVPwAiE=;
        b=dJe1yag6PrUnduVtlzxYq6bJtqJ9aVKa15myd8k4oYJwMvVFJ1J+Hj54xYurKDIGY4
         TZt17mCn8m9imGQhQ1I2R0vPvEyWlgnbwl8j+6ii9PP1o4Edu4P+vqmGhD89gUp+7D3W
         ZhF400DC+2y4QMLV83gXfo4jva4OFcNiKhuOsIS6opzQpnKAD3m2ROTaJJTEqk/NwMcX
         vJpTWGDjMxzyYVCadVxa1Hw143/fgRYjQEmc+JI3OIWzuUvdruOwS+kFoQLgkFM4IEFE
         wfwWj1q6PFiPZ+6TbAd/wOp96uii8xcHMlmvkD7cks8cd7l/59hamL7ZpKqW/pDQlGM5
         InBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295090; x=1750899890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihdFXWNIx+H443+kP6md5Dj55CMYh0h9g6RuQVPwAiE=;
        b=inpJOjg2KOvZGvVSa37hlPULx9W28AmO6sYrV8VewmPWtt2j7FQ1WC0DUCXy4KnzO9
         ElvQ5trNTQj52KId1HQZFBRBdxULHJWAm1c515GgZmBo+PstQnMdYCTQ0L4ciW+tp9zF
         SWK5hdWjY0shnorV3pDmsNPBXFhAmOL+JSA7wygC7le8/ZFzDcigF8UVV62D46GP0HXZ
         X5Z3RMRJk8/SEZS+iqZM69PTJW37t26sdos8xX+s6G2Cu7Ojo2gsM+m4sN6ziZllTjHl
         G+tB1B7ElcnTOeYFUbTfImDu1bWC08QDczG2TpaxvalKHRo8/CbBD0bu6KMw2/frVFFZ
         AsVg==
X-Forwarded-Encrypted: i=1; AJvYcCXkVCWbE0X90r+GN2HlckVYGjtT3pYd1ai1ngRR8hoKx6nl0BEzvdP0O9HXMEEqeRHS+rGP5urDS20yd4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8rP8G8/c47UuGvxGlkG90oJnqNyjTC4jjWugwmm3pvgiKu1f
	vZanldqlXvnbWXa8qZ6bMGDXNDN0arAzTKSekfbCMy0AvzcPpo/WWu11
X-Gm-Gg: ASbGnctPR96pUmSS4prmnbwSUgKHfx3gn+Rmg5/bI0pAb4jrOTzszfqBPEjdqayAYE7
	He9sq6hlWo8L+VFdIIncYrNZu9HEJtQ8MyIAHiB9k/4OEAjIJyo2tLxWnm3fCGC7ySTg/6b/Bau
	PZy8XdIl5pEzZv+AlvGuYbze0cG0/ejP39uVBfCVhvIoOG6ICEfkRVAMp6aSrI99tLuMggUNsSl
	KDUBwzFABosIgCWH1n9fiCBXvMEgKZhq475XqsfbC+R92bJ6kR+laR7kU0oee+KJSGarw08Pjt8
	9YlBarMyMxjglzBrSMf9f6lzzEEAf08g0iGD6oWj5eaOG/681TNzcWfE4mKKDa6JTrWddf8QZF9
	wVpYuYawCwLeQuyr7vAfp8VK1uMO2WDt6
X-Google-Smtp-Source: AGHT+IGZ4bg7vYaVF4gGWT0CG08w6lmpULaJfwfanalAIWgpjTFJYjIFTJnjoOhko+Y0PjC8ljzkjQ==
X-Received: by 2002:a05:6a21:99a8:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-21fbd668c44mr28761235637.42.1750295090022;
        Wed, 18 Jun 2025 18:04:50 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm11895294a12.69.2025.06.18.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:49 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 2EBD5ED6536; Thu, 19 Jun 2025 10:04:46 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/13] um: nommu: configure fs register on host syscall invocation
Date: Thu, 19 Jun 2025 10:04:11 +0900
Message-ID: <2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
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
index 5d0fa83e7fdc..796beb0089fc 100644
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
@@ -17,6 +45,9 @@ __visible void do_syscall_64(struct pt_regs *regs)
 		 syscall, (unsigned long)current,
 		 (unsigned long)sys_call_table[syscall]);
 
+	/* set fs register to the original host one */
+	os_x86_arch_prctl(0, ARCH_SET_FS, (void *)host_fs);
+
 	if (likely(syscall < NR_syscalls)) {
 		PT_REGS_SET_SYSCALL_RETURN(regs,
 				EXECUTE_SYSCALL(syscall, regs));
@@ -34,4 +65,10 @@ __visible void do_syscall_64(struct pt_regs *regs)
 	/* force do_signal() --> is_syscall() */
 	set_thread_flag(TIF_SIGPENDING);
 	interrupt_end();
+
+	/* restore back fs register to userspace configured one */
+	os_x86_arch_prctl(0, ARCH_SET_FS,
+		      (void *)(current->thread.regs.regs.gp[FS_BASE
+						     / sizeof(unsigned long)]));
+
 }
diff --git a/arch/x86/um/nommu/syscalls_64.c b/arch/x86/um/nommu/syscalls_64.c
index c78c442aed1d..5bb6d55b4bb5 100644
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

