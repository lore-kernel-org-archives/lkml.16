Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25F1DED63
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987282; cv=none; b=oUyaR7rspZ8imQ+w8/Ig0DG85F0pPQFdLtGqO5+7fWAzVHMNkjQKPP/+ZuLECqd24jDxp1e/+5LD3TNY5Mbtomh85qsVvbCMO2iu9vb6Qt2/gOypHvDghYJP5d0pMPkdpJW3CxsGcLcd05pJ/DJKay34ddjMxiYzN5M50qH9aHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987282; c=relaxed/simple;
	bh=tvWwcvdelH2ZCwaXkDs3RnjvaPgYvNWnZZNy0rariak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ou9CzPegc3vKpt0MlpzFA9pjFsRnrnwgxlvXeuLRr3SI58vk1v9R62Xngvsum08bfexGNRrSewBEQYvwLYRZlqWsax64UITTQnNEbtyLOujuEBvDq0QUEyVMTnE3EhEWNk3jI2IgWsus/wFpaphkMyB0RM08uqO8JybHg2sEkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akLGP+LQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akLGP+LQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73972a54919so5776414b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987280; x=1746592080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mp6eKKbWpiSHyJXYBVOlGqFhgugHf5gGjyOnElsYIQ8=;
        b=akLGP+LQ0exlj7HT2y9S7bN69kEpqDizlIjo5yrJAm9Sf7aPBD+bTpFpfxSsjcT9hQ
         DSkBcgcZ1dTAyUnVXAkdLyBCVwagO6Qlv7QKU6LVE6wlEZZ+mSfQEcFJPbyjdHn21vEK
         W17H/MVPW6nmKKFbg1cViw6junG6fz27P84W3bPeNblwkockf+zTfos+zzocTyGqQfOB
         0ZcKGqb0KXPNYQPfn63j1MwLQQdLUjQreX6nQH90AH5oC39M0oHC/gsup6rP3VFW9aoR
         wYicSczv3RIzUrx+srXk4lTu3R+cl4W14ueHRlYthAFaMO/W37iF9XkjrxFfWNkEGosE
         j25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987280; x=1746592080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mp6eKKbWpiSHyJXYBVOlGqFhgugHf5gGjyOnElsYIQ8=;
        b=tTeKxO9JUW1QRuW6TXotQUkFZhmdtM/ZlSLj04LkSod7OOfvTW91lJcB4N8AOAT6qR
         ea9FaKYRsGvl56BnJAR4fXoWyYur+LZEKdvayCmYrhoyekjyKQ6LeFBlFD9mY3pxLpaq
         HCMOrQH1On3O2PIn/UfwjtNNzvQOQE4z7Ur6ChcrWB6YCLQHcpr31QDY26weTX8GcOEu
         UAOypX/tvMy1LKEPgFyhtJxSJbHlAaHqzgUXMxd4ZV5+X3JbQdvDrEZZN98zW10hSXih
         RVyrRw5xI0YnDgIMd2vEpk2FmORUJHeOw6tgOwCbBXmt9G7EfWz1cuHqIg/gX+O8g+Ro
         +3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHWh9DrH4oheuY74iXTBxk7LdY1XcbjuLNkw2CE2NE/aIUa2ANxDP5nXLdn5ytsFKSCSGCYJSKyc+0Ewo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8M/yW54Av6A7xKOWKuYwXfBeW7nPxRBYEKGMPXoWD8/AaA6lF
	SCkHk9vYmkcI6iPtDARU55OqYu8cZwGMIODiTyEhrB3BuMiKQEUB
X-Gm-Gg: ASbGnctm9Ejj881J8L0XleBqEYYJLmsWGTTbVJakd3NaX0nXBvVVejlfDiNwTsRH5Rs
	9qjLE2oiX55ZYanSs3g9+6a8uyuUQ/EjrkLYW2zyd+BOyTYvOuj8A/7Mx/aqsSMSAeGvBvwLc/F
	NZ4Pq5NLAPJmLkwYX/YargVoSrrmwTmHY74XFuk4fmTD0hTkTTNYphRsRiTizpbNPncuFIjPRbx
	uRaN/6hqO1fB/sjRyhxb5so+uLUvWSpKBdmLiOqcrWc35+DT0huO6Mo0mI6vLgwX5w1Ru5gz0TG
	JoZyQ6ZwYZSLR2w+pVGljmN/U8LhE3E786AXMh4rX1n9se2yj6NeA8yPbdRGJp1g0QUGfzcijtx
	cTBb5dG1IAAQ=
