Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250914A639
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179549; cv=none; b=O9h2NOj1hM2SoyVyWObJQAaDs1+TojknR8E2yp2nTHoRMFDYojEpUw50lLRCafu8VD9K4HffQkmXfi/bzyuETLp7tHc7A1FI11gTQxr6gVEQZC9NoM79WCy7MGUYLbE5es8vvvjBrbFclslp8fro0wb3gxo6Eu/6LKM3x0MF/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179549; c=relaxed/simple;
	bh=3RMmciCyCwHu9BLk5XamwghxEuPPOP5ZD0ERW6yvqO4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qrcMcFLx0DlevY6RYePkxp9X1CmJ5u0yShKk0Ra7cDaz/6rek9CXvaRDkF4c7vxpHFSQ1or3EOmqGb2oe5xsTItAlP3zJA0+rtrZ8yCgiiGvrTPzZJmCdPdjmymjcOQf0lZSXF327IvyZeRmS12tZxcGrmNga40h+GYAObicgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: lirongqing <lirongqing@baidu.com>
To: <tj@kernel.org>, <void@manifault.com>, <arighi@nvidia.com>,
	<changwoo@igalia.com>, <mingo@redhat.com>, <peterz@infradead.org>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] sched_ext: Take NUMA node into account when allocating per-CPU cpumasks
Date: Mon, 10 Feb 2025 16:52:25 +0800
Message-ID: <20250210085225.3272-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) To
 BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2025-02-10 16:52:31:957
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2025-02-10 16:52:31:973
X-FEAS-Client-IP: 10.127.64.38
X-FE-Policy-ID: 52:10:53:SYSTEM

From: Li RongQing <lirongqing@baidu.com>

per-CPU cpumasks are dominantly accessed from their own local CPUs,
so allocate them node-local to improve performance.

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 kernel/sched/ext.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8857c07..3fe5a2e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -6325,15 +6325,16 @@ void __init init_sched_ext_class(void)
 
 	for_each_possible_cpu(cpu) {
 		struct rq *rq = cpu_rq(cpu);
+		int  n = cpu_to_node(cpu);
 
 		init_dsq(&rq->scx.local_dsq, SCX_DSQ_LOCAL);
 		INIT_LIST_HEAD(&rq->scx.runnable_list);
 		INIT_LIST_HEAD(&rq->scx.ddsp_deferred_locals);
 
-		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick, GFP_KERNEL));
-		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL));
-		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_preempt, GFP_KERNEL));
-		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_wait, GFP_KERNEL));
+		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick, GFP_KERNEL, n));
+		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL, n));
+		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_preempt, GFP_KERNEL, n));
+		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_wait, GFP_KERNEL, n));
 		init_irq_work(&rq->scx.deferred_irq_work, deferred_irq_workfn);
 		init_irq_work(&rq->scx.kick_cpus_irq_work, kick_cpus_irq_workfn);
 
-- 
2.9.4

