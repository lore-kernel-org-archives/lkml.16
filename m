Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE31EBFFF
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746216761; cv=none; b=VLNnBhCV5TOC/iXqYqQ4AKqtZDHWFmU0N/oiz8fBfT0aVk1ZjcL8cuzh91aX/0GmRpSn4TTWOWJ1hZxMNPbWvPRUlidpg8l/kPujZDiPPhK2GlIvitaE8SVYDyXMg28SaKtwwE1SoVhbtBPSZSQJSqwBX9QUtPd4kg/+QhMoReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746216761; c=relaxed/simple;
	bh=p3B2nfPE8QwHYR+zmqzvHe4k7bgYrvqEM+/3KwFxr1w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaH+Y8RqYzHUzsoBjnYynZjDWlu+JKMZx/42LtOZqMLNKSfe0lIGiXIazldbr5WHlDZbnmukknadiMdukeCetBUz2e0HVu2gTyLBcQUAw9hn43EV2lJMB8o76KnvXWFfnQCgGpPNGi6Zq+rORxASgEoO8o9x/f1c4ELxrcpMsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nGIe3I8/; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nGIe3I8/"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542ItwNi021016;
	Fri, 2 May 2025 19:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=QVIvK
	xugLN/IBEos0H/iKCLQbIdmIzlG7+JrQ2WMzos=; b=nGIe3I8/rLi03eeIM4AGZ
	tWkTCFZR9qtQnsxIzqudhI54FMb2/fcee6rM8653U/x+wSj1QeMvBqAbM8SSU7Ia
	2rHb9FMc3SytirRmzNg7gb/YIfCzHxclqiu4RpSi/ejrhSpcXvfKqF4NLV4LSvXh
	6amGGFgN+XwGj/mu9QIb7mxe5OmZU7piQ2FC0OXLySxnEH/9WZ/InIZL91Qk5TD1
	UlUdM9To6fXPqma7lIGfVpdAHLz/TnrOVh4CnQDWppmfGdp83/MzoNYG/hNro5M7
	FygivCOFXl4xTKp9UwUjvdTSWKhPAqpmMmX+J/+4QVIja4JdYWo+BVeCtE50Rao0
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6umdvr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542Iepmn023726;
	Fri, 2 May 2025 19:01:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxmc197-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:04 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 542J12rH022528;
	Fri, 2 May 2025 19:01:04 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 468nxmc184-2;
	Fri, 02 May 2025 19:01:04 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Mel Gorman" <mgorman@suse.de>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
Date: Fri,  2 May 2025 14:59:41 -0400
Message-ID: <20250502190059.4121320-2-chris.hyser@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250502190059.4121320-1-chris.hyser@oracle.com>
References: <20250502190059.4121320-1-chris.hyser@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020153
X-Authority-Analysis: v=2.4 cv=dfSA3WXe c=1 sm=1 tr=0 ts=68151671 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=ZV2RWA6qNQhVJjVnkKQA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13130
X-Proofpoint-GUID: cRFtdR0oOe1zvPDWrL3GSHWs965pW4l_
X-Proofpoint-ORIG-GUID: cRFtdR0oOe1zvPDWrL3GSHWs965pW4l_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1MiBTYWx0ZWRfX5SVAI9tOqblo /b8uk5e6E/uOkzSoi72pw8TV3WYuKI8BXyB5s+RDxWPFT2+Qf/NpkUJ6UUJKhCliYyBmmdEclDu /my7emWtYfqTgKu7QrZtLn7+mzfGpI4RnxbpMtXNRoYC4dJRAfwTkAD7rWmkDw0Nf0Xaa5aFjS6
 qR1lY+9tlYlWclZGcZa3mY7UBPIA02Av4tMu4c1DwPIuMpZgwLBzVZPhwK1rwjB3I+Wwra9xh8d n2/q4gB7O9NfccSZazkEFs0bGADXP67YsIRlJhH1UghXz5KetoPML76Zd6R9P9hmyFKbBfUEWrO SGQxdwMyrBP/VDwPbKZzx9051nOghjSad9lhwOjxsHyyrGxPLDo9nAXTb/J6t6WTCxZp2S7ci3v
 27ZCtdfJsMIeDvM98fHXH+a6BsyUmV8umzppFSraI5W948N0h0riRv7yW8W2cUgzc/pvdpst

This patch allows directly setting and subsequent overriding of a task's
"Preferred Node Affinity" by setting the task's numa_preferred_nid and
relying on the existing NUMA balancing infrastructure.

NUMA balancing introduced the notion of tracking and using a task's
preferred memory node for both migrating/consolidating the physical pages
accessed by a task and to assist the scheduler in making NUMA aware
placement and load balancing decisions.

The existing mechanism for determining this, Auto NUMA Balancing, relies on
periodic removal of virtual mappings for blocks of a task's address space.
The resulting faults can indicate a task's preference for an accessed node.

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
was a 2-node AMD machine with a database running on each node with local
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

The primary advantage of PNA and ANB on is that the resulting NUMA hint
faults are also used to periodically check that a task is on it's preferred
node perhaps having been migrated during load balancing.

In benchmarks pinning large regions of heavily accessed memory, the
advantages of the prctl() over Auto NUMA Balancing alone is significantly
higher.

Suggested-by: Peter Zijlstra<peterz@infradead.org>
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
index 79692f85643f..3488450ee16e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7980,7 +7980,10 @@ void sched_setnuma(struct task_struct *p, int nid)
 	if (running)
 		put_prev_task(rq, p);
 
-	p->numa_preferred_nid = nid;
+	if (unlikely(p->numa_preferred_nid_force != NUMA_NO_NODE))
+		p->numa_preferred_nid = p->numa_preferred_nid_force;
+	else
+		p->numa_preferred_nid = nid;
 
 	if (queued)
 		enqueue_task(rq, p, ENQUEUE_RESTORE | ENQUEUE_NOCLOCK);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 557246880a7e..a52ba5cf033c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1158,6 +1158,7 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 		P(mm->numa_scan_seq);
 
 	P(numa_pages_migrated);
+	P(numa_preferred_nid_force);
 	P(numa_preferred_nid);
 	P(total_numa_faults);
 	SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8..26781452c636 100644
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
@@ -9303,7 +9310,11 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
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

