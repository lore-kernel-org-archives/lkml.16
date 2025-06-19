Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021041A5BB2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295087; cv=none; b=RkAdMZdjQebNTwxJvj7Ya5ByHZZB9Z8697wrIiAOvy+B/Cl4flfGs3mh+m+K6clV/c1rOvrWVOwefy5gn+QbFqiW5wRvhgLr1AvKYNCDYB680Qgx3eWKjcV5YxlX6kzxiDbhKnyqXLbyjccFwLGBc8gqKnpZ9Nfhbg6sROCI7Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295087; c=relaxed/simple;
	bh=aI/a1cXGXvx7I7cf7SF1XPZkt49h25YOh7Q+a504gb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cahQ9tDo1ffdBmilSHP0Z7EZERMzTJyq3qta1GGNPZGTqaFCT2ob5rXkgarmLhPIskw1Mr2vUTA22/ZvBaV62NgOa0tZ5pkKAJIXrX/WpAErb3NYqBh+aguo530H56hxgAG/XUqXHD60XZaWGr9FbPBlGyiEH2P1x9XAL6lBUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgbRJBC4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgbRJBC4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2366e5e4dbaso1851315ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295085; x=1750899885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji+ZU1sT1gsELuhh4VwtCDF/4tcor+mPUimFYMKA61U=;
        b=UgbRJBC45h7xivTiC67BO2Awlq06cP+4v7OTtiHvBKxIaLBm8eIV7q+olgzOm2zAa1
         4P4ZB18XEnVK13V8eaphZJVO5HHG245CwR8yH77rNhpMBftO44FPKohugiUFJxTPxuI6
         izI6pG9quOOFJgoV5+ufiM26fS0MnW+p4Z7KfFx36NaNtVhV1uvE/XMP9l+d5RLfnXK/
         KenECf9rltZ0NbX2ZOlmuxXCzTOT+3OWnI0W8oL1B3QHg6dFwhxdjmUD3uVdhC3FC3F8
         quycDfBJlifzK3qwxTxHVcUtDFHHFqAkTn2ZT0Po+aU1QcmgAZkmcjg84s7aezylvFRI
         uLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295085; x=1750899885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ji+ZU1sT1gsELuhh4VwtCDF/4tcor+mPUimFYMKA61U=;
        b=Gjn75szMIo0R73ATzDbxZrKy7AWqe20I6MMeb/txcwe3cpc0IDxgJf0t8F1uQWcLBs
         4/YQOwiY0GsP0EOXx6UXptT2bkSMW/Q+8gFg+mk4EE6uK9HmCCH3FtP21e8BJMocZPBK
         ix+i/1RYTjk1yYp5QkxXGtZfdMBzeMaSy51VKDeZw95v8TmN/0FRs2ggrGg7PS4Yndzg
         lpn4u7IrOAUIRHRWx3u8L8ESQF2v1oF2ZrTitrWuree7Cd+tr9WhhRKqwoWp/2y8Tp92
         RzgT8kU5zvZSuUW8U+5KJ127NXhv58HiNr88dlYqJtWMEquPYAoj4wJ+NMqw9IJkX8oQ
         YHEA==
X-Forwarded-Encrypted: i=1; AJvYcCUDxMuM38TgCda7ZnrOuledWt44vz6Toq8IYc6sRJxBMwhYeV0XF/WdfdU/YQt3svLtKUj/9sa4nz2khls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/1fIRx3gUQEBnXnpNnyqnL6L4ZJ7yOvUSXxfL93m7sbokLKl
	0D3fG3TFFcETNVU9BxoSBFbAWEOGbhCKockgGZNk2NLnCYdwF6eufR//
