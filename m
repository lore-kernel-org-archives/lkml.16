Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E1194A73
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746953590; cv=none; b=MKuwQqu7rUdNNxsHnsFPSZkBQBdKpv7wwwqNzQhdezhBLgfcYrFTrdigGSws0VUB5JDm5WgB+dKuYtbKYWkoai2qJ3KzU7UDR7D7YLtpu83s9YBgGA8dZvan86lMF4+wQhjCL+ZiBFUu9AsvwtICanhqRiAM4B+Pn3I9UYy33oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746953590; c=relaxed/simple;
	bh=kzI+MuQkJcTTyCmrVNWQ/8SgYRK5zQJZsGidEdOxkeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tuRBc2PcD1YjpdomN/JgFKsPyZ+kq7fXpsu0Or9Utj7glriC6nic5+fb/y3FW+r2AZp+ZHfduWCYhFOA4mVtkVWudCDEb6shYjWOOwOKXJs4vJDr3Jdgq2MuMRrxxrNk4J6EJFp9yyo0A9EwDHO9VmyW7rXcfTAjmCe0Ayj6diw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R1+J9Ueb; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R1+J9Ueb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746953580; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=J+Izptv443yw1YuFeuFq9CG1fp5LXsIrzm6WXIAqqRI=;
	b=R1+J9Uebuq5t2GBe8JPDRTmxeP+BgHUHtIrQUMy94iQYua+OAGpCdDIKQBa+2vnhuO3+RwHkQ2dOQQOL17nxwRvudi4GiSXHNCnNCciA0k9DL/qSDIyeAD/lsdfVvRGlNwlCfjIC4lugnaeosTLX4iMUT+z/pby9jl8Ha2eRAtM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaA7MWV_1746953578 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 11 May 2025 16:52:59 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org
Cc: mhiramat@kernel.org,
	llong@redhat.com,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v1 2/3] kernel/hung_task: add option to dump system info when hung task detected
Date: Sun, 11 May 2025 16:52:53 +0800
Message-Id: <20250511085254.61446-3-feng.tang@linux.alibaba.com>
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

Kernel panic code utilizes sys_show_info() to dump needed system
information to help debugging. Similarly, add this debug option for
task hung case, and 'hungtask_print_mask' is the control knob and a
bitmask to control what information should be printed out:

            bit 0: print all tasks info
            bit 1: print system memory info
            bit 2: print timer info
            bit 3: print locks info if CONFIG_LOCKDEP is on
            bit 4: print ftrace buffer
            bit 5: print all printk messages in buffer
            bit 6: print all CPUs backtrace (if available in the arch)
            bit 7: print only tasks in uninterruptible (blocked) state

Also simplify the code about dumping locks and triggering backtrace
for all CPUs by leveraging sys_show_info().

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 kernel/hung_task.c                            | 42 +++++++++++++------
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..d35d8101bee9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4488,6 +4488,11 @@
 			Use this option carefully, maybe worth to setup a
 			bigger log buffer with "log_buf_len" along with this.
 
+	hungtask_print_mask=
+			Bitmask for printing system info when hung task is detected.
+			Details of bits definition is the same as panic_print's
+			definition above.
+
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
 			Format: <parport#>
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index dc898ec93463..3907e3c6fefa 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -58,12 +58,29 @@ static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
 static int __read_mostly sysctl_hung_task_warnings = 10;
 
 static int __read_mostly did_panic;
-static bool hung_task_show_lock;
 static bool hung_task_call_panic;
-static bool hung_task_show_all_bt;
 
 static struct task_struct *watchdog_task;
 
+/*
+ * A bitmask to control what kinds of system info to be printed when a
+ * hung task is detected, it could be task, memory, lock etc. And the bit
+ * definition (from panic.h) is:
+ *
+ *	#define SYS_PRINT_TASK_INFO		0x00000001
+ *	#define SYS_PRINT_MEM_INFO		0x00000002
+ *	#define SYS_PRINT_TIMER_INFO		0x00000004
+ *	#define SYS_PRINT_LOCK_INFO		0x00000008
+ *	#define SYS_PRINT_FTRACE_INFO		0x00000010
+ *	#define SYS_PRINT_ALL_PRINTK_MSG	0x00000020
+ *	#define SYS_PRINT_ALL_CPU_BT		0x00000040
+ *	#define SYS_PRINT_BLOCKED_TASKS		0x00000080
+ */
+unsigned long hungtask_print_mask;
+core_param(hungtask_print_mask, hungtask_print_mask, ulong, 0644);
+
+static unsigned long cur_print_mask;
+
 #ifdef CONFIG_SMP
 /*
  * Should we dump all CPUs backtraces in a hung task event?
@@ -163,11 +180,16 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
 	 */
 	sysctl_hung_task_detect_count++;
 
+	cur_print_mask = hungtask_print_mask;
+
+	if (!sysctl_hung_task_all_cpu_backtrace)
+		cur_print_mask &= ~SYS_PRINT_ALL_CPU_BT;
+
 	trace_sched_process_hang(t);
 
 	if (sysctl_hung_task_panic) {
 		console_verbose();
-		hung_task_show_lock = true;
+		cur_print_mask |= SYS_PRINT_LOCK_INFO;
 		hung_task_call_panic = true;
 	}
 
@@ -190,10 +212,10 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
 			" disables this message.\n");
 		sched_show_task(t);
 		debug_show_blocker(t);
-		hung_task_show_lock = true;
+		cur_print_mask |= SYS_PRINT_LOCK_INFO;
 
 		if (sysctl_hung_task_all_cpu_backtrace)
-			hung_task_show_all_bt = true;
+			cur_print_mask |= SYS_PRINT_ALL_CPU_BT;
 		if (!sysctl_hung_task_warnings)
 			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
 	}
@@ -242,7 +264,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	if (test_taint(TAINT_DIE) || did_panic)
 		return;
 
-	hung_task_show_lock = false;
+	cur_print_mask = 0;
 	rcu_read_lock();
 	for_each_process_thread(g, t) {
 		unsigned int state;
@@ -266,14 +288,8 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	}
  unlock:
 	rcu_read_unlock();
-	if (hung_task_show_lock)
-		debug_show_all_locks();
-
-	if (hung_task_show_all_bt) {
-		hung_task_show_all_bt = false;
-		trigger_all_cpu_backtrace();
-	}
 
+	sys_show_info(cur_print_mask);
 	if (hung_task_call_panic)
 		panic("hung_task: blocked tasks");
 }
-- 
2.39.5 (Apple Git-154)

