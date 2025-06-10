Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63A28751C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546014; cv=none; b=VddqHFeuYBokI2jd4GvZNEVHLzghBvSuvnESAjkMsXJDp7iQ5oDot6KgWUMBJlOZMut92xCrnpZL97gjy6MyqomozvtHbCkf+ybx+QZogY/v5LcmmcqnnxJjPdsqVJFsBL0q10dpFyWLHXsr9XbAbMx8N60AeoBwR+fhbFKsNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546014; c=relaxed/simple;
	bh=2AKe+1Q7IwadvPQF7RGlzNygFRpcm0QbIRFUcvpSxiw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AUAf5hFK1qTsVEKdVIPH1uokmRDkXtHc9uBuhhmaltBSOsMapOliHGH/GN8XAgJ/uyn0E0SoCqRSEGk2FtGjmZalH1RnPDAlVjVX6uZzi8TEAvAZNLfpVSbhKe+VPqsa6xfG/5VhSSgySJxjuHzxc1yr5kTNtdwfCEPS81As9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bGjNg25j7zYlGbH;
	Tue, 10 Jun 2025 16:57:39 +0800 (CST)
Received: from a002.hihonor.com (10.68.31.193) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 16:59:46 +0800
Received: from a007.hihonor.com (10.68.22.31) by a002.hihonor.com
 (10.68.31.193) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 16:59:46 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Tue, 10 Jun 2025 16:59:46 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Tejun Heo' <tj@kernel.org>
CC: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: [PATCH] sched_ext: introduce cpu tick
Thread-Topic: [PATCH] sched_ext: introduce cpu tick
Thread-Index: AdvZ5c7hIXmwXDnLSNSIS/I8Ivaoag==
Date: Tue, 10 Jun 2025 08:59:45 +0000
Message-ID: <2d771c1f293845e09edf73f5db5b2837@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Assume one CPU is running one RT task and one runnable scx task on
its local dsq, the scx task cannot be scheduled until RT task enters
sleep, if RT task will run for 100ms, the scx task should be migrated
to other dsqs, then it can have a chance to be scheduled by other CPUs.

So cpu_tick is added to notitfy BPF scheduler to check long runnable
scx on its local dsq, related policy can be taken to improve the
performance.

Signed-off-by: liuwenfang liuwenfang@honor.com
---
 kernel/sched/ext.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249f..2232f616c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -337,6 +337,16 @@ struct sched_ext_ops {
 	 */
 	void (*tick)(struct task_struct *p);
=20
+	/**
+	 * @tick: Periodic tick
+	 * @rq: current CPU's rq
+	 *
+	 * This operation is called every 1/HZ seconds on each CPU which is
+	 * not idle. Notify BPF scheduler to take policy for runnable tasks
+	 * on local dsq.
+	 */
+	void (*cpu_tick)(struct rq *rq);
+
 	/**
 	 * @runnable: A task is becoming runnable on its associated CPU
 	 * @p: task becoming runnable
@@ -3569,6 +3579,9 @@ void scx_tick(struct rq *rq)
 	}
=20
 	update_other_load_avgs(rq);
+
+	if (SCX_HAS_OP(cpu_tick))
+		SCX_CALL_OP(SCX_KF_REST, cpu_tick, rq);
 }
=20
 static void task_tick_scx(struct rq *rq, struct task_struct *curr, int que=
ued)
@@ -5753,6 +5766,7 @@ static void sched_ext_ops__enqueue(struct task_struct=
 *p, u64 enq_flags) {}
 static void sched_ext_ops__dequeue(struct task_struct *p, u64 enq_flags) {=
}
 static void sched_ext_ops__dispatch(s32 prev_cpu, struct task_struct *prev=
__nullable) {}
 static void sched_ext_ops__tick(struct task_struct *p) {}
+static void sched_ext_ops__cpu_tick(struct rq *rq) {}
 static void sched_ext_ops__runnable(struct task_struct *p, u64 enq_flags) =
{}
 static void sched_ext_ops__running(struct task_struct *p) {}
 static void sched_ext_ops__stopping(struct task_struct *p, bool runnable) =
{}
@@ -5790,6 +5804,7 @@ static struct sched_ext_ops __bpf_ops_sched_ext_ops =
=3D {
 	.dequeue		=3D sched_ext_ops__dequeue,
 	.dispatch		=3D sched_ext_ops__dispatch,
 	.tick			=3D sched_ext_ops__tick,
+	.cpu_tick		=3D sched_ext_ops__cpu_tick,
 	.runnable		=3D sched_ext_ops__runnable,
 	.running		=3D sched_ext_ops__running,
 	.stopping		=3D sched_ext_ops__stopping,
--=20
2.17.1
