Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E32126C17
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996490; cv=none; b=sK29zwdr/n5/l7voAPnKcziNxZ+cZ+E4rUKOM/p1Zy2Ld4y7FQm/gtkM3nOIxFkj/J7waXvd2j3ldPGQXfhBXZ3eF9sNCPaEMK9MirCurt++97w1OA9hjI1bc2g4tRH4E5EAUhdBpVYIQvcfyG7O4mWGE8qeGgiWGkUxoGDM1+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996490; c=relaxed/simple;
	bh=mo4UYzAPRGQ5Ylm3f5lg6SHdT1ZrpuHPYHJJfR9miOw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZwLfsuxg6GtvfuA/8dtOcyNb6AHKSwDJI7t5BrbDO1S1YK1GJRgKIzHMnkm1K7BBTtnSCqkMlD+G1zj4U7sPZH2vU9g5V+U6R3gUJfgxWnPYBD+WQNpSOk9jBEDpYc89gL0QKR+ixfbOAyMYLYGCQcVr8Sw8X6CulzDGFo2fYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bT1lw5FPWz10XcV;
	Fri, 27 Jun 2025 11:50:04 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D24E41402EA;
	Fri, 27 Jun 2025 11:54:42 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 11:54:32 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 11:54:31 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>
Subject: [PATCH] sched/deadline: Don't count nr_running twice for dl_server proxy tasks
Date: Fri, 27 Jun 2025 11:54:20 +0800
Message-ID: <20250627035420.37712-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)

From: Yicong Yang <yangyicong@hisilicon.com>

On CPU offline the kernel stalled with below call trace:

  INFO: task kworker/0:1:11 blocked for more than 120 seconds.
        Tainted: G           O        6.15.0-rc4+ #1
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:1     state:D stack:0     pid:11    tgid:11    ppid:2   task_flags:0x4208060 flags:0x00000008
  Workqueue: events vmstat_shepherd
  Call trace:
   __switch_to+0x118/0x188 (T)
   __schedule+0x31c/0x1300
   schedule+0x3c/0x120
   percpu_rwsem_wait+0x12c/0x1b0
   __percpu_down_read+0x78/0x188
   cpus_read_lock+0xc4/0xe8
   vmstat_shepherd+0x30/0x138
   process_one_work+0x154/0x3c8
   worker_thread+0x2e8/0x400
   kthread+0x154/0x230
   ret_from_fork+0x10/0x20
  INFO: task kworker/1:1:116 blocked for more than 120 seconds.
        Tainted: G           O        6.15.0-rc4+ #1
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/1:1     state:D stack:0     pid:116   tgid:116   ppid:2   task_flags:0x4208060 flags:0x00000008
  Workqueue: events work_for_cpu_fn
  Call trace:
   __switch_to+0x118/0x188 (T)
   __schedule+0x31c/0x1300
   schedule+0x3c/0x120
   schedule_timeout+0x10c/0x120
   __wait_for_common+0xc4/0x1b8
   wait_for_completion+0x28/0x40
   cpuhp_kick_ap_work+0x114/0x3c8
   _cpu_down+0x130/0x4b8
   __cpu_down_maps_locked+0x20/0x38
   work_for_cpu_fn+0x24/0x40
   process_one_work+0x154/0x3c8
   worker_thread+0x2e8/0x400
   kthread+0x154/0x230
   ret_from_fork+0x10/0x20

cpuhp hold the cpu hotplug lock endless and stalled vmstat_shepherd.
This is because we count nr_running twice on cpuhp enqueuing and failed
the wait condition of cpuhp:

enqueue_task_fair() // pick cpuhp from idle, rq->nr_running = 0
  dl_server_start()
    [...]
    add_nr_running() // rq->nr_running = 1
  add_nr_running() // rq->nr_running = 2
[switch to cpuhp, waiting on balance_hotplug_wait()]
rcuwait_wait_event(rq->nr_running == 1 && ...) // failed, rq->nr_running=2
  schedule() // wait again

This doesn't make sense to count one single task twice on
rq->nr_running. So fix this.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 kernel/sched/deadline.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..59fb178762ee 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1894,7 +1894,9 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 	u64 deadline = dl_se->deadline;
 
 	dl_rq->dl_nr_running++;
-	add_nr_running(rq_of_dl_rq(dl_rq), 1);
+
+	if (!dl_server(dl_se))
+		add_nr_running(rq_of_dl_rq(dl_rq), 1);
 
 	inc_dl_deadline(dl_rq, deadline);
 }
@@ -1904,7 +1906,9 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 {
 	WARN_ON(!dl_rq->dl_nr_running);
 	dl_rq->dl_nr_running--;
-	sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+
+	if (!dl_server(dl_se))
+		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
 
 	dec_dl_deadline(dl_rq, dl_se->deadline);
 }
-- 
2.24.0

