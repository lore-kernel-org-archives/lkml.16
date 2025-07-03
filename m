Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C261ADC65
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508619; cv=none; b=NUcBURV5vPrz1ESqhOB9MH38kBW7Z0cZ7g3SbUDc03yFvqTKbnv13eO12hlW4/+EgTIYaVdd6GDzI21Hsq/C0DIDowi1GZxcYC6zTzP6rq1qFZN9TlOY7s0XruPZNBB+SCbJjXO6fyfwcpYq5lJSvXhvt5chwyCAhElUq2OFdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508619; c=relaxed/simple;
	bh=tPii+pXoG0cERdcXuiTmHVS/vIx3hqlR1qO4qZI8Cgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRiqHTK1XmsfGIqSBW6Z7EDA3afbK+GMALs1DIid1gwF3X7rB5elkha+ekLtBONcWvSFbrvladUFK7T1g2y9sL9fdR6+LA5ynEVRzmymICPcFYNdWxpb/7CxmLmj+X6eQqeJFJL+Yc1oSB+e8Ur1PCen21xC8pDzGoCnAqj0+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tCDtNckC; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tCDtNckC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508609; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3wjCxcOLhf2OFMej0SFymeFA2froSrrQkmUHMvBDaRQ=;
	b=tCDtNckCQEk4IMUh/dIHev/GxWmslYQRoSbASRNBtddQ2ID+tM7vwQ4mpMEg6I2vbCZTT++rXnw2EE8kkznEAlJ3oPueEdTwk0KalXfqMfK+IKJwN00ROVvf6UDZMNVssakEXG2bDYjzQp7v0KRNzzYjBS8TlP5a/oW2UA3Lhww=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqZ3e._1751508608 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 10:10:08 +0800
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
Subject: [PATCH v3 4/5] panic: add 'panic_sys_info=' setup option for kernel cmdline
Date: Thu,  3 Jul 2025 10:10:03 +0800
Message-Id: <20250703021004.42328-5-feng.tang@linux.alibaba.com>
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

'panic_sys_info=' sysctl interface is already added for runtime setting.
Add counterpart kernel cmdline option for boottime setting.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++++++
 kernel/panic.c                                  |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index abb2ade021ee..39ddef7c5857 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4541,6 +4541,21 @@
 			Use this option carefully, maybe worth to setup a
 			bigger log buffer with "log_buf_len" along with this.
 
+	panic_sys_info= A comma separated list of extra information to be dumped
+                        on panic.
+                        Format: val[,val...]
+                        Where @val can be any of the following:
+
+                        tasks:          print all tasks info
+                        mem:            print system memory info
+			timers:         print timers info
+                        locks:          print locks info if CONFIG_LOCKDEP is on
+                        ftrace:         print ftrace buffer
+                        all_bt:         print all CPUs backtrace (if available in the arch)
+                        blocked_tasks:  print only tasks in uninterruptible (blocked) state
+
+                        This is a human readable alternative to the 'panic_print' option.
+
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
 			Format: <parport#>
diff --git a/kernel/panic.c b/kernel/panic.c
index d7aa427dc23c..d9d4fcd5e318 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -143,6 +143,15 @@ static __init int kernel_panic_sysctls_init(void)
 late_initcall(kernel_panic_sysctls_init);
 #endif
 
+/* The format is "panic_sys_info=tasks,mem,locks,ftrace,..." */
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
2.43.5

