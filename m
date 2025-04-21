Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBFF507
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206636; cv=none; b=O7huJsRwCBr3aiJibVftylK2sctBu3+LkWAqkLDdWZX7nxnMpj9uLHD/POrtlTAxtl9ddY3neydqd/b9FtXCMVwwwzXJawEbleTGjaRA//ag0F1wsuUx9FNwAeC8Xjl6Gj6QCaE6hH1L7BrxoKMImZRVcZPDhCFdxXx177cJYKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206636; c=relaxed/simple;
	bh=9M6FCK0jC4l932kiPOdskCcpIjFKgQR/1Z9ai4Tre4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LkfO6HikvC47ct9+05KtdjbXsdAH5bEaHqzrwyNyAo8l1CsavG/pga+UrgAmENX1yEEjdUd3mCbIlibs8FhwetEAVLqJGFRhF1/6BQKEWY8xQaH9lZsgeoH3Lx8/Ak62bGuc9rLFpyRkCksugyviwWbN5+OfGuvp4uDQaipseWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zgrdb26KJz4f3jtJ
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:36:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id CFE631A06DC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:37:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
	by APP4 (Coremail) with SMTP id gCh0CgB32l5jvQVo5SppKA--.54381S4;
	Mon, 21 Apr 2025 11:37:08 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: song@kernel.org,
	joel.granados@kernel.org,
	tglx@linutronix.de,
	dianders@chromium.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: Fix watchdog may detect false positive of softlockup
Date: Mon, 21 Apr 2025 03:50:21 +0000
Message-Id: <20250421035021.3507649-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgB32l5jvQVo5SppKA--.54381S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4Uur1DAF1fKw43Zr15twb_yoWxCrykpa
	yayFy3tw4Utrs5XrW3J3ZrXF1kCa48XrWUXFnrGw1SkFnYkr1rJryIkF4FgayDArZxXF1Y
	qa4FqrWfJayUtF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

When updating `watchdog_thresh`, there is a race condition between writing
the new `watchdog_thresh` value and stopping the old watchdog timer. If the
old timer triggers during this window, it may falsely detect a softlockup
due to the old interval and the new `watchdog_thresh` value being used. The
problem can be described as follow:

 # We asuume previous watchdog_thresh is 60, so the watchdog timer is
 # coming every 24s.
echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
|
+------>+ update watchdog_thresh (We are in kernel now)
	|
	|	  # using old interval and new `watchdog_thresh`
	+------>+ watchdog hrtimer (irq context: detect softlockup)
		|
		|
	+-------+
	|
	|
	+ softlockup_stop_all

To fix this problem, introduce a shadow variable for `watchdog_thresh`. The
update to the actual `watchdog_thresh` is delayed until after the old timer
is stopped, preventing false positives.

The following testcase may help to understand this problem.

---------------------------------------------
echo RT_RUNTIME_SHARE > /sys/kernel/debug/sched/features
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
echo 0 > /sys/kernel/debug/sched/fair_server/cpu3/runtime
echo 60 > /proc/sys/kernel/watchdog_thresh
taskset -c 3 chrt -r 99 /bin/bash -c "while true;do true; done" &
echo 10 > /proc/sys/kernel/watchdog_thresh &
---------------------------------------------

The test case above first removes the throttling restrictions for real-time
tasks. It then sets watchdog_thresh to 60 and executes a real-time task
,a simple while(1) loop, on cpu3. Consequently, the final command gets
blocked because the presence of this real-time thread prevents kworker:3
from being selected by the scheduler. This eventually triggers a softlockup
detection on cpu3 due to watchdog_timer_fn operating with inconsistent
variable - using both the old interval and the updated watchdog_thresh
simultaneously.

Cc: stable@vger.kernel.org
Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
Changes in v3:
1. Replace watchdog_thresh_shadow with watchdog_thresh_next.
2. Add comment to explain the role of watchdog_thresh_next.

Link to v1: https://lore.kernel.org/all/20250416013922.2905051-1-luogengkun@huaweicloud.com/
---
 kernel/watchdog.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 9fa2af9dbf2c..80d1a1dae276 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -47,6 +47,7 @@ int __read_mostly watchdog_user_enabled = 1;
 static int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
 static int __read_mostly watchdog_softlockup_user_enabled = 1;
 int __read_mostly watchdog_thresh = 10;
