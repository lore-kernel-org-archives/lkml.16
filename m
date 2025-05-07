Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DA21480D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614611; cv=none; b=Xz31qjhvBY3xq/66Qu3ZkJVdupT7RcsmtM2NijmVZSBh2nME0UhvlUEdypCymCEYBOfaraZzjHlTHBvpY3YgOyjyJB+bbD4e2tU/cOMeAtFXBw3AAyZjZsJ3VEr2ufQDiDFvdqFjS6nsB70OIKGljTOnhptXpHA31HQ8WJsl9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614611; c=relaxed/simple;
	bh=cYqyqAfakJpWQEz5sImgF3obdoE1LtUan2iUEcKmPQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNww5485nwddlgpkLgQEQOgp0zV4ktrd9B7S1CoOiNHK7sW/hW0xnkLZP5D65La6eGqGBrTBmCxc3ckfqrpGj8ufOBi1PAYwkwfTWFZxEuVImRdbVa5YG/m2rxvz/+zluyD/GwACflBhhuOED+z/x2qiwPXH330mgs1YqG/8CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LOeG5q+u; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LOeG5q+u"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746614605; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=j/B0xu3DJe4JpL8FQQd96mEM5+oX8xJXLKWeAxyHaSg=;
	b=LOeG5q+u4SE1SI/KiT8/vPmKRaSa0ohIgDSmsjcBe66OKNPRTXGqOApRuS8RQOH/UIPFTdcx6d5+QQOHdcVtdvyUonH+lKPGO6PZczbSbGjxUvNf+hKWQgGvhNhmIw7fbyJAYf7vzzPNaL76o0JMBaxl4kKvTr+y/e7yoc2UObI=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WZpgPjC_1746614604 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 18:43:24 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <ioworker0@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH RFC 2/3] kernel/hung_task: add option to dump system info when hung task detected
Date: Wed,  7 May 2025 18:43:21 +0800
Message-Id: <20250507104322.30700-3-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
References: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel panic code utilizes sys_show_info() to dump needed system
information to help debugging. Similarly, add this debug option for
task hung case, and 'hungtask_print' is the knob to control what
information should be printed out.

Also clean up the code about dumping locks and triggering backtrace
for all CPUs. One todo may be to merge this 'hungtask_print' with
some sysctl knobs in hung_task.c.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/hung_task.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index dc898ec93463..8229637be2c7 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -58,12 +58,20 @@ static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
 static int __read_mostly sysctl_hung_task_warnings = 10;
 
 static int __read_mostly did_panic;
-static bool hung_task_show_lock;
 static bool hung_task_call_panic;
-static bool hung_task_show_all_bt;
 
 static struct task_struct *watchdog_task;
 
+/*
+ * A bitmask to control what kinds of system info to be printed when a
+ * hung task is detected, it could be task, memory, lock etc. Refer panic.h
+ * for details of bit definition.
+ */
+unsigned long hungtask_print;
+core_param(hungtask_print, hungtask_print, ulong, 0644);
+
+static unsigned long cur_hungtask_print;
+
 #ifdef CONFIG_SMP
 /*
  * Should we dump all CPUs backtraces in a hung task event?
@@ -163,11 +171,12 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
 	 */
 	sysctl_hung_task_detect_count++;
 
+	cur_hungtask_print = hungtask_print;
 	trace_sched_process_hang(t);
 
 	if (sysctl_hung_task_panic) {
 		console_verbose();
-		hung_task_show_lock = true;
+		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
 		hung_task_call_panic = true;
 	}
 
@@ -190,10 +199,10 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
 			" disables this message.\n");
 		sched_show_task(t);
 		debug_show_blocker(t);
-		hung_task_show_lock = true;
+		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
 
 		if (sysctl_hung_task_all_cpu_backtrace)
-			hung_task_show_all_bt = true;
+			cur_hungtask_print |= SYS_PRINT_ALL_CPU_BT;
 		if (!sysctl_hung_task_warnings)
 			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
 	}
@@ -242,7 +251,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	if (test_taint(TAINT_DIE) || did_panic)
 		return;
 
-	hung_task_show_lock = false;
+	cur_hungtask_print = 0;
 	rcu_read_lock();
 	for_each_process_thread(g, t) {
 		unsigned int state;
@@ -266,14 +275,8 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
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
 
+	sys_show_info(cur_hungtask_print);
 	if (hung_task_call_panic)
 		panic("hung_task: blocked tasks");
 }
-- 
2.39.5 (Apple Git-154)