X-Gm-Gg: ASbGncscTWMLKgfoRdBSPOGvB4GjRwyxzeqIXQE3hIbuz9r8PFHeYAO/7v4oxaGJzeV
	nAYuHVXVpms8O30CgSoaYjrnuZq8g4D8bn8FlCvZKCJa/GljIZNyfSbsHGLsfrdphkpHHgCl5hr
	2cRIee+OhFXL5MJzLtAigij2MSYjjGcNGL09lAUnF6pXarj1IkpFD2gtbnaDvDLatVhK4AF+AgP
	scVs5jSsWoivs73XmwHWBRD5WOkge1uWp+fj3qsaXeR68dbIWv5guEwgpH8NLWoU0yutCHxrumG
	dwRWWe7+YU4vRBFRCWpoCjZhJurB6Ii8blV6mzPSwB6QXVRDBFGF/54DvD7T0yHKxuPSyms/fLU
	iv2+dAtWDqFl0IaWsmDdoQDzvKeH0qu8E
X-Google-Smtp-Source: AGHT+IHYeO1brdKDkunGQe6NWOSRQervR7OrylHVdVsGvONq6e3US8BG6tbFscc3JIS8Qm+sGe51JQ==
X-Received: by 2002:a17:902:e550:b0:235:efbb:9537 with SMTP id d9443c01a7336-237cbee5016mr23428255ad.3.1750295085045;
        Wed, 18 Jun 2025 18:04:45 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decad5fsm107969565ad.211.2025.06.18.18.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:44 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 99C23ED6532; Thu, 19 Jun 2025 10:04:42 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org,
	Kenichi Yasukata <kenichi.yasukata@gmail.com>
Subject: [PATCH v9 05/13] um: nommu: seccomp syscalls hook
Date: Thu, 19 Jun 2025 10:04:09 +0900
Message-ID: <9a59a67dad5b7455ff975a68ba5f5fb95a8d02a9.1750294482.git.thehajime@gmail.com>
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

This commit adds syscall hook with seccomp.

Using seccomp raises SIGSYS to UML process, which is captured in the
(UML) kernel, then jumps to the syscall entry point, __kernel_vsyscall,
to hook the original syscall instructions.

The SIGSYS signal is raised upon the execution from uml_reserved and
high_physmem, which locates userspace memory.

It also renames existing static function, sigsys_handler(), in
start_up.c to avoid name conflicts between them.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Kenichi Yasukata <kenichi.yasukata@gmail.com>
---
 arch/um/include/shared/kern_util.h    |  2 +
 arch/um/include/shared/os.h           | 10 +++
 arch/um/kernel/um_arch.c              |  3 +
 arch/um/nommu/Makefile                |  3 +
 arch/um/nommu/os-Linux/Makefile       |  7 +++
 arch/um/nommu/os-Linux/signal.c       | 16 +++++
 arch/um/os-Linux/Makefile             |  5 ++
 arch/um/os-Linux/seccomp.c            | 87 +++++++++++++++++++++++++++
 arch/um/os-Linux/signal.c             |  8 +++
 arch/um/os-Linux/start_up.c           |  4 +-
 arch/x86/um/nommu/Makefile            |  2 +-
 arch/x86/um/nommu/os-Linux/Makefile   |  6 ++
 arch/x86/um/nommu/os-Linux/mcontext.c | 13 ++++
 arch/x86/um/shared/sysdep/mcontext.h  |  4 ++
 14 files changed, 167 insertions(+), 3 deletions(-)
 create mode 100644 arch/um/nommu/Makefile
 create mode 100644 arch/um/nommu/os-Linux/Makefile
 create mode 100644 arch/um/nommu/os-Linux/signal.c
 create mode 100644 arch/um/os-Linux/seccomp.c
 create mode 100644 arch/x86/um/nommu/os-Linux/Makefile
 create mode 100644 arch/x86/um/nommu/os-Linux/mcontext.c

