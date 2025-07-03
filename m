Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00571AF0C1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508620; cv=none; b=MpMJ+eLJnflP+tR9r1kHaIIuX/sS5XTMXNvLxw+A6FsFlGu1gigqvo+Zty7i5p2MN/aUSmB9A8rZ31fIRWeKN7gIuI2XARUt1y52TpFI5TEb1oxaSeDWB7r3gFk2lmo6kaCePpFhgM2A73mlS8IiZIOsDdNtHP8CA4iKPiwD5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508620; c=relaxed/simple;
	bh=PrbpDPIGwbVnLN+XYaYPxiEMUbBiLtTOwlu9YoQVYDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ig3ReYNo3d0DCXPRsiU8bTBxXqx8yoaWyYm+FMlSd4wlRSQE3HN5V5AM6oRqswEDZj+JEmrt6taqfSl8DJBW+/xRQHTQosXtRLxY0t9iMOOeZN20eIpLUFQIDw9yhfqJmAwMvTHw0ku6zFFOmVYm+FAwQqzG6sV7i6QH6cy8l+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QEZcP9KC; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QEZcP9KC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508610; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sCxjicG5r3fkQxnVPRBp7xHrgO61Yw1xC3KdXRbaghg=;
	b=QEZcP9KCuneqETxHwWmpXTUd2so8WPsozc6pp/BuVdoW6VKIDlsrUrPuptwQWPGvh1xSWGYWHTXLzLh7kL5F0N4FhfXjsx+kLUg8zkryFAbN63GeY4mGndjCkWBr/UsTxggFz4pFZ3i7bDE/59CrjEfTHu0vtn1Y951si8ZPEPc=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqQisY_1751508608 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 10:10:09 +0800
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
Subject: [PATCH v3 5/5] panic: add note that panic_print sysctl interface is deprecated
Date: Thu,  3 Jul 2025 10:10:04 +0800
Message-Id: <20250703021004.42328-6-feng.tang@linux.alibaba.com>
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

Add a dedicated core parameter 'panic_console_replay' for controlling
console replay, and add note that 'panic_print' sysctl interface  will
be obsoleted by 'panic_sys_info' and 'panic_console_replay'.  When it
happens, the SYS_INFO_PANIC_CONSOLE_REPLAY can be removed as well.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 ++++
 kernel/panic.c                                | 21 ++++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 39ddef7c5857..f34de9978a91 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4556,6 +4556,10 @@
 
                         This is a human readable alternative to the 'panic_print' option.
 
+	panic_console_replay
+			When panic happens, replay all kernel messages on
+			consoles at the end of panic.
+
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
 			Format: <parport#>
diff --git a/kernel/panic.c b/kernel/panic.c
index d9d4fcd5e318..bb16f254cd02 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -64,6 +64,7 @@ int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
 static unsigned int warn_limit __read_mostly;
+static bool panic_console_replay;
 
 bool panic_triggering_all_cpu_backtrace;
 
@@ -77,6 +78,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 EXPORT_SYMBOL(panic_notifier_list);
 
 #ifdef CONFIG_SYSCTL
+static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
+			   void *buffer, size_t *lenp, loff_t *ppos)
+{
+	pr_info_once("Kernel: 'panic_print' sysctl interface will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
+	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
+}
+
 static const struct ctl_table kern_panic_table[] = {
 #ifdef CONFIG_SMP
 	{
@@ -108,7 +116,7 @@ static const struct ctl_table kern_panic_table[] = {
 		.data		= &panic_print,
 		.maxlen		= sizeof(unsigned long),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
+		.proc_handler	= sysctl_panic_print_handler,
 	},
 	{
 		.procname	= "panic_on_warn",
@@ -247,12 +255,6 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
 }
 EXPORT_SYMBOL(nmi_panic);
 
-static void panic_console_replay(void)
-{
-	if (panic_print & SYS_INFO_PANIC_CONSOLE_REPLAY)
-		console_flush_on_panic(CONSOLE_REPLAY_ALL);
-}
-
 void check_panic_on_warn(const char *origin)
 {
 	unsigned int limit;
@@ -427,7 +429,9 @@ void panic(const char *fmt, ...)
 	debug_locks_off();
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 
-	panic_console_replay();
+	if ((panic_print & SYS_INFO_PANIC_CONSOLE_REPLAY) ||
+		panic_console_replay)
+		console_flush_on_panic(CONSOLE_REPLAY_ALL);
 
 	if (!panic_blink)
 		panic_blink = no_blink;
@@ -869,6 +873,7 @@ core_param(panic_print, panic_print, ulong, 0644);
 core_param(pause_on_oops, pause_on_oops, int, 0644);
 core_param(panic_on_warn, panic_on_warn, int, 0644);
 core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool, 0644);
+core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int __init oops_setup(char *s)
 {
-- 
2.43.5