X-Google-Smtp-Source: AGHT+IFs9TraF1kR6FW5u1Q5u6Tmlb0LDMb+CsM3q0Udn9dfC/0UdzNr3zkLiVA4e0ssPjXNHc5cNA==
X-Received: by 2002:a05:6a20:d046:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-20a87d4eb30mr2154035637.24.1745987280011;
        Tue, 29 Apr 2025 21:28:00 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1b7efab4a5sm6348034a12.19.2025.04.29.21.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:59 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 98529E94824; Wed, 30 Apr 2025 13:27:57 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/12] x86/um: nommu: signal handling
Date: Wed, 30 Apr 2025 13:27:15 +0900
Message-ID: <ca8b6d4da1d7028731d88fa8b8fd9c98c4fbebd2.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit updates the behavior of signal handling under !MMU
environment. It adds the alignment code for signal frame as the frame
is used in userspace as-is.

floating point register is carefully handling upon entry/leave of
syscall routine so that signal handlers can read/write the contents of
the register.

It also adds the follow up routine for SIGSEGV as a signal delivery runs
in the same stack frame while we have to avoid endless SIGSEGV.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 arch/um/include/shared/kern_util.h    |   4 +
 arch/um/nommu/Makefile                |   2 +-
 arch/um/nommu/os-Linux/signal.c       |  13 ++
 arch/um/nommu/trap.c                  | 194 ++++++++++++++++++++++++++
 arch/x86/um/nommu/do_syscall_64.c     |   6 +
 arch/x86/um/nommu/os-Linux/mcontext.c |  11 ++
 arch/x86/um/shared/sysdep/mcontext.h  |   1 +
 arch/x86/um/shared/sysdep/ptrace.h    |   2 +-
 8 files changed, 231 insertions(+), 2 deletions(-)
 create mode 100644 arch/um/nommu/trap.c

diff --git a/arch/um/include/shared/kern_util.h b/arch/um/include/shared/kern_util.h
index 2c8c18bd5860..85a4f154423b 100644
--- a/arch/um/include/shared/kern_util.h
+++ b/arch/um/include/shared/kern_util.h
@@ -73,4 +73,8 @@ void um_idle_sleep(void);
 
 void kasan_map_memory(void *start, size_t len);
 
+#ifndef CONFIG_MMU
+extern void arch_sigsegv_handler(int sig, struct siginfo *si, void *mc);
+#endif
+
 #endif
diff --git a/arch/um/nommu/Makefile b/arch/um/nommu/Makefile
index baab7c2f57c2..096221590cfd 100644
--- a/arch/um/nommu/Makefile
+++ b/arch/um/nommu/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y := os-Linux/
+obj-y := trap.o os-Linux/
diff --git a/arch/um/nommu/os-Linux/signal.c b/arch/um/nommu/os-Linux/signal.c
index 19043b9652e2..b2cd0470b67c 100644
--- a/arch/um/nommu/os-Linux/signal.c
+++ b/arch/um/nommu/os-Linux/signal.c
@@ -5,6 +5,7 @@
 #include <os.h>
 #include <sysdep/mcontext.h>
 #include <sys/ucontext.h>
+#include <as-layout.h>
 
 void sigsys_handler(int sig, struct siginfo *si,
 		    struct uml_pt_regs *regs, void *ptr)
@@ -14,3 +15,15 @@ void sigsys_handler(int sig, struct siginfo *si,
 	/* hook syscall via SIGSYS */
 	set_mc_sigsys_hook(mc);
 }