diff --git a/arch/um/include/shared/kern_util.h b/arch/um/include/shared/kern_util.h
index 00ca3e12fd9a..ec8ba1f13c58 100644
--- a/arch/um/include/shared/kern_util.h
+++ b/arch/um/include/shared/kern_util.h
@@ -66,6 +66,8 @@ extern void segv_handler(int sig, struct siginfo *unused_si, struct uml_pt_regs
 extern void winch(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs,
 		  void *mc);
 extern void fatal_sigsegv(void) __attribute__ ((noreturn));
+extern void sigsys_handler(int sig, struct siginfo *si, struct uml_pt_regs *regs,
+			   void *mc);
 
 void um_idle_sleep(void);
 
diff --git a/arch/um/include/shared/os.h b/arch/um/include/shared/os.h
index b35cc8ce333b..1251f08e26d0 100644
--- a/arch/um/include/shared/os.h
+++ b/arch/um/include/shared/os.h
@@ -338,4 +338,14 @@ extern void um_trace_signals_off(void);
 /* time-travel */
 extern void deliver_time_travel_irqs(void);
 
+/* seccomp.c */
+#ifdef CONFIG_MMU
+static inline int os_setup_seccomp(void)
+{
+	return 0;
+}
+#else
+extern int os_setup_seccomp(void);
+#endif
+
 #endif
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 2f5ee045bc7a..14b9dcab9907 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -431,6 +431,9 @@ void __init setup_arch(char **cmdline_p)
 		add_bootloader_randomness(rng_seed, sizeof(rng_seed));
 		memzero_explicit(rng_seed, sizeof(rng_seed));
 	}
+
+	/* install seccomp filter */
+	os_setup_seccomp();
 }
 
 void __init arch_cpu_finalize_init(void)
diff --git a/arch/um/nommu/Makefile b/arch/um/nommu/Makefile
new file mode 100644
index 000000000000..baab7c2f57c2
--- /dev/null
+++ b/arch/um/nommu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y := os-Linux/
diff --git a/arch/um/nommu/os-Linux/Makefile b/arch/um/nommu/os-Linux/Makefile
new file mode 100644
index 000000000000..68833c576437
--- /dev/null
+++ b/arch/um/nommu/os-Linux/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y := signal.o
+USER_OBJS := $(obj-y)
+
+include $(srctree)/arch/um/scripts/Makefile.rules
+USER_CFLAGS+=-I$(srctree)/arch/um/os-Linux
diff --git a/arch/um/nommu/os-Linux/signal.c b/arch/um/nommu/os-Linux/signal.c
new file mode 100644
index 000000000000..19043b9652e2
--- /dev/null
+++ b/arch/um/nommu/os-Linux/signal.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <signal.h>
+#include <kern_util.h>
+#include <os.h>
+#include <sysdep/mcontext.h>
+#include <sys/ucontext.h>
+
+void sigsys_handler(int sig, struct siginfo *si,
+		    struct uml_pt_regs *regs, void *ptr)
+{
+	mcontext_t *mc = (mcontext_t *) ptr;
+
+	/* hook syscall via SIGSYS */
+	set_mc_sigsys_hook(mc);
+}
diff --git a/arch/um/os-Linux/Makefile b/arch/um/os-Linux/Makefile
index c048fc838068..432476a4239a 100644
--- a/arch/um/os-Linux/Makefile
+++ b/arch/um/os-Linux/Makefile
@@ -21,4 +21,9 @@ USER_OBJS := $(user-objs-y) elf_aux.o execvp.o file.o helper.o irq.o \
 	main.o mem.o process.o registers.o sigio.o signal.o start_up.o time.o \
 	tty.o umid.o util.o
 
+ifneq ($(CONFIG_MMU),y)
+obj-y += seccomp.o
+USER_OBJS += seccomp.o
+endif
+
 include $(srctree)/arch/um/scripts/Makefile.rules
