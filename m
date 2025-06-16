Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FEB18DB01
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036133; cv=none; b=jfYvxqVZ6eKIvSlutRM/zxwvNzL8v5YSjam0alCkavQsCM9rmOyAhNN2+krlIcFPJtuFC/ra692iMoFIDyCH2bkdBKQlTAd6L0mgTN4gT29p6opeqCGJMHrrD6ndwY3bw3w/6SPRSvUnqp+/7kwY5n16zjI8NtCrsWqaQfCu00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036133; c=relaxed/simple;
	bh=xPkpImzhx1jRra9PFkx7m1hA215DTG/U0AmmeWZrI5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFPKDoZW5MY6S/vHbgb/xQ1OBioKDrceUzAqNxC3GoMLUHD2CBhEoWgM6XdQ3lCQifBf+JYqYHylw1IuZO65Q72P/0nc6jE2NML+DwtqdJFINrfDwBIIRDXT+fXvV07IgtnIcCqVQpHsvhL/zJHWnt3INMw2Is1341Yhat4wd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PHSK/D5q; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PHSK/D5q"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036122; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=l9D6CkJA8XX+bAui6HLlqouzyt9/aXPsK5IASOTxZyU=;
	b=PHSK/D5qrKX89yOmM7SKak0Alp7434ZsY2w56X6fdsAxt2zwDcb7uYtt+3o266e3mDgDb7gE6VIdH8FdXHxhkevMI3fdg0uTpvAFSaXqA9f7jP8vtKuHT3nCqaLas/MsLoT80bIZdRzwOMubA35uUAxQjD8sgaANCT8k4lGeAzY=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wdr3n8c_1750036121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 09:08:42 +0800
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
Subject: [PATCH V2 2/5] panic: generalize panic_print's function to show sys info
Date: Mon, 16 Jun 2025 09:08:37 +0800
Message-Id: <20250616010840.38258-3-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'panic_print' was introduced to help debugging kernel panic by dumping
different kinds of system information like tasks' call stack, memory,
ftrace buffer, etc. Acutually this function could also help debugging
cases like task-hung, soft/hard lockup, and other cases , where user
may need the snapshot of system info at that time.

Extract sys_show_info() function out of panic code to be used by other
kernel parts for debugging.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 include/linux/kernel.h   |  1 +
 include/linux/sys_info.h | 20 ++++++++++++++++++++
 kernel/panic.c           | 35 +++--------------------------------
 lib/Makefile             |  2 +-
 lib/sys_info.c           | 30 ++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/sys_info.h
 create mode 100644 lib/sys_info.c

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 1cce1f6410a9..4788c0e4a8bd 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -27,6 +27,7 @@
 #include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/typecheck.h>
+#include <linux/sys_info.h>
 #include <linux/panic.h>
 #include <linux/printk.h>
 #include <linux/build_bug.h>
diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
new file mode 100644
index 000000000000..79bf4a942e5f
--- /dev/null
+++ b/include/linux/sys_info.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SYS_INFO_H
+#define _LINUX_SYS_INFO_H
+
+/*
+ * SYS_SHOW_ALL_PRINTK_MSG is for panic case only, as it needs special
+ * handling which only fits panic case.
+ */
+#define SYS_SHOW_TASK_INFO		0x00000001
+#define SYS_SHOW_MEM_INFO		0x00000002
+#define SYS_SHOW_TIMER_INFO		0x00000004
+#define SYS_SHOW_LOCK_INFO		0x00000008
+#define SYS_SHOW_FTRACE_INFO		0x00000010
+#define SYS_SHOW_ALL_PRINTK_MSG		0x00000020
+#define SYS_SHOW_ALL_CPU_BT		0x00000040
+#define SYS_SHOW_BLOCKED_TASKS		0x00000080
+
+extern void sys_show_info(unsigned long info_mask);
+
+#endif	/* _LINUX_SYS_INFO_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index af0d5206a624..35c98aefa39f 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -69,14 +69,6 @@ bool panic_triggering_all_cpu_backtrace;
 int panic_timeout = CONFIG_PANIC_TIMEOUT;
 EXPORT_SYMBOL_GPL(panic_timeout);
 
-#define PANIC_PRINT_TASK_INFO		0x00000001
-#define PANIC_PRINT_MEM_INFO		0x00000002
-#define PANIC_PRINT_TIMER_INFO		0x00000004
-#define PANIC_PRINT_LOCK_INFO		0x00000008
-#define PANIC_PRINT_FTRACE_INFO		0x00000010
-#define PANIC_PRINT_ALL_PRINTK_MSG	0x00000020
-#define PANIC_PRINT_ALL_CPU_BT		0x00000040
-#define PANIC_PRINT_BLOCKED_TASKS	0x00000080
 unsigned long panic_print;
 
 ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
@@ -240,31 +232,10 @@ EXPORT_SYMBOL(nmi_panic);
 
 static void panic_console_replay(void)
 {
-	if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
+	if (panic_print & SYS_SHOW_ALL_PRINTK_MSG)
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
@@ -285,7 +256,7 @@ void check_panic_on_warn(const char *origin)
  */
 static void panic_other_cpus_shutdown(bool crash_kexec)
 {
-	if (panic_print & PANIC_PRINT_ALL_CPU_BT) {
+	if (panic_print & SYS_SHOW_ALL_CPU_BT) {
 		/* Temporary allow non-panic CPUs to write their backtraces. */
 		panic_triggering_all_cpu_backtrace = true;
 		trigger_all_cpu_backtrace();
@@ -410,7 +381,7 @@ void panic(const char *fmt, ...)
 	 */
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
 
-	panic_print_sys_info();
+	sys_show_info(panic_print);
 
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
index 000000000000..90a79b5164c9
--- /dev/null
+++ b/lib/sys_info.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/sched/debug.h>
+#include <linux/kernel.h>
+#include <linux/ftrace.h>
+#include <linux/console.h>
+#include <linux/nmi.h>
+
+void sys_show_info(unsigned long info_flag)
+{
+	if (info_flag & SYS_SHOW_TASK_INFO)
+		show_state();
+
+	if (info_flag & SYS_SHOW_MEM_INFO)
+		show_mem();
+
+	if (info_flag & SYS_SHOW_TIMER_INFO)
+		sysrq_timer_list_show();
+
+	if (info_flag & SYS_SHOW_LOCK_INFO)
+		debug_show_all_locks();
+
+	if (info_flag & SYS_SHOW_FTRACE_INFO)
+		ftrace_dump(DUMP_ALL);
+
+	if (info_flag & SYS_SHOW_ALL_CPU_BT)
+		trigger_all_cpu_backtrace();
+
+	if (info_flag & SYS_SHOW_BLOCKED_TASKS)
+		show_state_filter(TASK_UNINTERRUPTIBLE);
+}
-- 
2.39.5 (Apple Git-154)

