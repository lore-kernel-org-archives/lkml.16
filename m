Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F287C23AB8A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415856; cv=none; b=TjimS3SLEAIEtFt2rH6JBwgZhhxh87F3lqZRw4enQGBWFLe9Pf4Q4KKibP+9iKBPcCjik1lSlQZwxO194tYwF0P3913b6HEYTtqBX+OjJmAU//cjQWYbSHb8EBX4wEuvGXBxMHPObcofNZgDC9Z4d6PGOjWhBKa0kHo5LlOhqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415856; c=relaxed/simple;
	bh=AJhPoQfgBnZIPevgOsEDb/+kr7SrcNFqDlxlJGlGQs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qQ+P9VQxVMqG9IDChYepCWYyTlbKRYWzXOrUFE50VdDC7v2yfvdGxr9Xk+EJXPzwxSqvM4IZCu80h1XWwZX4QSfAD6Npb5wq3seBZh2j1YS7gvmxQjR4FeZ+B5qndr2mkwSM1H6rHgx0cbEWP0ihCJ1OxGM5QQeQwe6pva8ae2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KAbPqk010254;
	Fri, 20 Jun 2025 12:37:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH 1/3] tools/nolibc: merge i386 and x86_64 into a single x86 arch
Date: Fri, 20 Jun 2025 12:37:03 +0200
Message-Id: <20250620103705.10208-2-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620103705.10208-1-w@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This remained the only exception to the kernel's architectures
organization and it's always a bit cumbersome to deal with. Let's merge
i386 and x86_64 into x86. This will result in a single arch-x86.h file
by default, and we'll no longer need to merge the two manually during
installation. Requesting either i386 or x86_64 will also result in
installing x86.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile                 |  10 +-
 tools/include/nolibc/arch-i386.h              | 178 -----------------
 .../nolibc/{arch-x86_64.h => arch-x86.h}      | 180 +++++++++++++++++-
 tools/include/nolibc/arch.h                   |   6 +-
 4 files changed, 179 insertions(+), 195 deletions(-)
 delete mode 100644 tools/include/nolibc/arch-i386.h
 rename tools/include/nolibc/{arch-x86_64.h => arch-x86.h} (53%)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 823bfa08c6756..9197c79b267a4 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -93,18 +93,12 @@ help:
 	@echo "  OUTPUT  = $(OUTPUT)"
 	@echo ""
 
-# Note: when ARCH is "x86" we concatenate both x86_64 and i386
 headers:
 	$(Q)mkdir -p $(OUTPUT)sysroot
 	$(Q)mkdir -p $(OUTPUT)sysroot/include
 	$(Q)cp --parents $(all_files) $(OUTPUT)sysroot/include/
-	$(Q)if [ "$(ARCH)" = "x86" ]; then      \
-		sed -e                          \
-		  's,^#ifndef _NOLIBC_ARCH_X86_64_H,#if !defined(_NOLIBC_ARCH_X86_64_H) \&\& defined(__x86_64__),' \
-		  arch-x86_64.h;                \
-		sed -e                          \
-		  's,^#ifndef _NOLIBC_ARCH_I386_H,#if !defined(_NOLIBC_ARCH_I386_H) \&\& !defined(__x86_64__),' \
-		  arch-i386.h;                  \
+	$(Q)if [ "$(ARCH)" = "i386" -o "$(ARCH)" = "x86_64" ]; then \
+		cat arch-x86.h;                 \
 	elif [ -e "$(arch_file)" ]; then        \
 		cat $(arch_file);               \
 	else                                    \
