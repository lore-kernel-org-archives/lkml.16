Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6981AA1DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508619; cv=none; b=BFrv2FTbPnvyjvKH6wGN/DyoeHAqSdHqvcYo6ua07d8A0Eii1YkjtjtOB5M91J0mBoSy2UyX8r+wj64WOnfj5cUe7l/MaI9C4Mga7zm079DLHEmZAFFM42v6soHsLTm2biGMlZp6P1dE9BgeXz6T91XwxXoR4FQwdK9hPRok+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508619; c=relaxed/simple;
	bh=i+ziQx0pFG5A9c4/LCh4XtC+9feRIAyIrN3K8zaQ9aI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iwe8Z1dJic7lVhkihNbdFD5Nn7TTusAHmm+MrmTpPPWoLN3gOEBVpGgnzCKEmoW6Y935ZLxdwd62Zn3Gn/OXIU/6dgwYodQfm2ibE63t7sb53RTBKvizhAZUDOp8Lv99Rt87O754v4sZoF3mQT81R/t3edaa3rRzkzydIChXyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oLbdpj7+; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oLbdpj7+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508607; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=LpcRBrGxYBHD+m9doP1TXKIrI6hUfSgRBLsw1Ps2UbY=;
	b=oLbdpj7+ObOoxZMBBs/PrXjsBAlhZah6vOrd8++qb2UsjM72C/N43FMzthSdySPr/3Zl9pD0usVWKKnEhRHy2u6x0fm0+FxMPVUB83C9H9u0Q3KSQhE0j8ELP5a+xMsRiN6oL7FRs7k3+Sk6hSKsYF4sD8Rk6chIp53Jm6KugIM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqQirJ_1751508606 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 10:10:07 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Cc: paulmck@kernel.org,
	john.ogness@linutronix.de,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v3 2/5] panic: generalize panic_print's function to show sys info
Date: Thu,  3 Jul 2025 10:10:01 +0800
Message-Id: <20250703021004.42328-3-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
References: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'panic_print' was introduced to help debugging kernel panic by dumping
different kinds of system information like tasks' call stack, memory,
ftrace buffer, etc. Actually this function could also be used to help
debugging other cases like task-hung, soft/hard lockup, etc. where user
may need the snapshot of system info at that time.

Extract system info dump function related code from panic.c to separate
file sys_info.[ch], for wider usage by other kernel parts for debugging.

Also modify the macro names about singulars/plurals.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 include/linux/sys_info.h | 20 ++++++++++++++++++++
 kernel/panic.c           | 36 ++++--------------------------------
 lib/Makefile             |  2 +-
 lib/sys_info.c           | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/sys_info.h
 create mode 100644 lib/sys_info.c

diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
new file mode 100644
index 000000000000..53b7e27dbf2a
--- /dev/null
+++ b/include/linux/sys_info.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SYS_INFO_H
+#define _LINUX_SYS_INFO_H
+
+/*
+ * SYS_INFO_PANIC_CONSOLE_REPLAY is for panic case only, as it needs special
+ * handling which only fits panic case.
+ */
+#define SYS_INFO_TASKS			0x00000001
+#define SYS_INFO_MEM			0x00000002
+#define SYS_INFO_TIMERS			0x00000004
+#define SYS_INFO_LOCKS			0x00000008
+#define SYS_INFO_FTRACE			0x00000010
+#define SYS_INFO_PANIC_CONSOLE_REPLAY	0x00000020
+#define SYS_INFO_ALL_CPU_BT		0x00000040
+#define SYS_INFO_BLOCKED_TASKS		0x00000080
+
+void sys_info(unsigned long si_mask);
+
+#endif	/* _LINUX_SYS_INFO_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index 9b6c5dc28a65..cbb0681177b3 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -36,6 +36,7 @@
 #include <linux/sysfs.h>
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
+#include <linux/sys_info.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -69,14 +70,6 @@ bool panic_triggering_all_cpu_backtrace;
 int panic_timeout = CONFIG_PANIC_TIMEOUT;
 EXPORT_SYMBOL_GPL(panic_timeout);
 
