Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83375192D97
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681007; cv=none; b=GR4SrGPaX1T0kGGrldzL3EKDerqVOwljMJzR/Vso7ZcPMyBQVFCdW2PfGFyeUD7djNBU5f81Ldw7tnOhor3UsD6ra18GvMQS1ccQYTTJt0BEhe49tPC/8Eq0mI6q3oEf/cVKwIsNOQlhbS1vEe7VUFm1RsHzrP5KJn+CpAZMi9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681007; c=relaxed/simple;
	bh=s37VCGQ70TpVRZ/EdWj0zhN6LAyoGeJW4ovKbRw6jqM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OeAQ4ge2fzi8R8qFD8tfp2jeYomO9BMVdenOBASBHJa6L8FzqyadDcNuUl9CCP/qKSUzby7waEop7/Pl2sneXnLdKuPvB9QPaFfqAl6LJqnILCJRqjAEd2nqYyHzIeXEVMF9zZZtObb9dE3hoExxBjJBxq63K6PBBtNIw4PuOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aI2z3lL2; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aI2z3lL2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELBn88032454;
	Tue, 15 Apr 2025 01:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=IQN6mVDrzf8aRU1P6EjOqd3AfVUYS
	Y28XqT4042MPQk=; b=aI2z3lL2r99UlWIzFk9d5qVn0BmdD7VShg7h9cHkHbbXa
	8ev9gQKU1/6z0cB+zWgajyYaOjW97ZNjLPjyRAmAOhfFVwNMRKjVYzi2/paGYbtJ
	LIK/A8D3ZKWi+ShMszD6EbR3V/lnv7Qd8kA1gO3j5RMOlbPzB2dJosbHgXGUdduE
	PwOQOr5Et8meApZrh8j+wPWjCtwT88CbRVVDslL7RUji5593fiLSX+lgBvXVaVQ+
	OnvrB6WOwB1u89aalHaHODIHUFmtbJ3+oCuSy/HGCCxac3X2wOHbVIMVuVuJLY6K
	5XvO9+TNGaZxJFrtQG/SmOPRtEsgEFw3LhBIAj4sA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617ju8k3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 01:36:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53F07mVe005744;
	Tue, 15 Apr 2025 01:36:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5ugp7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 01:36:27 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53F1aQht036019;
	Tue, 15 Apr 2025 01:36:26 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5ugp7b-1;
	Tue, 15 Apr 2025 01:36:26 +0000
From: Chris Hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Mel Gorman" <mgorman@techsingularity.net>, longman@redhat.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
Date: Mon, 14 Apr 2025 21:35:51 -0400
Message-ID: <20250415013625.3922497-1-chris.hyser@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150007
X-Proofpoint-GUID: 80jg5SCNXB5i_IpxG9VTEqr6C3-yWga4
X-Proofpoint-ORIG-GUID: 80jg5SCNXB5i_IpxG9VTEqr6C3-yWga4

From: chris hyser <chris.hyser@oracle.com>

This patch allows directly setting and subsequent overriding of a task's
"Preferred Node Affinity" by setting the task's numa_preferred_nid and
relying on the existing NUMA balancing infrastructure.

NUMA balancing introduced the notion of tracking and using a task's
preferred memory node for both migrating/consolidating the physical pages
accessed by a task and to assist the scheduler in making NUMA aware
placement and load balancing decisions.

The existing mechanism for determining this, Auto NUMA Balancing, relies
on periodic removal of virtual mappings for blocks of a task's address
space. The resulting faults can indicate a preference for an accessed
node.

This has two issues that this patch seeks to overcome:

- there is a trade-off between faulting overhead and the ability to detect
  dynamic access patterns. In cases where the task or user understand the
  NUMA sensitivities, this patch can enable the benefits of setting a
  preferred node used either in conjunction with Auto NUMA Balancing's
  default parameters or adjusting the NUMA balance parameters to reduce the
  faulting rate (potentially to 0).

- memory pinned to nodes or to physical addresses such as RDMA cannot be
  migrated and have thus far been excluded from the scanning. Not taking
  those faults however can prevent Auto NUMA Balancing from reliably
  detecting a node preference with the scheduler load balancer then
  possibly operating with incorrect NUMA information.

The following results were from TPCC runs on an Oracle Database. The system
was a 2-node Intel machine with a database running on each node with local
memory allocations. No tasks or memory were pinned.

