Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEF1898E9
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619801; cv=none; b=t1/1myYb4iAWo6p0dt82WPivteFzHC5Ic4wQYtOQRCzW7KQjPj2WN2P6lJEtGC54O1g+AXi4yLdDJaOYGrQEa/dykIvqqINstt8LxtdfZ96NveY+EHKerr5eIvlZa+p+sbFhswaDkxvWbMw5vJCUIdr9n1twPGS4JIHs9NUOu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619801; c=relaxed/simple;
	bh=asyHcdzyNWikBeeqxsbYZEYXY/aebJF30fkQ+PKGu20=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbH6IEJeA6GynnrzJZhrWRoVQ90Ir0mP5OVuwJiz/OxsV3TnyjyO8JeP6vde227g9u5ZMSW2Jb3858tS/20ah/YdFz4LTojnhnDWwddWglxzym6ALs0N49dIS9La2Lnk0xMYdMlri1TQk6qLLCiHhvPtTC5sHX+Alawf2iUObsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y2zYrfrC; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y2zYrfrC"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MGqXGu005304;
	Sun, 22 Jun 2025 19:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=zLNLe
	qc67XXczlfuh3Ldv7/FmHRtP6z/EXyIxxnh7Ys=; b=Y2zYrfrCgAIpIsNtEK/E1
	so4jEVPrRsmSai9YI84ysc0BHqI+wghr+NkcGCfUbyIej4ujOgHmsyCdbeq/OQsn
	WZP5UEMxct3FTMDR/9K31tyAjJesOpdgbGWzrKZICyl4Q5MqJdW0tOZ9aYQLUGBS
	qphJ9DYIsiByfuwgiF1vuOznwdPhfNOcpSkm5LaeEabeByTkP1Lj6Pju6y3r1dsa
	SuJYKKAoLwkoNZKNCfCCnYopSKD0ymc/3p99a2IEuplznUX1H9VrVczYNMTrXl6S
	I0j4JUwqMIGysssqamvO9AfL3PXKEfmsJ0L+RDs2k+pC7Uw/Cf86pIjxJ8zWONzg
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7886b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MIUPbP039375;
	Sun, 22 Jun 2025 19:16:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr2mp2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:26 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MJGQSb024048;
	Sun, 22 Jun 2025 19:16:26 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehr2mp2j-2;
	Sun, 22 Jun 2025 19:16:26 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Dhaval Giani" <dhaval@gianis.ca>, "Jonathan Corbet" <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, chyser@yahoo.com
Subject: [PATCH 1/2 v3] sched/numa: Add ability to override task's numa_preferred_nid.
Date: Sun, 22 Jun 2025 15:15:35 -0400
Message-ID: <20250622191622.3296825-2-chris.hyser@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250622191622.3296825-1-chris.hyser@oracle.com>
References: <20250622191622.3296825-1-chris.hyser@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506220123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDEyMyBTYWx0ZWRfX7n0lgfgqCMQl Sr0bxz461sCzYNgjs8gXzxweVUwPiLjOktEfLAq4F7kCsNqlOzPFR7kNWtQhj18OUsMBagcVQeY jHc0rsBuRAaS/5/P81LNZA2XryWb2YGZlTJX7/rA5COoaEYAefxMBt5ugpNjRmjwnp9ZbCJl9yU
 k0k6ACQ++IPUWScte3lYkH0EtuBOzx1+/KkJERJaXCK8y/RKNnqPsycVLxkgcX+5XgFtxhVHTfM Ond3HJ1JJt4mvoclIGTrYnV7gtv/rVuRLKUxgqlYwaNsKiIB90RfZ35gmmv3Bw3X/YHJIuK+F+a +MBDMsVl7KU1X1nNRWE9WbO9ouEvN7PiDAvmGvQc9aUJt0AO76AS90JdumuYMaFIz+vUgJu1Puh
 FBf2Z1jabbkQ5DN/xbfZ9x1JWyUKdTwDtqAYOIeIirjNXXoLMyC407U61ICF15dqDdySk55l
X-Proofpoint-GUID: OmOAHce9nC8xiLLezN_ukEoaC2bZAHxc
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=6858568b b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=hjGhWYQTXLs2LAqNP0sA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13206
X-Proofpoint-ORIG-GUID: OmOAHce9nC8xiLLezN_ukEoaC2bZAHxc

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
 kernel/sched/fair.c   | 11 +++++++++--
 5 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index eec6b225e9d1..bd5a307fed1e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1345,6 +1345,7 @@ struct task_struct {
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
index 2f8caa9db78d..f11755a54afd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7861,7 +7861,10 @@ void sched_setnuma(struct task_struct *p, int nid)
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
index f16d53928bb9..590310b8cf7a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1137,6 +1137,7 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 		P(mm->numa_scan_seq);
 
 	P(numa_pages_migrated);
+	P(numa_preferred_nid_force);
 	P(numa_preferred_nid);
 	P(total_numa_faults);
 	SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..b5c4a2507021 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2626,7 +2626,10 @@ static void numa_migrate_preferred(struct task_struct *p)
 	unsigned long interval = HZ;
 
 	/* This task has no NUMA fault statistics yet */
-	if (unlikely(p->numa_preferred_nid == NUMA_NO_NODE || !p->numa_faults))
+	if (unlikely(p->numa_preferred_nid == NUMA_NO_NODE))
+		return;
+
+	if (p->numa_preferred_nid_force == NUMA_NO_NODE && !p->numa_faults)
 		return;
 
 	/* Periodically retry migrating the task to the preferred node */
@@ -3571,6 +3574,7 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 
 	/* New address space, reset the preferred nid */
 	if (!(clone_flags & CLONE_VM)) {
+		p->numa_preferred_nid_force = NUMA_NO_NODE;
 		p->numa_preferred_nid = NUMA_NO_NODE;
 		return;
 	}
@@ -9210,7 +9214,10 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 	if (!static_branch_likely(&sched_numa_balancing))
 		return 0;
 
-	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
+	if (p->numa_preferred_nid_force == NUMA_NO_NODE && !p->numa_faults)
+		return 0;
+
+	if (!(env->sd->flags & SD_NUMA))
 		return 0;
 
 	src_nid = cpu_to_node(env->src_cpu);
-- 
2.43.5

