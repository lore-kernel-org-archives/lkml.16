Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2332F19D09C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508618; cv=none; b=gIN7GrFhQWLgIX0w+jTzadbmx39jO3plp2PB2oE8MwjDNaicao8FHFGCf8RDCSLNtw3LVtkEoegKkdjP0GlQOylX8n9tXHG/eV5Vwk+YH2s34UuiwcrHK9ESGfzBntT9Y27s7MjjELIgKBm6miGtKSFNFEm15FG6hnsyy3LhZwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508618; c=relaxed/simple;
	bh=AGyT1RGyUGIEDOqh41DYk3aIyMYjDi2PZShTjHoY6NE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UKn0Ls21PGLstDD65xou5R9tlBAjVwV8+dAdUroi2LA/RQYv49idVf9x/xQDIIJD/9cgrCTaZY5dtzoTuAzQH0VpkqjA0lJunONF6G5yjLr6KxKyhHLjex6SEHPi2YPkOQicl/9ELGfA9A7zxMR6W+n6PvIHBgsQMo/ok+Hm0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xM6NQciA; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xM6NQciA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508608; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8jmzkVzSVkX+vDy5tamYP6AxVr7STdICWiyCDu8ltf8=;
	b=xM6NQciA0Jvl9zqGWkrsSHzQNwjSb4IkMjcSYcR+hotj5MZ2pYgyaZA1mSFBtWykOgdHPWf3yLi5M2XOq50mDbJKbXrZjREy970RYXNmS/YyIDewYiE3TsmotpXnha2Vaw8pXUzxbaS/5mbWRhhukHWAUkC+qyijk0gnn3IXoVc=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqUuD7_1751508607 cluster:ay36)
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
Subject: [PATCH 3/5] panic: add 'panic_sys_info' sysctl to take human readable string parameter
Date: Thu,  3 Jul 2025 10:10:02 +0800
Message-Id: <20250703021004.42328-4-feng.tang@linux.alibaba.com>
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

Bitmap definition for 'panic_print' is hard to remember and decode.
Add 'panic_sys_info='sysctl to take human readable string like
"tasks,mem,timers,locks,ftrace,..." and translate it into bitmap.

The detailed mapping is:
	SYS_INFO_TASKS		"tasks"
	SYS_INFO_MEM		"mem"
	SYS_INFO_TIMERS		"timers"
	SYS_INFO_LOCKS		"locks"
	SYS_INFO_FTRACE		"ftrace"
	SYS_INFO_ALL_CPU_BT	"all_bt"
	SYS_INFO_BLOCKED_TASKS	"blocked_tasks"

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 18 +++++
 include/linux/sys_info.h                    |  8 ++
 kernel/panic.c                              |  7 ++
 lib/sys_info.c                              | 90 +++++++++++++++++++++
 4 files changed, 123 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 0d08b7a2db2d..cccb06d1a6bf 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -899,6 +899,24 @@ So for example to print tasks and memory info on panic, user can::
   echo 3 > /proc/sys/kernel/panic_print
 
 
+panic_sys_info
+==============
+
+A comma separated list of extra information to be dumped on panic,
+for example, "tasks,mem,timers,...".  It is a human readable alternative
+to 'panic_print'. Possible values are:
+
+=============   ===================================================
+tasks           print all tasks info
+mem             print system memory info
+timer           print timers info
+lock            print locks info if CONFIG_LOCKDEP is on
+ftrace          print ftrace buffer
+all_bt          print all CPUs backtrace (if available in the arch)
+blocked_tasks   print only tasks in uninterruptible (blocked) state
+=============   ===================================================
+
+
 panic_on_rcu_stall
 ==================
 
diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
index 53b7e27dbf2a..89d77dc4f2ed 100644
--- a/include/linux/sys_info.h
+++ b/include/linux/sys_info.h
@@ -2,6 +2,8 @@
 #ifndef _LINUX_SYS_INFO_H
 #define _LINUX_SYS_INFO_H
 