diff --git a/arch/um/os-Linux/seccomp.c b/arch/um/os-Linux/seccomp.c
new file mode 100644
index 000000000000..d1cfa6e3d632
--- /dev/null
+++ b/arch/um/os-Linux/seccomp.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <signal.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>   /* For SYS_xxx definitions */
+#include <init.h>
+#include <as-layout.h>
+#include <os.h>
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+
+int __init os_setup_seccomp(void)
+{
+	int err;
+	unsigned long __userspace_start = uml_reserved,
+		__userspace_end = high_physmem;
+
+	struct sock_filter filter[] = {
+		/* if (IP_high > __userspace_end) allow; */
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer) + 4),
+		BPF_JUMP(BPF_JMP + BPF_JGT + BPF_K, __userspace_end >> 32,
+			 /*true-skip=*/0, /*false-skip=*/1),
+		BPF_STMT(BPF_RET + BPF_K, SECCOMP_RET_ALLOW),
+
+		/* if (IP_high == __userspace_end && IP_low >= __userspace_end) allow; */
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer) + 4),
+		BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, __userspace_end >> 32,
+			 /*true-skip=*/0, /*false-skip=*/3),
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer)),
+		BPF_JUMP(BPF_JMP + BPF_JGE + BPF_K, __userspace_end,
+			 /*true-skip=*/0, /*false-skip=*/1),
+		BPF_STMT(BPF_RET + BPF_K, SECCOMP_RET_ALLOW),
+
+		/* if (IP_high < __userspace_start) allow; */
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer) + 4),
+		BPF_JUMP(BPF_JMP + BPF_JGE + BPF_K, __userspace_start >> 32,
+			 /*true-skip=*/1, /*false-skip=*/0),
+		BPF_STMT(BPF_RET + BPF_K, SECCOMP_RET_ALLOW),
+
+		/* if (IP_high == __userspace_start && IP_low < __userspace_start) allow; */
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer) + 4),
+		BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, __userspace_start >> 32,
+			 /*true-skip=*/0, /*false-skip=*/3),
+		BPF_STMT(BPF_LD + BPF_W + BPF_ABS,
+			 offsetof(struct seccomp_data, instruction_pointer)),
+		BPF_JUMP(BPF_JMP + BPF_JGE + BPF_K, __userspace_start,
+			 /*true-skip=*/1, /*false-skip=*/0),
+		BPF_STMT(BPF_RET + BPF_K, SECCOMP_RET_ALLOW),
+
+		/* other address; trap  */
+		BPF_STMT(BPF_RET + BPF_K, SECCOMP_RET_TRAP),
+	};
+	struct sock_fprog prog = {
+		.len = ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	err = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	if (err)
+		os_warn("PR_SET_NO_NEW_PRIVS (err=%d, ernro=%d)\n",
+		       err, errno);
+
+	err = syscall(SYS_seccomp, SECCOMP_SET_MODE_FILTER,
+		      SECCOMP_FILTER_FLAG_TSYNC, &prog);
+	if (err) {
+		os_warn("SECCOMP_SET_MODE_FILTER (err=%d, ernro=%d)\n",
+		       err, errno);
+		exit(1);
+	}
+
+	set_handler(SIGSYS);
+
+	os_info("seccomp: setup filter syscalls in the range: 0x%lx-0x%lx\n",
+		__userspace_start, __userspace_end);
+
+	return 0;
+}
+
diff --git a/arch/um/os-Linux/signal.c b/arch/um/os-Linux/signal.c
index 11f07f498270..53e276e81b37 100644
--- a/arch/um/os-Linux/signal.c
+++ b/arch/um/os-Linux/signal.c
@@ -20,6 +20,7 @@
 #include <um_malloc.h>
 #include <sys/ucontext.h>
 #include <timetravel.h>
+#include <linux/compiler_attributes.h>
 
 void (*sig_info[NSIG])(int, struct siginfo *, struct uml_pt_regs *, void *mc) = {
 	[SIGTRAP]	= relay_signal,
@@ -30,6 +31,7 @@ void (*sig_info[NSIG])(int, struct siginfo *, struct uml_pt_regs *, void *mc) =
 	[SIGSEGV]	= segv_handler,
 	[SIGIO]		= sigio_handler,
 	[SIGCHLD]	= sigchld_handler,
+	[SIGSYS]	= sigsys_handler,
 };
 
 static void sig_handler_common(int sig, struct siginfo *si, mcontext_t *mc)
@@ -176,6 +178,11 @@ static void sigusr1_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
 	uml_pm_wake();
 }
 