+
+void arch_sigsegv_handler(int sig, struct siginfo *si, void *ptr)
+{
+	mcontext_t *mc = (mcontext_t *) ptr;
+
+	/* !MMU specific part; detection of userspace */
+	if (mc->gregs[REG_RIP] > uml_reserved &&
+	    mc->gregs[REG_RIP] < high_physmem) {
+		/* !MMU: force handle signals after rt_sigreturn() */
+		set_mc_userspace_relay_signal(mc);
+	}
+}
diff --git a/arch/um/nommu/trap.c b/arch/um/nommu/trap.c
new file mode 100644
index 000000000000..2053a3b5071b
--- /dev/null
+++ b/arch/um/nommu/trap.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm.h>
+#include <linux/sched/signal.h>
+#include <linux/hardirq.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include <linux/sched/debug.h>
+#include <asm/current.h>
+#include <asm/tlbflush.h>
+#include <arch.h>
+#include <as-layout.h>
+#include <kern_util.h>
+#include <os.h>
+#include <skas.h>
+
+/*
+ * Note this is constrained to return 0, -EFAULT, -EACCES, -ENOMEM by
+ * segv().
+ */
+int handle_page_fault(unsigned long address, unsigned long ip,
+		      int is_write, int is_user, int *code_out)
+{
+	/* !MMU has no pagefault */
+	return -EFAULT;
+}
+
+static void show_segv_info(struct uml_pt_regs *regs)
+{
+	struct task_struct *tsk = current;
+	struct faultinfo *fi = UPT_FAULTINFO(regs);
+
+	if (!unhandled_signal(tsk, SIGSEGV))
+		return;
+
+	pr_warn_ratelimited("%s%s[%d]: segfault at %lx ip %p sp %p error %x",
+			    task_pid_nr(tsk) > 1 ? KERN_INFO : KERN_EMERG,
+			    tsk->comm, task_pid_nr(tsk), FAULT_ADDRESS(*fi),
+			    (void *)UPT_IP(regs), (void *)UPT_SP(regs),
+			    fi->error_code);
+}
+
+static void bad_segv(struct faultinfo fi, unsigned long ip)
+{
+	current->thread.arch.faultinfo = fi;
+	force_sig_fault(SIGSEGV, SEGV_ACCERR, (void __user *) FAULT_ADDRESS(fi));
+}
+
+void fatal_sigsegv(void)
+{
+	force_fatal_sig(SIGSEGV);
+	do_signal(&current->thread.regs);
+	/*
+	 * This is to tell gcc that we're not returning - do_signal
+	 * can, in general, return, but in this case, it's not, since
+	 * we just got a fatal SIGSEGV queued.
+	 */
+	os_dump_core();
+}
+
+/**
+ * segv_handler() - the SIGSEGV handler
+ * @sig:	the signal number
+ * @unused_si:	the signal info struct; unused in this handler
+ * @regs:	the ptrace register information
+ *
+ * The handler first extracts the faultinfo from the UML ptrace regs struct.
+ * If the userfault did not happen in an UML userspace process, bad_segv is called.
+ * Otherwise the signal did happen in a cloned userspace process, handle it.
+ */
+void segv_handler(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs,
+		  void *mc)
+{
+	struct faultinfo *fi = UPT_FAULTINFO(regs);
+
+	/* !MMU specific part; detection of userspace */
+	/* mark is_user=1 when the IP is from userspace code. */
+	if (UPT_IP(regs) > uml_reserved && UPT_IP(regs) < high_physmem)
+		regs->is_user = 1;
+
+	if (UPT_IS_USER(regs) && !SEGV_IS_FIXABLE(fi)) {
+		show_segv_info(regs);
+		bad_segv(*fi, UPT_IP(regs));
+		return;
+	}
+	segv(*fi, UPT_IP(regs), UPT_IS_USER(regs), regs, mc);
+
+	/* !MMU specific part; detection of userspace */
+	arch_sigsegv_handler(sig, unused_si, mc);
+}
+
+/*
+ * We give a *copy* of the faultinfo in the regs to segv.
+ * This must be done, since nesting SEGVs could overwrite
+ * the info in the regs. A pointer to the info then would
+ * give us bad data!
+ */
+unsigned long segv(struct faultinfo fi, unsigned long ip, int is_user,
+		   struct uml_pt_regs *regs, void *mc)
+{
+	int si_code;
+	int err;
+	int is_write = FAULT_WRITE(fi);
+	unsigned long address = FAULT_ADDRESS(fi);
+
+	if (!is_user && regs)
+		current->thread.segv_regs = container_of(regs, struct pt_regs, regs);
+
+	if (current->mm == NULL) {
+		show_regs(container_of(regs, struct pt_regs, regs));
+		panic("Segfault with no mm");
+	} else if (!is_user && address > PAGE_SIZE && address < TASK_SIZE) {
+		show_regs(container_of(regs, struct pt_regs, regs));
+		panic("Kernel tried to access user memory at addr 0x%lx, ip 0x%lx",
+		       address, ip);
+	}
+
+	if (SEGV_IS_FIXABLE(&fi))
+		err = handle_page_fault(address, ip, is_write, is_user,
+					&si_code);
+	else {
+		err = -EFAULT;
+		/*
+		 * A thread accessed NULL, we get a fault, but CR2 is invalid.
+		 * This code is used in __do_copy_from_user() of TT mode.
+		 * XXX tt mode is gone, so maybe this isn't needed any more
+		 */
+		address = 0;
+	}
+
+	if (!err)
+		goto out;
+	else if (!is_user && arch_fixup(ip, regs))
+		goto out;
+
+	if (!is_user) {
+		show_regs(container_of(regs, struct pt_regs, regs));
+		panic("Kernel mode fault at addr 0x%lx, ip 0x%lx",
+		      address, ip);
+	}
+
+	show_segv_info(regs);
+
+	if (err == -EACCES) {
+		current->thread.arch.faultinfo = fi;
+		force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)address);
+	} else {
+		WARN_ON_ONCE(err != -EFAULT);
+		current->thread.arch.faultinfo = fi;
+		force_sig_fault(SIGSEGV, si_code, (void __user *) address);
+	}
+
+out:
+	if (regs)
+		current->thread.segv_regs = NULL;
+
+	return 0;
+}
+
+void relay_signal(int sig, struct siginfo *si, struct uml_pt_regs *regs,
+		  void *mc)
+{
+	int code, err;
+
+	if (!UPT_IS_USER(regs)) {
+		if (sig == SIGBUS)
+			pr_err("Bus error - the host /dev/shm or /tmp mount likely just ran out of space\n");
+		panic("Kernel mode signal %d", sig);
+	}
+
+	arch_examine_signal(sig, regs);
+
+	/* Is the signal layout for the signal known?
+	 * Signal data must be scrubbed to prevent information leaks.
+	 */
+	code = si->si_code;
+	err = si->si_errno;
+	if ((err == 0) && (siginfo_layout(sig, code) == SIL_FAULT)) {
+		struct faultinfo *fi = UPT_FAULTINFO(regs);
+
+		current->thread.arch.faultinfo = *fi;
+		force_sig_fault(sig, code, (void __user *)FAULT_ADDRESS(*fi));
+	} else {
+		pr_err("Attempted to relay unknown signal %d (si_code = %d) with errno %d\n",
+		       sig, code, err);
+		force_sig(sig);
+	}
+}
+
+void winch(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs,
+	   void *mc)
+{
+	do_IRQ(WINCH_IRQ, regs);
+}
diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_syscall_64.c
index 796beb0089fc..48b3d29e2db1 100644
--- a/arch/x86/um/nommu/do_syscall_64.c
+++ b/arch/x86/um/nommu/do_syscall_64.c
@@ -48,6 +48,9 @@ __visible void do_syscall_64(struct pt_regs *regs)
 	/* set fs register to the original host one */
 	os_x86_arch_prctl(0, ARCH_SET_FS, (void *)host_fs);
 