+#include <linux/sysctl.h>
+
 /*
  * SYS_INFO_PANIC_CONSOLE_REPLAY is for panic case only, as it needs special
  * handling which only fits panic case.
@@ -16,5 +18,11 @@
 #define SYS_INFO_BLOCKED_TASKS		0x00000080
 
 void sys_info(unsigned long si_mask);
+unsigned long sys_info_parse_param(char *str);
 
+#ifdef CONFIG_SYSCTL
+int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos);
+#endif
 #endif	/* _LINUX_SYS_INFO_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index cbb0681177b3..d7aa427dc23c 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -126,6 +126,13 @@ static const struct ctl_table kern_panic_table[] = {
 		.mode           = 0644,
 		.proc_handler   = proc_douintvec,
 	},
+	{
+		.procname	= "panic_sys_info",
+		.data		= &panic_print,
+		.maxlen         = sizeof(panic_print),
+		.mode		= 0644,
+		.proc_handler	= sysctl_sys_info_handler,
+	},
 };
 
 static __init int kernel_panic_sysctls_init(void)
diff --git a/lib/sys_info.c b/lib/sys_info.c
index 53031e5cb98e..46d6f4f1ad2a 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -3,10 +3,100 @@
 #include <linux/console.h>
 #include <linux/kernel.h>
 #include <linux/ftrace.h>
+#include <linux/sysctl.h>
 #include <linux/nmi.h>
 
 #include <linux/sys_info.h>
 
+struct sys_info_name {
+	unsigned long bit;
+	const char *name;
+};
+
+/*
+ * When 'si_names' gets updated,  please make sure the 'sys_info_avail'
+ * below is updated accordingly.
+ */
+static const struct sys_info_name  si_names[] = {
+	{ SYS_INFO_TASKS,		"tasks" },
+	{ SYS_INFO_MEM,			"mem" },
+	{ SYS_INFO_TIMERS,		"timers" },
+	{ SYS_INFO_LOCKS,		"locks" },
+	{ SYS_INFO_FTRACE,		"ftrace" },
+	{ SYS_INFO_ALL_CPU_BT,		"all_bt" },
+	{ SYS_INFO_BLOCKED_TASKS,	"blocked_tasks" },
+};
+
+/* Expecting string like "xxx_sys_info=tasks,mem,timers,locks,ftrace,..." */
+unsigned long sys_info_parse_param(char *str)
+{
+	unsigned long si_bits = 0;
+	char *s, *name;
+	int i;
+
+	s = str;
+	while ((name = strsep(&s, ",")) && *name) {
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (!strcmp(name, si_names[i].name)) {
+				si_bits |= si_names[i].bit;
+				break;
+			}
+		}
+	}
+
+	return si_bits;
+}
+
+#ifdef CONFIG_SYSCTL
+
+static const char sys_info_avail[] = "tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
+
+int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos)
+{
+	char names[sizeof(sys_info_avail) + 1];
+	struct ctl_table table;
+	unsigned long *si_bits_global;
+
+	si_bits_global = ro_table->data;
+
+	if (write) {
+		unsigned long si_bits;
+		int ret;
+
+		table = *ro_table;
+		table.data = names;
+		table.maxlen = sizeof(names);
+		ret = proc_dostring(&table, write, buffer, lenp, ppos);
+		if (ret)
+			return ret;
+
+		si_bits = sys_info_parse_param(names);
+		/* The access to the global value is not synchronized. */
+		WRITE_ONCE(*si_bits_global, si_bits);
+		return 0;
+	} else {
+		/* for 'read' operation */
+		char *delim = "";
+		int i, len = 0;
+
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (*si_bits_global & si_names[i].bit) {
+				len += scnprintf(names + len, sizeof(names) - len,
+					"%s%s", delim, si_names[i].name);
+				delim = ",";
+			}
+		}
+
+		table = *ro_table;
+		table.data = names;
+		table.maxlen = sizeof(names);
+		return proc_dostring(&table, write, buffer, lenp, ppos);
+	}
+}
+#endif
+
 void sys_info(unsigned long si_mask)
 {
 	if (si_mask & SYS_INFO_TASKS)
-- 
2.43.5

