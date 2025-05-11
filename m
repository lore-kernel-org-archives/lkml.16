Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFF13774D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746953590; cv=none; b=FyHHW0LSLV7f84cVvATsZIYBoMyXkdlIrGMnz+XbyrRz1gzU/5wKdPJocJ3DAOHc7bBvTaNXK8jXplFmGb9giUeN1H7aGkNCIWLcrGnlDx0D/KlwFiNwIFow/mLClOmZ33kThbwYZFmRztyrtVIszVu44dy1eiwCidIT+tPXCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746953590; c=relaxed/simple;
	bh=pQMJWVRUMVyvz7B2ekqfQBMAivgPV7lC6XIAofMoIUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmuT16HyVW6EQ69CQL0Zmo4qZ6dr7zElpO7JU9BZYkSEoj/zuopWgDeTXQUhqWVnMeOJbOZBtjANhMPrPvfkXhBt1/lHx6SdKmeoygVNC/IhJWd3Fpz4oYPZL5JPN8BbUrBkPwqCysQC3pK+GhLWbFZAm+MmH0wdlUX/730MJ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=X/dLATPf; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="X/dLATPf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746953578; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3CD7z4IGopA0PcdO/426rEdhCuUyvCsxsp/UIYP1hKs=;
	b=X/dLATPfLsGdrYqawcopouSnV1JcsiILXvmVJ0uPzWJ+M/Cad8H8bPZ43gET6VuT2yv4n+vgllyYiv4v/7o0hkwzFTqA4x996grXfrhIa90mkE0HB2zgch1ZcrewVc9jqz5Vent8CfPjfoEwfLTrPsn7Yyi1G/eiW031qwkTe1I=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaABizR_1746953577 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 11 May 2025 16:52:58 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org
Cc: mhiramat@kernel.org,
	llong@redhat.com,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v1 1/3] kernel/panic: generalize panic_print's function to show sys info
Date: Sun, 11 May 2025 16:52:52 +0800
Message-Id: <20250511085254.61446-2-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panic_print was introduced to help debugging kernel panic by dumping
different kinds of system information like tasks' call stack, memory,
ftrace buffer etc. Acutually this function could help debugging cases
like task-hung, soft/hard lockup too, where user may need the snapshot
of system info at that time.

Extract sys_show_info() function out to be used by other kernel parts
for debugging.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 include/linux/panic.h | 11 ++++++++++
 kernel/panic.c        | 47 +++++++++++++++++++++++--------------------
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 2494d51707ef..bb1796b64381 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -16,6 +16,17 @@ extern void oops_enter(void);
 extern void oops_exit(void);
 extern bool oops_may_print(void);
 
+#define SYS_PRINT_TASK_INFO		0x00000001
+#define SYS_PRINT_MEM_INFO		0x00000002
+#define SYS_PRINT_TIMER_INFO		0x00000004
+#define SYS_PRINT_LOCK_INFO		0x00000008
+#define SYS_PRINT_FTRACE_INFO		0x00000010
+#define SYS_PRINT_ALL_PRINTK_MSG	0x00000020
+#define SYS_PRINT_ALL_CPU_BT		0x00000040
+#define SYS_PRINT_BLOCKED_TASKS		0x00000080
+
+extern void sys_show_info(unsigned long info_mask);
+
 extern bool panic_triggering_all_cpu_backtrace;
 extern int panic_timeout;
 extern unsigned long panic_print;
diff --git a/kernel/panic.c b/kernel/panic.c
index a3889f38153d..2542ae3702f9 100644
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
@@ -208,33 +200,44 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
 }
 EXPORT_SYMBOL(nmi_panic);
 
-static void panic_print_sys_info(bool console_flush)
+void sys_show_info(unsigned long info_mask)
 {
-	if (console_flush) {
-		if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
-			console_flush_on_panic(CONSOLE_REPLAY_ALL);
-		return;
-	}
-
-	if (panic_print & PANIC_PRINT_TASK_INFO)
+	if (info_mask & SYS_PRINT_TASK_INFO)
 		show_state();
 
-	if (panic_print & PANIC_PRINT_MEM_INFO)
+	if (info_mask & SYS_PRINT_MEM_INFO)
 		show_mem();
 
-	if (panic_print & PANIC_PRINT_TIMER_INFO)
+	if (info_mask & SYS_PRINT_TIMER_INFO)
 		sysrq_timer_list_show();
 
-	if (panic_print & PANIC_PRINT_LOCK_INFO)
+	if (info_mask & SYS_PRINT_LOCK_INFO)
 		debug_show_all_locks();
 
-	if (panic_print & PANIC_PRINT_FTRACE_INFO)
+	if (info_mask & SYS_PRINT_FTRACE_INFO)
 		ftrace_dump(DUMP_ALL);
 
-	if (panic_print & PANIC_PRINT_BLOCKED_TASKS)
+	if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
+		console_flush_on_panic(CONSOLE_REPLAY_ALL);
+
+	if (info_mask & SYS_PRINT_ALL_CPU_BT)
+		trigger_all_cpu_backtrace();
+
+	if (info_mask & SYS_PRINT_BLOCKED_TASKS)
 		show_state_filter(TASK_UNINTERRUPTIBLE);
 }
 
+static void panic_print_sys_info(bool console_flush)
+{
+	if (console_flush) {
+		if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
+			console_flush_on_panic(CONSOLE_REPLAY_ALL);
+		return;
+	}
+
+	sys_show_info(panic_print & ~SYS_PRINT_ALL_PRINTK_MSG);
+}
+
 void check_panic_on_warn(const char *origin)
 {
 	unsigned int limit;
@@ -255,7 +258,7 @@ void check_panic_on_warn(const char *origin)
  */
 static void panic_other_cpus_shutdown(bool crash_kexec)
 {
-	if (panic_print & PANIC_PRINT_ALL_CPU_BT) {
+	if (panic_print & SYS_PRINT_ALL_CPU_BT) {
 		/* Temporary allow non-panic CPUs to write their backtraces. */
 		panic_triggering_all_cpu_backtrace = true;
 		trigger_all_cpu_backtrace();
-- 
2.39.5 (Apple Git-154)

