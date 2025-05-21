Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D2219EB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809771; cv=none; b=AzZswUrMAQSIo7gxCiT6/2XmqDoysFNc5LXbGdY5njpRuis10yn8ay2fiwHIZg8d/2YjOgzl2vBAoyIg43gZlSynlW9rc2frru/z6uZuz9fzfCuF/BJRAGsZoMTJ6mJ8X26hHTol4vWRCzHhCk1dD0poGS1tgewdq8qEarPt0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809771; c=relaxed/simple;
	bh=l0QCfl/CfItj0mArULKanpPjeVZ/9Lj72ppxxwwoFmc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k0CRd5dDADtwdzOYLgpAshKzmmODgESYIvXwOgGUBFLtcEvXMxu36fh+5Rx+JuhrSICinHV6sOy3Xo57PciAIBlsjTjDlLgNXAzPRH++vWL8o/SkRoGxQYJimp778PWIeNJJ18sg16eTKB4TfUIzmnVca+MTHltR7rNOPd1RPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AmO0W2Ux; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AmO0W2Ux"
X-UUID: cd0e9990360e11f0813e4fe1310efc19-20250521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=evbOXmHnW0WCHWQX9clhz8jUt8kOoWPEaeDta7WskKA=;
	b=AmO0W2Ux4IawCG5nzesAzR60nItBQO2B7x9NOJCrUkdS9GoBZPFKdBAmvI9SyDEjiceDYaOCvFCZ/dL8qNyKxwfX0TCDOzfFvwnHrbvsEzQxGTkIgJTqDgRyCgBYqrXYFVdiLMWBgZiFjQF+0e7ah2CigVypbckWLIsD4OyRKPA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2cf24169-bb56-422c-98fa-c64d58c3e809,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:79b41cf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd0e9990360e11f0813e4fe1310efc19-20250521
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998404097; Wed, 21 May 2025 14:42:44 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 21 May 2025 14:42:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 21 May 2025 14:42:42 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: kuyo chang <kuyo.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] [Bug] list_add corruption during CPU hotplug stress test
Date: Wed, 21 May 2025 14:42:18 +0800
Message-ID: <20250521064238.3173224-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: kuyo chang <kuyo.chang@mediatek.com>

The commit (stop_machine, sched: Fix migrate_swap() vs. active_balance() deadlock)
introduces wake_q_add rather than wake_up_process.
However, it encounters sporadic failures during CPU hotplug stress test.

The kernel log shows list add fail as below
kmemleak: list_add corruption. prev->next should be next (ffffff82812c7a00), but was 0000000000000000. (prev=ffffff82812c3208).
kmemleak: kernel BUG at lib/list_debug.c:34!
kmemleak: Call trace:
kmemleak:  __list_add_valid_or_report+0x11c/0x144
kmemleak:  cpu_stop_queue_work+0x440/0x474
kmemleak:  stop_one_cpu_nowait_rec+0xe4/0x138
kmemleak:  balance_push+0x1f4/0x3e4
kmemleak:  __schedule+0x1adc/0x23bc
kmemleak:  preempt_schedule_common+0x68/0xd0
kmemleak:  preempt_schedule+0x60/0x80
kmemleak:  _raw_spin_unlock_irqrestore+0x9c/0xa0
kmemleak:  scan_gray_list+0x220/0x3e4
kmemleak:  kmemleak_scan+0x410/0x740
kmemleak:  kmemleak_scan_thread+0xb0/0xdc
kmemleak:  kthread+0x2bc/0x494
kmemleak:  ret_from_fork+0x10/0x20

Because the reproduction rate is very low, I designed a simple debug patch to help find the root cause of these sporadic failures.
The purpose of this debug patch is to record the status of push_work at balance_push, cpu_stopper, and cpu_stop_work.
In the regular case, we queue the push_work to stopper->works and set work->exec_state = WORK_QUEUE.
Then, we call wake_q_add for the stopper and set cpu_stopper.stopper_wakeq = WAKEQ_ADD_OK.
Finally, we wake up the stopper, which picks up the work from cpu_stop_work to execute.
We then set stopper->exec_state = WORK_PREP_EXEC to indicate that the push_work has been consumed.

However, in the failure case, by memory dump
cpu_stopper.stopper_wakeq = WAKEQ_ADD_FAIL
stopper->exec_state = WORK_QUEUE.
cpu_stopper.enabled = TRUE