+static int __read_mostly watchdog_thresh_next;
 static int __read_mostly watchdog_hardlockup_available;
 
 struct cpumask watchdog_cpumask __read_mostly;
@@ -870,12 +871,20 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void __lockup_detector_reconfigure(void)
+static void __lockup_detector_reconfigure(bool thresh_changed)
 {
 	cpus_read_lock();
 	watchdog_hardlockup_stop();
 
 	softlockup_stop_all();
+	/*
+	 * To prevent watchdog_timer_fn from using the old interval and
+	 * the new watchdog_thresh at the same time, which could lead to
+	 * false softlockup reports, it is necessary to update the
+	 * watchdog_thresh after the softlockup is completed.
+	 */
+	if (thresh_changed)
+		watchdog_thresh = READ_ONCE(watchdog_thresh_next);
 	set_sample_period();
 	lockup_detector_update_enable();
 	if (watchdog_enabled && watchdog_thresh)
@@ -888,7 +897,7 @@ static void __lockup_detector_reconfigure(void)
 void lockup_detector_reconfigure(void)
 {
 	mutex_lock(&watchdog_mutex);
-	__lockup_detector_reconfigure();
+	__lockup_detector_reconfigure(false);
 	mutex_unlock(&watchdog_mutex);
 }
 
@@ -908,7 +917,7 @@ static __init void lockup_detector_setup(void)
 		return;
 
 	mutex_lock(&watchdog_mutex);
-	__lockup_detector_reconfigure();
+	__lockup_detector_reconfigure(false);
 	softlockup_initialized = true;
 	mutex_unlock(&watchdog_mutex);
 }
@@ -924,11 +933,11 @@ static void __lockup_detector_reconfigure(void)
 }
 void lockup_detector_reconfigure(void)
 {
-	__lockup_detector_reconfigure();
+	__lockup_detector_reconfigure(false);
 }
 static inline void lockup_detector_setup(void)
 {
-	__lockup_detector_reconfigure();
+	__lockup_detector_reconfigure(false);
 }
 #endif /* !CONFIG_SOFTLOCKUP_DETECTOR */
 
@@ -946,11 +955,11 @@ void lockup_detector_soft_poweroff(void)
 #ifdef CONFIG_SYSCTL
 
 /* Propagate any changes to the watchdog infrastructure */
-static void proc_watchdog_update(void)
+static void proc_watchdog_update(bool thresh_changed)
 {
 	/* Remove impossible cpus to keep sysctl output clean. */
 	cpumask_and(&watchdog_cpumask, &watchdog_cpumask, cpu_possible_mask);
-	__lockup_detector_reconfigure();
+	__lockup_detector_reconfigure(thresh_changed);
 }
 
 /*
@@ -984,7 +993,7 @@ static int proc_watchdog_common(int which, const struct ctl_table *table, int wr
 	} else {
 		err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 		if (!err && old != READ_ONCE(*param))
-			proc_watchdog_update();
+			proc_watchdog_update(false);
 	}
 	mutex_unlock(&watchdog_mutex);
 	return err;
@@ -1035,11 +1044,13 @@ static int proc_watchdog_thresh(const struct ctl_table *table, int write,
 
 	mutex_lock(&watchdog_mutex);
 
-	old = READ_ONCE(watchdog_thresh);
+	watchdog_thresh_next = READ_ONCE(watchdog_thresh);
+
+	old = watchdog_thresh_next;
 	err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 
-	if (!err && write && old != READ_ONCE(watchdog_thresh))
-		proc_watchdog_update();
+	if (!err && write && old != READ_ONCE(watchdog_thresh_next))
+		proc_watchdog_update(true);
 
 	mutex_unlock(&watchdog_mutex);
 	return err;
@@ -1060,7 +1071,7 @@ static int proc_watchdog_cpumask(const struct ctl_table *table, int write,
 
 	err = proc_do_large_bitmap(table, write, buffer, lenp, ppos);
 	if (!err && write)
-		proc_watchdog_update();
+		proc_watchdog_update(false);
 
 	mutex_unlock(&watchdog_mutex);
 	return err;
@@ -1080,7 +1091,7 @@ static const struct ctl_table watchdog_sysctls[] = {
 	},
 	{
 		.procname	= "watchdog_thresh",
-		.data		= &watchdog_thresh,
+		.data		= &watchdog_thresh_next,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_watchdog_thresh,
-- 
2.34.1