diff --git a/tools/include/nolibc/arch-i386.h b/tools/include/nolibc/arch-i386.h
deleted file mode 100644
index 7c9b38e964183..0000000000000
--- a/tools/include/nolibc/arch-i386.h
+++ /dev/null
@@ -1,178 +0,0 @@
-/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
-/*
- * i386 specific definitions for NOLIBC
- * Copyright (C) 2017-2022 Willy Tarreau <w@1wt.eu>
- */
-
-#ifndef _NOLIBC_ARCH_I386_H
-#define _NOLIBC_ARCH_I386_H
-
-#include "compiler.h"
-#include "crt.h"
-
-/* Syscalls for i386 :
- *   - mostly similar to x86_64
- *   - registers are 32-bit
- *   - syscall number is passed in eax
- *   - arguments are in ebx, ecx, edx, esi, edi, ebp respectively
- *   - all registers are preserved (except eax of course)
- *   - the system call is performed by calling int $0x80
- *   - syscall return comes in eax
- *   - the arguments are cast to long and assigned into the target registers
- *     which are then simply passed as registers to the asm code, so that we
- *     don't have to experience issues with register constraints.
- *   - the syscall number is always specified last in order to allow to force
- *     some registers before (gcc refuses a %-register at the last position).
- *
- * Also, i386 supports the old_select syscall if newselect is not available
- */
-#define __ARCH_WANT_SYS_OLD_SELECT
-
-#define my_syscall0(num)                                                      \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall1(num, arg1)                                                \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "r"(_arg1),                                                 \
-		  "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall2(num, arg1, arg2)                                          \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
-	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "r"(_arg1), "r"(_arg2),                                     \
-		  "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall3(num, arg1, arg2, arg3)                                    \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
-	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
-	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "r"(_arg1), "r"(_arg2), "r"(_arg3),                         \
-		  "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall4(num, arg1, arg2, arg3, arg4)                              \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
-	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
-	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
-	register long _arg4 __asm__ ("esi") = (long)(arg4);                   \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4),             \
-		  "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)                        \
-({                                                                            \
-	long _ret;                                                            \
-	register long _num __asm__ ("eax") = (num);                           \
-	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
-	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
-	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
-	register long _arg4 __asm__ ("esi") = (long)(arg4);                   \
-	register long _arg5 __asm__ ("edi") = (long)(arg5);                   \
-									      \
-	__asm__ volatile (                                                    \
-		"int $0x80\n"                                                 \
-		: "=a" (_ret)                                                 \
-		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
-		  "0"(_num)                                                   \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_ret;                                                                 \
-})
-
-#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)	\
-({								\
-	long _eax  = (long)(num);				\
-	long _arg6 = (long)(arg6); /* Always in memory */	\
-	__asm__ volatile (					\
-		"pushl	%[_arg6]\n\t"				\
-		"pushl	%%ebp\n\t"				\
-		"movl	4(%%esp),%%ebp\n\t"			\
-		"int	$0x80\n\t"				\
-		"popl	%%ebp\n\t"				\
-		"addl	$4,%%esp\n\t"				\
-		: "+a"(_eax)		/* %eax */		\
-		: "b"(arg1),		/* %ebx */		\
-		  "c"(arg2),		/* %ecx */		\
-		  "d"(arg3),		/* %edx */		\
-		  "S"(arg4),		/* %esi */		\
-		  "D"(arg5),		/* %edi */		\
-		  [_arg6]"m"(_arg6)	/* memory */		\
-		: "memory", "cc"				\
-	);							\
-	_eax;							\
-})
-
-/* startup code */
-/*
- * i386 System V ABI mandates:
- * 1) last pushed argument must be 16-byte aligned.
- * 2) The deepest stack frame should be set to zero
- *
- */
-void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
-{
-	__asm__ volatile (
-		"xor  %ebp, %ebp\n"       /* zero the stack frame                                */
-		"mov  %esp, %eax\n"       /* save stack pointer to %eax, as arg1 of _start_c     */
-		"sub  $12, %esp\n"        /* sub 12 to keep it aligned after the push %eax       */
-		"push %eax\n"             /* push arg1 on stack to support plain stack modes too */
-		"call _start_c\n"         /* transfer to c runtime                               */
-		"hlt\n"                   /* ensure it does not return                           */
-	);
-	__nolibc_entrypoint_epilogue();
-}
-
-#endif /* _NOLIBC_ARCH_I386_H */
diff --git a/tools/include/nolibc/arch-x86_64.h b/tools/include/nolibc/arch-x86.h
similarity index 53%
rename from tools/include/nolibc/arch-x86_64.h
rename to tools/include/nolibc/arch-x86.h
index 67305e24dbefd..d3efc0c3b8adc 100644
--- a/tools/include/nolibc/arch-x86_64.h
+++ b/tools/include/nolibc/arch-x86.h
@@ -1,15 +1,184 @@
 /* SPDX-License-Identifier: LGPL-2.1 OR MIT */
 /*
- * x86_64 specific definitions for NOLIBC
- * Copyright (C) 2017-2022 Willy Tarreau <w@1wt.eu>
+ * x86 specific definitions for NOLIBC (both 32- and 64-bit)
+ * Copyright (C) 2017-2025 Willy Tarreau <w@1wt.eu>
  */
 
-#ifndef _NOLIBC_ARCH_X86_64_H
-#define _NOLIBC_ARCH_X86_64_H
+#ifndef _NOLIBC_ARCH_X86_H
+#define _NOLIBC_ARCH_X86_H
 
 #include "compiler.h"
 #include "crt.h"
 
