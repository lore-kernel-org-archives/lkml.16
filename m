Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F417BA5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036134; cv=none; b=DNj2xiEvUbCEXlwFUPH+HsSqUiDqtAvXXIwXSC0tdmsbv/ei8jlEMTtREPA+xIrVI2+iJ2yoRT1LTJtianJqccz+vFTdH6PG93tfoJDZZ0CNXHkeorksMT3aRM+XanVUkQ4o8KZvHQddeIzYynaBQMSiFgRtvq8x2EJjysSKch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036134; c=relaxed/simple;
	bh=aJiRQnuOhkLa7LiyyMk2v14H2mCJujdpRcITqvpIvqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ecOYB7HAMSw8VTQMY5aguismw23JHAV1MMx/oavqcWO1Ri1wMe5s9KMCClVPAyvsw2HKzWRBhFf9Isng0nDIPb3q7SbkgzSY9IbHKMqJCUL2TtUfVOK3YoAW7JOWXs/vGBVa+NlT9vyWT0hiAItB8eFXFczvvYp4puc0kZqLWXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gi7mAVBM; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gi7mAVBM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036124; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=M3lJK2qdxM3QqbG3JD1EivF32/aBG5sfk+PR7hs51W0=;
	b=gi7mAVBMq6CkoejO4q2D/p0iy/jiYBDXGYwYbJhJOERMCaE1xrIaqZ1TS549PiH1HyncC558tHjc8SYgBGUhRX3fE4I7sBvNXDvrzlfuLjUtt/hR0uJbgX0M96IyWJTkDA6t9wUpgsep8Lhu5JFB2/7a285I9L0i7CD2vM8MBOA=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wdr-a1H_1750036123 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 09:08:43 +0800
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
Subject: [PATCH V2 4/5] panic: add 'panic_sys_info=' setup option for sysctl and kernel cmdline
Date: Mon, 16 Jun 2025 09:08:39 +0800
Message-Id: <20250616010840.38258-5-feng.tang@linux.alibaba.com>
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

Add 'panic_sys_info=' setup which expects string like "tasks,mem,lock,...".
It supports both runtime sysctl control and boot time kernel cmdline setup,
and could be seen as human readable string version of 'panic_print'.

The detail mapping is:
	SYS_SHOW_TASK_INFO	"tasks"
	SYS_SHOW_MEM_INFO	"mem"
	SYS_SHOW_TIMER_INFO	"timer"
	SYS_SHOW_LOCK_INFO	"lock"
	SYS_SHOW_FTRACE_INFO	"ftrace"
	SYS_SHOW_ALL_CPU_BT	"all_bt"
	SYS_SHOW_BLOCKED_TASKS	"blocked_tasks"

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 .../admin-guide/kernel-parameters.txt          | 13 +++++++++++++
 Documentation/admin-guide/sysctl/kernel.rst    | 18 ++++++++++++++++++
 kernel/panic.c                                 | 16 ++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..d714a0ebf909 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4541,6 +4541,19 @@
 			Use this option carefully, maybe worth to setup a
 			bigger log buffer with "log_buf_len" along with this.
 
+	panic_sys_info=
+			String of subsystem info to be dumped on panic.
+			It expects string of comma-separated words like
+			"tasks,mem,timer,...", which is a human readable string
+			version of 'panic_print':
+			tasks: print all tasks info
+			mem: print system memory info
+			timer: print timer info
+			lock: print locks info if CONFIG_LOCKDEP is on
+			ftrace: print ftrace buffer
+			all_bt: print all CPUs backtrace (if available in the arch)
+			blocked_tasks: print only tasks in uninterruptible (blocked) state
+
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
 			Format: <parport#>
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..2013afd98605 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -899,6 +899,24 @@ So for example to print tasks and memory info on panic, user can::
   echo 3 > /proc/sys/kernel/panic_print
 
 
+panic_sys_info
+==============
+
+String of subsystem info to be dumped on panic. It expects string of
+comma-separated words like "tasks,mem,timer,...", which is a human
+readable string version of 'panic_print':
+
+=============   ===================================================
+tasks           print all tasks info
+mem             print system memory info
+timer           print timer info
+lock            print locks info if CONFIG_LOCKDEP is on
+ftrace          print ftrace buffer
+all_bt          print all CPUs backtrace (if available in the arch)
+blocked_tasks   print only tasks in uninterruptible (blocked) state
+=============   ===================================================
+
+
 panic_on_rcu_stall
 ==================
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 35c98aefa39f..ea238f7d4b54 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -125,6 +125,13 @@ static const struct ctl_table kern_panic_table[] = {
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
@@ -135,6 +142,15 @@ static __init int kernel_panic_sysctls_init(void)
 late_initcall(kernel_panic_sysctls_init);
 #endif
 
+/* The format is "panic_sys_info=task,mem,ftrace,..." */
+static int __init setup_panic_sys_info(char *buf)
+{
+	/* There is no risk of race in kernel boot phase */
+	panic_print = sys_info_parse_param(buf);
+	return 1;
+}
+__setup("panic_sys_info=", setup_panic_sys_info);
+
 static atomic_t warn_count = ATOMIC_INIT(0);
 
 #ifdef CONFIG_SYSFS
-- 
2.39.5 (Apple Git-154)