+__weak void sigsys_handler(int sig, struct siginfo *unused_si,
+			   struct uml_pt_regs *regs, void *mc)
+{
+}
+
 void register_pm_wake_signal(void)
 {
 	set_handler(SIGUSR1);
@@ -187,6 +194,7 @@ static void (*handlers[_NSIG])(int sig, struct siginfo *si, mcontext_t *mc) = {
 	[SIGILL] = sig_handler,
 	[SIGFPE] = sig_handler,
 	[SIGTRAP] = sig_handler,
+	[SIGSYS] = sig_handler,
 
 	[SIGIO] = sig_handler,
 	[SIGWINCH] = sig_handler,
diff --git a/arch/um/os-Linux/start_up.c b/arch/um/os-Linux/start_up.c
index a827c2e01aa5..4e1f05360c49 100644
--- a/arch/um/os-Linux/start_up.c
+++ b/arch/um/os-Linux/start_up.c
@@ -238,7 +238,7 @@ extern unsigned long *exec_fp_regs;
 
 __initdata static struct stub_data *seccomp_test_stub_data;
 
-static void __init sigsys_handler(int sig, siginfo_t *info, void *p)
+static void __init _sigsys_handler(int sig, siginfo_t *info, void *p)
 {
 	ucontext_t *uc = p;
 
@@ -273,7 +273,7 @@ static int __init seccomp_helper(void *data)
 			sizeof(seccomp_test_stub_data->sigstack));
 
 	sa.sa_flags = SA_ONSTACK | SA_NODEFER | SA_SIGINFO;
-	sa.sa_sigaction = (void *) sigsys_handler;
+	sa.sa_sigaction = (void *) _sigsys_handler;
 	sa.sa_restorer = NULL;
 	if (sigaction(SIGSYS, &sa, NULL) < 0)
 		exit(2);
diff --git a/arch/x86/um/nommu/Makefile b/arch/x86/um/nommu/Makefile
index d72c63afffa5..ebe47d4836f4 100644
--- a/arch/x86/um/nommu/Makefile
+++ b/arch/x86/um/nommu/Makefile
@@ -5,4 +5,4 @@ else
 	BITS := 64
 endif
 
-obj-y = do_syscall_$(BITS).o entry_$(BITS).o
+obj-y = do_syscall_$(BITS).o entry_$(BITS).o os-Linux/
diff --git a/arch/x86/um/nommu/os-Linux/Makefile b/arch/x86/um/nommu/os-Linux/Makefile
new file mode 100644
index 000000000000..4571e403a6ff
--- /dev/null
+++ b/arch/x86/um/nommu/os-Linux/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y = mcontext.o
+USER_OBJS := mcontext.o
+
+include $(srctree)/arch/um/scripts/Makefile.rules
diff --git a/arch/x86/um/nommu/os-Linux/mcontext.c b/arch/x86/um/nommu/os-Linux/mcontext.c
new file mode 100644
index 000000000000..c4ef877d5ea0
--- /dev/null
+++ b/arch/x86/um/nommu/os-Linux/mcontext.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <sys/ucontext.h>
+#define __FRAME_OFFSETS
+#include <asm/ptrace.h>
+#include <sysdep/ptrace.h>
+#include <sysdep/mcontext.h>
+#include <sysdep/syscalls.h>
+
+void set_mc_sigsys_hook(mcontext_t *mc)
+{
+	mc->gregs[REG_RCX] = mc->gregs[REG_RIP];
+	mc->gregs[REG_RIP] = (unsigned long) __kernel_vsyscall;
+}
diff --git a/arch/x86/um/shared/sysdep/mcontext.h b/arch/x86/um/shared/sysdep/mcontext.h
index 6fe490cc5b98..9a0d6087f357 100644
--- a/arch/x86/um/shared/sysdep/mcontext.h
+++ b/arch/x86/um/shared/sysdep/mcontext.h
@@ -17,6 +17,10 @@ extern int get_stub_state(struct uml_pt_regs *regs, struct stub_data *data,
 extern int set_stub_state(struct uml_pt_regs *regs, struct stub_data *data,
 			  int single_stepping);
 
+#ifndef CONFIG_MMU
+extern void set_mc_sigsys_hook(mcontext_t *mc);
+#endif
+
 #ifdef __i386__
 
 #define GET_FAULTINFO_FROM_MC(fi, mc) \
-- 
2.43.0