Here is the failure sequence that leads to the bug.
CPU0
1st balance_push
stop_one_cpu_nowait
cpu_stop_queue_work
__cpu_stop_queue_work
list_add_tail  -> fist add work
wake_q_add   -> returns failure
wake_up_q(&wakeq); -> it doesn't wake up the stopper.
2nd balance_push
stop_one_cpu_nowait
cpu_stop_queue_work
__cpu_stop_queue_work
list_add_tail  -> A double list add is detected, which triggers kernel bugs.

Should we add queue status tracking in __cpu_stop_queue_work,
or is there a better place to do this?

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 include/linux/sched/wake_q.h |  1 +
 include/linux/stop_machine.h | 20 ++++++++++++++++++++
 kernel/sched/core.c          | 15 ++++++++++++++-
 kernel/stop_machine.c        | 36 ++++++++++++++++++++++++++++++++++--
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched/wake_q.h b/include/linux/sched/wake_q.h
index 0f28b4623ad4..083ced4bb5dc 100644
--- a/include/linux/sched/wake_q.h
+++ b/include/linux/sched/wake_q.h
@@ -60,6 +60,7 @@ static inline bool wake_q_empty(struct wake_q_head *head)
 }
 
 extern void wake_q_add(struct wake_q_head *head, struct task_struct *task);
+extern bool wake_q_add_ret(struct wake_q_head *head, struct task_struct *task);
 extern void wake_q_add_safe(struct wake_q_head *head, struct task_struct *task);
 extern void wake_up_q(struct wake_q_head *head);
 
diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index 3132262a404d..6daec44dcb99 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -21,18 +21,38 @@ typedef int (*cpu_stop_fn_t)(void *arg);
 
 #ifdef CONFIG_SMP
 
+enum work_state {
+	WORK_INIT = 0,
+	WORK_READY,
+	WORK_QUEUE,
+	WORK_PREP_EXEC,
+};
+
+enum stopper_wakeq_state {
+	WAKEQ_ADD_FAIL = 0,
+	WAKEQ_ADD_OK,
+};
+
+enum work_rec {
+	WORK_NO_REC = 0,
+	WORK_REC,
+};
 struct cpu_stop_work {
 	struct list_head	list;		/* cpu_stopper->works */
 	cpu_stop_fn_t		fn;
 	unsigned long		caller;
 	void			*arg;
 	struct cpu_stop_done	*done;
+	enum work_rec		rec;
+	enum work_state exec_state;
 };
 
 int stop_one_cpu(unsigned int cpu, cpu_stop_fn_t fn, void *arg);
 int stop_two_cpus(unsigned int cpu1, unsigned int cpu2, cpu_stop_fn_t fn, void *arg);
 bool stop_one_cpu_nowait(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
 			 struct cpu_stop_work *work_buf);
+bool stop_one_cpu_nowait_rec(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
+			struct cpu_stop_work *work_buf);
 void stop_machine_park(int cpu);
 void stop_machine_unpark(int cpu);
 void stop_machine_yield(const struct cpumask *cpumask);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..a617f51d3e5a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1037,6 +1037,19 @@ void wake_q_add(struct wake_q_head *head, struct task_struct *task)
 		get_task_struct(task);
 }
 
+/**
+ * wake_q_add_ret() - queue a wakeup for 'later' waking. record status.
+ */
+bool wake_q_add_ret(struct wake_q_head *head, struct task_struct *task)
+{
+	bool ret = false;
+
+	ret = __wake_q_add(head, task);
+	if (ret)
+		get_task_struct(task);
+	return ret;
+}
+
 /**
  * wake_q_add_safe() - safely queue a wakeup for 'later' waking.
  * @head: the wake_q_head to add @task to
@@ -8100,7 +8113,7 @@ static void balance_push(struct rq *rq)
 	 */
 	preempt_disable();
 	raw_spin_rq_unlock(rq);
-	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop, push_task,
+	stop_one_cpu_nowait_rec(rq->cpu, __balance_push_cpu_stop, push_task,
 			    this_cpu_ptr(&push_work));
 	preempt_enable();
 	/*
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 5d2d0562115b..3a2c48ed2182 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -42,6 +42,8 @@ struct cpu_stopper {
 	struct list_head	works;		/* list of pending works */
 
 	struct cpu_stop_work	stop_work;	/* for stop_cpus */