+#if !defined(__x86_64__)
+
+/* Syscalls for i386 :
+ *   - mostly similar to x86_64
+ *   - registers are 32-bit
+ *   - syscall number is passed in eax
+ *   - arguments are in ebx, ecx, edx, esi, edi, ebp respectively
+ *   - all registers are preserved (except eax of course)
+ *   - the system call is performed by calling int $0x80
+ *   - syscall return comes in eax
+ *   - the arguments are cast to long and assigned into the target registers
+ *     which are then simply passed as registers to the asm code, so that we
+ *     don't have to experience issues with register constraints.
+ *   - the syscall number is always specified last in order to allow to force
+ *     some registers before (gcc refuses a %-register at the last position).
+ *
+ * Also, i386 supports the old_select syscall if newselect is not available
+ */
+#define __ARCH_WANT_SYS_OLD_SELECT
+
+#define my_syscall0(num)                                                      \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall1(num, arg1)                                                \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "r"(_arg1),                                                 \
+		  "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "r"(_arg1), "r"(_arg2),                                     \
+		  "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall3(num, arg1, arg2, arg3)                                    \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3),                         \
+		  "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall4(num, arg1, arg2, arg3, arg4)                              \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
+	register long _arg4 __asm__ ("esi") = (long)(arg4);                   \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4),             \
+		  "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)                        \
+({                                                                            \
+	long _ret;                                                            \
+	register long _num __asm__ ("eax") = (num);                           \
+	register long _arg1 __asm__ ("ebx") = (long)(arg1);                   \
+	register long _arg2 __asm__ ("ecx") = (long)(arg2);                   \
+	register long _arg3 __asm__ ("edx") = (long)(arg3);                   \
+	register long _arg4 __asm__ ("esi") = (long)(arg4);                   \
+	register long _arg5 __asm__ ("edi") = (long)(arg5);                   \
+									      \
+	__asm__ volatile (                                                    \
+		"int $0x80\n"                                                 \
+		: "=a" (_ret)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "0"(_num)                                                   \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)	\
+({								\
+	long _eax  = (long)(num);				\
+	long _arg6 = (long)(arg6); /* Always in memory */	\
+	__asm__ volatile (					\
+		"pushl	%[_arg6]\n\t"				\
+		"pushl	%%ebp\n\t"				\
+		"movl	4(%%esp),%%ebp\n\t"			\
+		"int	$0x80\n\t"				\
+		"popl	%%ebp\n\t"				\
+		"addl	$4,%%esp\n\t"				\
+		: "+a"(_eax)		/* %eax */		\
+		: "b"(arg1),		/* %ebx */		\
+		  "c"(arg2),		/* %ecx */		\
+		  "d"(arg3),		/* %edx */		\
+		  "S"(arg4),		/* %esi */		\
+		  "D"(arg5),		/* %edi */		\
+		  [_arg6]"m"(_arg6)	/* memory */		\
+		: "memory", "cc"				\
+	);							\
+	_eax;							\
+})
+
+/* startup code */
+/*
+ * i386 System V ABI mandates:
+ * 1) last pushed argument must be 16-byte aligned.
+ * 2) The deepest stack frame should be set to zero
+ *
+ */
+void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
+{
+	__asm__ volatile (
+		"xor  %ebp, %ebp\n"       /* zero the stack frame                                */
+		"mov  %esp, %eax\n"       /* save stack pointer to %eax, as arg1 of _start_c     */
+		"sub  $12, %esp\n"        /* sub 12 to keep it aligned after the push %eax       */
+		"push %eax\n"             /* push arg1 on stack to support plain stack modes too */
+		"call _start_c\n"         /* transfer to c runtime                               */
+		"hlt\n"                   /* ensure it does not return                           */
+	);
+	__nolibc_entrypoint_epilogue();
+}
+
+#else /* !defined(__x86_64__) */
+
 /* Syscalls for x86_64 :
  *   - registers are 64-bit
  *   - syscall number is passed in rax
@@ -214,4 +383,5 @@ __asm__ (
 	"retq\n"
 );
 
-#endif /* _NOLIBC_ARCH_X86_64_H */
+#endif /* !defined(__x86_64__) */
+#endif /* _NOLIBC_ARCH_X86_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index d20b2304aac21..4ae57aaf97796 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -15,10 +15,8 @@
 #ifndef _NOLIBC_ARCH_H
 #define _NOLIBC_ARCH_H
 
-#if defined(__x86_64__)
-#include "arch-x86_64.h"
-#elif defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
-#include "arch-i386.h"
+#if defined(__x86_64__) || defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
+#include "arch-x86.h"
 #elif defined(__ARM_EABI__)
 #include "arch-arm.h"
 #elif defined(__aarch64__)
-- 
2.17.5