+	/* save fp registers */
+	asm volatile("fxsaveq %0" : "=m"(*(struct _xstate *)regs->regs.fp));
+
 	if (likely(syscall < NR_syscalls)) {
 		PT_REGS_SET_SYSCALL_RETURN(regs,
 				EXECUTE_SYSCALL(syscall, regs));
@@ -66,6 +69,9 @@ __visible void do_syscall_64(struct pt_regs *regs)
 	set_thread_flag(TIF_SIGPENDING);
 	interrupt_end();
 
+	/* restore fp registers */
+	asm volatile("fxrstorq %0" : : "m"((current->thread.regs.regs.fp)));
+
 	/* restore back fs register to userspace configured one */
 	os_x86_arch_prctl(0, ARCH_SET_FS,
 		      (void *)(current->thread.regs.regs.gp[FS_BASE
diff --git a/arch/x86/um/nommu/os-Linux/mcontext.c b/arch/x86/um/nommu/os-Linux/mcontext.c
index c4ef877d5ea0..955e7d9f4765 100644
--- a/arch/x86/um/nommu/os-Linux/mcontext.c
+++ b/arch/x86/um/nommu/os-Linux/mcontext.c
@@ -6,6 +6,17 @@
 #include <sysdep/mcontext.h>
 #include <sysdep/syscalls.h>
 
+static void __userspace_relay_signal(void)
+{
+	/* XXX: dummy syscall */
+	__asm__ volatile("call *%0" : : "r"(__kernel_vsyscall), "a"(39) :);
+}
+
+void set_mc_userspace_relay_signal(mcontext_t *mc)
+{
+	mc->gregs[REG_RIP] = (unsigned long) __userspace_relay_signal;
+}
+
 void set_mc_sigsys_hook(mcontext_t *mc)
 {
 	mc->gregs[REG_RCX] = mc->gregs[REG_RIP];
diff --git a/arch/x86/um/shared/sysdep/mcontext.h b/arch/x86/um/shared/sysdep/mcontext.h
index 15e9ff287021..0efe5ddf95af 100644
--- a/arch/x86/um/shared/sysdep/mcontext.h
+++ b/arch/x86/um/shared/sysdep/mcontext.h
@@ -9,6 +9,7 @@
 extern void get_regs_from_mc(struct uml_pt_regs *, mcontext_t *);
 #ifndef CONFIG_MMU
 extern void set_mc_sigsys_hook(mcontext_t *mc);
+extern void set_mc_userspace_relay_signal(mcontext_t *mc);
 #endif
 
 #ifdef __i386__
diff --git a/arch/x86/um/shared/sysdep/ptrace.h b/arch/x86/um/shared/sysdep/ptrace.h
index 8f7476ff6e95..7d553d9f05be 100644
--- a/arch/x86/um/shared/sysdep/ptrace.h
+++ b/arch/x86/um/shared/sysdep/ptrace.h
@@ -65,7 +65,7 @@ struct uml_pt_regs {
 	int is_user;
 
 	/* Dynamically sized FP registers (holds an XSTATE) */
-	unsigned long fp[];
+	unsigned long fp[] __attribute__((aligned(16)));
 };
 
 #define EMPTY_UML_PT_REGS { }
-- 
2.43.0