+	enum stopper_wakeq_state stopper_wakeq;		/* for stopper wakeup */
+	enum work_state exec_state;			/* for stopper exec state */
 	unsigned long		caller;
 	cpu_stop_fn_t		fn;
 };
@@ -85,8 +87,18 @@ static void __cpu_stop_queue_work(struct cpu_stopper *stopper,
 					struct cpu_stop_work *work,
 					struct wake_q_head *wakeq)
 {
+	bool wake_flag;
+
 	list_add_tail(&work->list, &stopper->works);
-	wake_q_add(wakeq, stopper->thread);
+	wake_flag = wake_q_add_ret(wakeq, stopper->thread);
+	if (work->rec == WORK_REC) {
+		work->exec_state = WORK_QUEUE;
+		stopper->exec_state = WORK_QUEUE;
+		if (wake_flag)
+			stopper->stopper_wakeq = WAKEQ_ADD_OK;
+		else
+			stopper->stopper_wakeq = WAKEQ_ADD_FAIL;
+	}
 }
 
 /* queue @work to @stopper.  if offline, @work is completed immediately */
@@ -141,6 +153,8 @@ int stop_one_cpu(unsigned int cpu, cpu_stop_fn_t fn, void *arg)
 	struct cpu_stop_done done;
 	struct cpu_stop_work work = { .fn = fn, .arg = arg, .done = &done, .caller = _RET_IP_ };
 
+	work.rec = WORK_NO_REC;
+	work.exec_state = WORK_INIT;
 	cpu_stop_init_done(&done, 1);
 	if (!cpu_stop_queue_work(cpu, &work))
 		return -ENOENT;
@@ -350,6 +364,8 @@ int stop_two_cpus(unsigned int cpu1, unsigned int cpu2, cpu_stop_fn_t fn, void *
 		.arg = &msdata,
 		.done = &done,
 		.caller = _RET_IP_,
+		.rec = WORK_NO_REC,
+		.exec_state = WORK_INIT,
 	};
 
 	cpu_stop_init_done(&done, 2);
@@ -386,6 +402,17 @@ bool stop_one_cpu_nowait(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
 			struct cpu_stop_work *work_buf)
 {
 	*work_buf = (struct cpu_stop_work){ .fn = fn, .arg = arg, .caller = _RET_IP_, };
+	work_buf->rec = WORK_NO_REC;
+	work_buf->exec_state = WORK_INIT;
+	return cpu_stop_queue_work(cpu, work_buf);
+}
+
+bool stop_one_cpu_nowait_rec(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
+			struct cpu_stop_work *work_buf)
+{
+	*work_buf = (struct cpu_stop_work){ .fn = fn, .arg = arg, .caller = _RET_IP_, };
+	work_buf->rec = WORK_REC;
+	work_buf->exec_state = WORK_READY;
 	return cpu_stop_queue_work(cpu, work_buf);
 }
 
@@ -411,6 +438,8 @@ static bool queue_stop_cpus_work(const struct cpumask *cpumask,
 		work->arg = arg;
 		work->done = done;
 		work->caller = _RET_IP_;
+		work->rec = WORK_NO_REC;
+		work->exec_state = WORK_INIT;
 		if (cpu_stop_queue_work(cpu, work))
 			queued = true;
 	}
@@ -496,6 +525,8 @@ static void cpu_stopper_thread(unsigned int cpu)
 		work = list_first_entry(&stopper->works,
 					struct cpu_stop_work, list);
 		list_del_init(&work->list);
+		if (work->rec == WORK_REC)
+			stopper->exec_state = WORK_PREP_EXEC;
 	}
 	raw_spin_unlock_irq(&stopper->lock);
 
@@ -572,7 +603,8 @@ static int __init cpu_stop_init(void)
 
 	for_each_possible_cpu(cpu) {
 		struct cpu_stopper *stopper = &per_cpu(cpu_stopper, cpu);
-
+		stopper->exec_state = WORK_INIT;
+		stopper->stopper_wakeq = WAKEQ_ADD_OK;
 		raw_spin_lock_init(&stopper->lock);
 		INIT_LIST_HEAD(&stopper->works);
 	}
-- 
2.45.2

