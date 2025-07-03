Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC5189F3B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508619; cv=none; b=ukxwOStGaOpG6w/WNnZvRfGfCKKf//5P51MlJFvcgrNQdEiF287kKaLYscC+SkBrFHFS+JuEedJm3QG3nYnls5zyhjIEE8ZWMPDHYeV0i0AjI8YfM30DEnXnBJoot0vSQFjEdwxfxnRAASuzxywPSIc9rGREwg+kX5xqVT3wzak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508619; c=relaxed/simple;
	bh=I3KXST0xTf08Th70DnKWCRs5vARFt6elXYjog4TvP48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKjSouRGKWsovdaiQOVtzrApnbdFjETrKsF0tmMH8K/txFVv0iKm1AXd7BZy5xGpeMqKmRFvsi0yyBagR3ZmXqyRIbY9B+SG4IStfILCg4Y1bq0SA3zvGiYHwnUH411eY2w1duVVlx63t5QnCtuASI124t+GesUIwN5jgyAAIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=w92tkT8X; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="w92tkT8X"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508607; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=WOLKp4Okgfsgx4gkUFe1bvBEcgsr4BZ1qlxKndLNm9U=;
	b=w92tkT8XimeedKmTre+g/T7lolxCNQ71kD22PK8J6r1UoUkajDcB7rmI+XoKmH/oq6PvxZud2yCoEh5S8qunFjg2B8IG80Jdal94LmAIOd0vUAB8yNUcHaDWqWhG9Rbe89f5RcXgYy8XqbGZecNl9p/XRcKGJbzxhDB+A3zv3zo=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqZ3d7_1751508606 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 10:10:06 +0800
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
Subject: [PATCH v3 1/5] panic: clean up code for console replay
Date: Thu,  3 Jul 2025 10:10:00 +0800
Message-Id: <20250703021004.42328-2-feng.tang@linux.alibaba.com>
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

Currently the panic_print_sys_info() was called twice with different
parameters to handle console replay case, which is kind of confusing.

Add panic_console_replay() explicitly and rename 'PANIC_PRINT_ALL_PRINTK_MSG'
to 'PANIC_CONSOLE_REPLAY', to make the code straightforward. The
related kernel document is also updated.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 .../admin-guide/kernel-parameters.txt          |  2 +-
 Documentation/admin-guide/sysctl/kernel.rst    |  2 +-
 kernel/panic.c                                 | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..abb2ade021ee 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4533,7 +4533,7 @@
 			bit 2: print timer info
 			bit 3: print locks info if CONFIG_LOCKDEP is on
 			bit 4: print ftrace buffer
-			bit 5: print all printk messages in buffer
+			bit 5: replay all messages on consoles at the end of panic
 			bit 6: print all CPUs backtrace (if available in the arch)
 			bit 7: print only tasks in uninterruptible (blocked) state
 			*Be aware* that this option may print a _lot_ of lines,
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..0d08b7a2db2d 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -889,7 +889,7 @@ bit 1  print system memory info
 bit 2  print timer info
 bit 3  print locks info if ``CONFIG_LOCKDEP`` is on
 bit 4  print ftrace buffer
-bit 5  print all printk messages in buffer
+bit 5  replay all messages on consoles at the end of panic
 bit 6  print all CPUs backtrace (if available in the arch)
 bit 7  print only tasks in uninterruptible (blocked) state
 =====  ============================================
diff --git a/kernel/panic.c b/kernel/panic.c
index b0b9a8bf4560..9b6c5dc28a65 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -74,7 +74,7 @@ EXPORT_SYMBOL_GPL(panic_timeout);
 #define PANIC_PRINT_TIMER_INFO		0x00000004
 #define PANIC_PRINT_LOCK_INFO		0x00000008
 #define PANIC_PRINT_FTRACE_INFO		0x00000010
-#define PANIC_PRINT_ALL_PRINTK_MSG	0x00000020
+#define PANIC_CONSOLE_REPLAY		0x00000020
 #define PANIC_PRINT_ALL_CPU_BT		0x00000040
 #define PANIC_PRINT_BLOCKED_TASKS	0x00000080
 unsigned long panic_print;
@@ -238,14 +238,14 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
 }
 EXPORT_SYMBOL(nmi_panic);
 
-static void panic_print_sys_info(bool console_flush)
+static void panic_console_replay(void)
 {
-	if (console_flush) {
-		if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
-			console_flush_on_panic(CONSOLE_REPLAY_ALL);
-		return;
-	}
+	if (panic_print & PANIC_CONSOLE_REPLAY)
+		console_flush_on_panic(CONSOLE_REPLAY_ALL);
+}
 
+static void panic_print_sys_info(void)
+{
 	if (panic_print & PANIC_PRINT_TASK_INFO)
 		show_state();
 
@@ -410,7 +410,7 @@ void panic(const char *fmt, ...)
 	 */
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
 
-	panic_print_sys_info(false);
+	panic_print_sys_info();
 
 	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
@@ -439,7 +439,7 @@ void panic(const char *fmt, ...)
 	debug_locks_off();
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 
-	panic_print_sys_info(true);
+	panic_console_replay();
 
 	if (!panic_blink)
 		panic_blink = no_blink;
-- 
2.43.5