-#define PANIC_PRINT_TASK_INFO		0x00000001
-#define PANIC_PRINT_MEM_INFO		0x00000002
-#define PANIC_PRINT_TIMER_INFO		0x00000004
-#define PANIC_PRINT_LOCK_INFO		0x00000008
-#define PANIC_PRINT_FTRACE_INFO		0x00000010
-#define PANIC_CONSOLE_REPLAY		0x00000020
-#define PANIC_PRINT_ALL_CPU_BT		0x00000040
-#define PANIC_PRINT_BLOCKED_TASKS	0x00000080
 unsigned long panic_print;
 
 ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
@@ -240,31 +233,10 @@ EXPORT_SYMBOL(nmi_panic);
 
 static void panic_console_replay(void)
 {
-	if (panic_print & PANIC_CONSOLE_REPLAY)
+	if (panic_print & SYS_INFO_PANIC_CONSOLE_REPLAY)
 		console_flush_on_panic(CONSOLE_REPLAY_ALL);
 }
 
-static void panic_print_sys_info(void)
-{
-	if (panic_print & PANIC_PRINT_TASK_INFO)
-		show_state();
-
-	if (panic_print & PANIC_PRINT_MEM_INFO)
-		show_mem();
-
-	if (panic_print & PANIC_PRINT_TIMER_INFO)
-		sysrq_timer_list_show();
-
-	if (panic_print & PANIC_PRINT_LOCK_INFO)
-		debug_show_all_locks();
-
-	if (panic_print & PANIC_PRINT_FTRACE_INFO)
-		ftrace_dump(DUMP_ALL);
-
-	if (panic_print & PANIC_PRINT_BLOCKED_TASKS)
-		show_state_filter(TASK_UNINTERRUPTIBLE);
-}
-
 void check_panic_on_warn(const char *origin)
 {
 	unsigned int limit;
@@ -285,7 +257,7 @@ void check_panic_on_warn(const char *origin)
  */
 static void panic_other_cpus_shutdown(bool crash_kexec)
 {
-	if (panic_print & PANIC_PRINT_ALL_CPU_BT) {
+	if (panic_print & SYS_INFO_ALL_CPU_BT) {
 		/* Temporary allow non-panic CPUs to write their backtraces. */
 		panic_triggering_all_cpu_backtrace = true;
 		trigger_all_cpu_backtrace();
@@ -410,7 +382,7 @@ void panic(const char *fmt, ...)
 	 */
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
 
-	panic_print_sys_info();
+	sys_info(panic_print);
 
 	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
diff --git a/lib/Makefile b/lib/Makefile
index c38582f187dd..88d6228089a8 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -40,7 +40,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
 	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
 	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
 	 nmi_backtrace.o win_minmax.o memcat_p.o \
-	 buildid.o objpool.o iomem_copy.o
+	 buildid.o objpool.o iomem_copy.o sys_info.o
 
 lib-$(CONFIG_UNION_FIND) += union_find.o
 lib-$(CONFIG_PRINTK) += dump_stack.o
diff --git a/lib/sys_info.c b/lib/sys_info.c
new file mode 100644
index 000000000000..53031e5cb98e
--- /dev/null
+++ b/lib/sys_info.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/sched/debug.h>
+#include <linux/console.h>
+#include <linux/kernel.h>
+#include <linux/ftrace.h>
+#include <linux/nmi.h>
+
+#include <linux/sys_info.h>
+
+void sys_info(unsigned long si_mask)
+{
+	if (si_mask & SYS_INFO_TASKS)
+		show_state();
+
+	if (si_mask & SYS_INFO_MEM)
+		show_mem();
+
+	if (si_mask & SYS_INFO_TIMERS)
+		sysrq_timer_list_show();
+
+	if (si_mask & SYS_INFO_LOCKS)
+		debug_show_all_locks();
+
+	if (si_mask & SYS_INFO_FTRACE)
+		ftrace_dump(DUMP_ALL);
+
+	if (si_mask & SYS_INFO_ALL_CPU_BT)
+		trigger_all_cpu_backtrace();
+
+	if (si_mask & SYS_INFO_BLOCKED_TASKS)
+		show_state_filter(TASK_UNINTERRUPTIBLE);
+}
-- 
2.43.5