There are four scenarios of interest:

- Auto NUMA Balancing OFF.
    base value

- Auto NUMA Balancing ON.
    1.2% - ANB ON better than ANB OFF.

- Use the prctl(), ANB ON, parameters set to prevent faulting.
    2.4% - prctl() better then ANB OFF.
    1.2% - prctl() better than ANB ON.

- Use the prctl(), ANB parameters normal.
    3.1% - prctl() and ANB ON better than ANB OFF.
    1.9% - prctl() and ANB ON better than just ANB ON.
    0.7% - prctl() and ANB ON better than prctl() and ANB ON/faulting off

In benchmarks pinning large regions of heavily accessed memory, the
advantages of the prctl() over Auto NUMA Balancing alone is significantly
higher.

Signed-off-by: Chris Hyser <chris.hyser@oracle.com>
---
 include/linux/sched.h |  1 +
 init/init_task.c      |  1 +
 kernel/sched/core.c   |  5 ++++-
 kernel/sched/debug.c  |  1 +
 kernel/sched/fair.c   | 15 +++++++++++++--
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..373046c82b35 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1350,6 +1350,7 @@ struct task_struct {
 	short				pref_node_fork;
 #endif
 #ifdef CONFIG_NUMA_BALANCING
+	int				numa_preferred_nid_force;
 	int				numa_scan_seq;
 	unsigned int			numa_scan_period;
 	unsigned int			numa_scan_period_max;
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..1921a87326db 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -184,6 +184,7 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 	.vtime.state	= VTIME_SYS,
 #endif
 #ifdef CONFIG_NUMA_BALANCING
+	.numa_preferred_nid_force = NUMA_NO_NODE,
 	.numa_preferred_nid = NUMA_NO_NODE,
 	.numa_group	= NULL,
 	.numa_faults	= NULL,
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 79692f85643f..7d1532f35d15 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7980,7 +7980,10 @@ void sched_setnuma(struct task_struct *p, int nid)
 	if (running)
 		put_prev_task(rq, p);
 
-	p->numa_preferred_nid = nid;
+	if (p->numa_preferred_nid_force != NUMA_NO_NODE)
+		p->numa_preferred_nid = p->numa_preferred_nid_force;
+	else
+		p->numa_preferred_nid = nid;
 
 	if (queued)
 		enqueue_task(rq, p, ENQUEUE_RESTORE | ENQUEUE_NOCLOCK);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 56ae54e0ce6a..4cba21f5d24d 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1154,6 +1154,7 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 		P(mm->numa_scan_seq);
 
 	P(numa_pages_migrated);
+	P(numa_preferred_nid_force);
 	P(numa_preferred_nid);
 	P(total_numa_faults);
 	SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c19459c8042..79d3d0840fb2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2642,9 +2642,15 @@ static void numa_migrate_preferred(struct task_struct *p)
 	unsigned long interval = HZ;
 
 	/* This task has no NUMA fault statistics yet */
-	if (unlikely(p->numa_preferred_nid == NUMA_NO_NODE || !p->numa_faults))
+	if (unlikely(p->numa_preferred_nid == NUMA_NO_NODE))
 		return;
 
+	/* Execute rest of function if forced PNID */
+	if (p->numa_preferred_nid_force == NUMA_NO_NODE) {
+		if (unlikely(!p->numa_faults))
+			return;
+	}
+
 	/* Periodically retry migrating the task to the preferred node */
 	interval = min(interval, msecs_to_jiffies(p->numa_scan_period) / 16);
 	p->numa_migrate_retry = jiffies + interval;
@@ -3578,6 +3584,7 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 
 	/* New address space, reset the preferred nid */
 	if (!(clone_flags & CLONE_VM)) {
+		p->numa_preferred_nid_force = NUMA_NO_NODE;
 		p->numa_preferred_nid = NUMA_NO_NODE;
 		return;
 	}
@@ -9301,7 +9308,11 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 	if (!static_branch_likely(&sched_numa_balancing))
 		return 0;
 
-	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
+	/* Execute rest of function if forced PNID */
+	if (p->numa_preferred_nid_force == NUMA_NO_NODE && !p->numa_faults)
+		return 0;
+
+	if (!(env->sd->flags & SD_NUMA))
 		return 0;
 
 	src_nid = cpu_to_node(env->src_cpu);
-- 
2.43.5

