Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989D1BEF6D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746953592; cv=none; b=O9UtcqjC8sahNwUEA//MIBNPYxZrR7cOh1jZDY/j921IRqoxXouH4lIPcmJ34bZZtGURueOXdMWt5CKIvop9bsBFSQbJre+LxIUP+HPHj1Vr7sJZubPpUUh7NSisgJAAC51HDKD1q/7PEcivYbqDNoAhCcYhnj7wMUsVIdRJQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746953592; c=relaxed/simple;
	bh=/3Ry2gB5rFGVaRFhCZm51kn3qdGjnjINXMCiUDzbJRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dwiB11mdx2iEvx+tAM5/8G2Z2IB9RO5NXE5T2sHw+a4xd7MKcbsVwFaaZnHwxAquxRf8LeTzvykbvoU9iWP8gtiCcl8fHt4vZVKeJUSLq6c7drWQ0HO2pcbwqvnnPMQLuRxn9cP+AjWMrSlrkxtfYaEn4oxUdfO6rNsEBvZA6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aKVVNaST; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aKVVNaST"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746953581; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8t92E5KWjqXNVLiB/b284RDqI4JT9H4sLibraRXrnJU=;
	b=aKVVNaSTwX6FxVROXSeIHFn9b3AR8fl8RBntYMDLNjqRDtHKDC1DcMs4OThoTJTJ2YyirNaPsBsZn+CvQC8rZ6kif++JINSh8qvYXkcMLWYb2miR8To146PP6mdqrB4LOnAw96NqSh0H5zgWGDoNbvl1RQTT/bJ0Ppno1JiMf1I=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaA7MWw_1746953580 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 11 May 2025 16:53:01 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org
Cc: mhiramat@kernel.org,
	llong@redhat.com,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v1 3/3] kernel/watchdog: add option to dump system info when system is locked up
Date: Sun, 11 May 2025 16:52:54 +0800
Message-Id: <20250511085254.61446-4-feng.tang@linux.alibaba.com>
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
software/hardware lockup cases, and 'lockup_print_mask' is the control
knob and a bitmask to control what information should be printed out:

	bit 0: print all tasks info
	bit 1: print system memory info
	bit 2: print timer info
	bit 3: print locks info if CONFIG_LOCKDEP is on
	bit 4: print ftrace buffer
	bit 5: print all printk messages in buffer
	bit 6: print all CPUs backtrace (if available in the arch)
	bit 7: print only tasks in uninterruptible (blocked) state

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 .../admin-guide/kernel-parameters.txt         | 11 +++++++---
 kernel/watchdog.c                             | 20 +++++++++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d35d8101bee9..2b8bda2b5f0b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4489,9 +4489,14 @@
 			bigger log buffer with "log_buf_len" along with this.
 
 	hungtask_print_mask=
-			Bitmask for printing system info when hung task is detected.
-			Details of bits definition is the same as panic_print's
-			definition above.
+			Bitmask for printing system info when hung task is
+			detected. Details of bits definition is the same as
+			panic_print's definition above.
+
+	lockup_print_mask=
+			Bitmask for printing system info when software/hardware
+			system lockup is detected. Details of bits definition
+			is the same as panic_print's definition above.
 
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 9fa2af9dbf2c..fb1b94929c3b 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -52,6 +52,23 @@ static int __read_mostly watchdog_hardlockup_available;
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
 
+/*
+ * A bitmask to control what kinds of system info to be printed when a
+ * software/hardware lockup is detected, it could be task, memory, lock
+ * etc. And the bit definition (from panic.h) is:
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
+unsigned long lockup_print_mask;
+core_param(lockup_print_mask, lockup_print_mask, ulong, 0644);
+
 #ifdef CONFIG_HARDLOCKUP_DETECTOR
 
 # ifdef CONFIG_SMP
@@ -212,6 +229,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 				clear_bit_unlock(0, &hard_lockup_nmi_warn);
 		}
 
+		sys_show_info(lockup_print_mask);
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
@@ -774,6 +792,8 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 		}
 
 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+
+		sys_show_info(lockup_print_mask);
 		if (softlockup_panic)
 			panic("softlockup: hung tasks");
 	}
-- 
2.39.5 (Apple Git-154)

