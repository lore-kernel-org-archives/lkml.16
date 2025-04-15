Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83324190685
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681007; cv=none; b=HqmmoxSbbL6Ot49PRVTSthmHVTHVadJqizmF78hvuXe7d2E9RSir6LJA5S97NB6IMNwTRnM4+9Eb7HPWm51vKRTuq6jxAxhf53h+NyeD9KPv4ZC+aa3g1LQ60IxlV3vIyJSGcy/GCOAWI3fR76GLvkmQN3XM+nCCY2P3vSZAOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681007; c=relaxed/simple;
	bh=gADm3/Y4P4ZrW0hFQfEijw0B89zbDWcTFKMaXN7OwO4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnMgvWvELH8OoznKGf6+Wkg1p9Un74q9diU05KUxgPIEZBLTMkyauI9FM+5FRakrFo3zmwukGbCE/kpsHSymJWUzJlS/AfXE57zWA8i8JOqysC7W+ivfk5VPdhAnLKCPLTlFp7XMnxodrlyeVYAyr0Irkwi9eTfUdYayZp6AHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e3npqfwG; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e3npqfwG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELBmAE032445;
	Tue, 15 Apr 2025 01:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=da3rK
	cYd8C4pHbKnxGP3i1/pN0Mu8nedWX8RBV62q6o=; b=e3npqfwGJymaN/+AqQ2+8
	xRJrzskVADf5bc/TUePXC7Lj3k9y79cjdmGpCS0PJv0R4mqWy8i+2NkmIyu6JT+w
	fNr7cEgEm2+dnL1gkLJLX+M9rp0qGTh+BfQRMAV7mCnnSDxr2AJtONn0l7VZxvsF
	1R+l5Zbnd1By8XHbXppdGyPhX8bYyM5w3G6rw8gSoaX+MXe2OEAIo8e4Ho0J9iwC
	LUeKdczx5bcZaVmg51wKbdqukhX6vvL5e6RN29DdXJMZCCQ/YYsn/l1RgjCH7w/8
	BWoBrWbfwf4ycs+eHXq+MAgsa6aGsu5BSdT610Nm57M7RUnnPGv3Kxs6F/trVe95
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617ju8k3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 01:36:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ENvSlr005705;
	Tue, 15 Apr 2025 01:36:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5ugp8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 01:36:28 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53F1aQhv036019;
	Tue, 15 Apr 2025 01:36:27 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5ugp7b-2;
	Tue, 15 Apr 2025 01:36:27 +0000
From: Chris Hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Mel Gorman" <mgorman@techsingularity.net>, longman@redhat.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched/numa: prctl to set/override task's numa_preferred_nid
Date: Mon, 14 Apr 2025 21:35:52 -0400
Message-ID: <20250415013625.3922497-2-chris.hyser@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250415013625.3922497-1-chris.hyser@oracle.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
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
X-Proofpoint-GUID: pEkg6NLtxNeFcNZXoObOLeIZH-7mX7jY
X-Proofpoint-ORIG-GUID: pEkg6NLtxNeFcNZXoObOLeIZH-7mX7jY

From: chris hyser <chris.hyser@oracle.com>

Adds a simple prctl() interface to enable setting or reading a task's
numa_preferred_nid. Once set this value will override any value set
by auto NUMA balancing.

Signed-off-by: Chris Hyser <chris.hyser@oracle.com>
---
 .../scheduler/sched-preferred-node.rst        | 67 +++++++++++++++++++
 include/linux/sched.h                         |  9 +++
 include/uapi/linux/prctl.h                    |  8 +++
 kernel/sched/fair.c                           | 64 ++++++++++++++++++
 kernel/sys.c                                  |  5 ++
 tools/include/uapi/linux/prctl.h              |  6 ++
 6 files changed, 159 insertions(+)
 create mode 100644 Documentation/scheduler/sched-preferred-node.rst

diff --git a/Documentation/scheduler/sched-preferred-node.rst b/Documentation/scheduler/sched-preferred-node.rst
new file mode 100644
index 000000000000..753fd0b20993
--- /dev/null
+++ b/Documentation/scheduler/sched-preferred-node.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Prctl for Explicitly Setting Task's Preferred Node
+####################################################
+
+This feature is an addition to Auto NUMA Balancing. Auto NUMA balancing by
+default scans a task's address space removing address translations such that
+subsequent faults can indicate the predominant node from which memory is being
+accessed. A task's numa_preferred_nid is set to the node ID.
+
+The numa_preferred_nid is used to both consolidate physical pages and assist the
+scheduler in making NUMA friendly load balancing decisions.
+
+While quite useful for some workloads, this has two issues that this prctl() can
+help solve:
+
+- There is a trade-off between faulting overhead and the ability to detect
+dynamic access patterns. In cases where the task or user understand the NUMA
+sensitivities, this patch can enable the benefits of setting a preferred node
+used either in conjunction with Auto NUMA Balancing's default parameters or
+adjusting the NUMA balance parameters to reduce the faulting rate
+(potentially to 0).
+
+- Memory pinned to nodes or to physical addresses such as RDMA cannot be
+migrated and have thus far been excluded from the scanning. Not taking
+those faults however can prevent Auto NUMA Balancing from reliably detecting a
+node preference with the scheduler load balancer then possibly operating with
+incorrect NUMA information.
+
+
+Usage
+*******
+
+    Note: Auto NUMA Balancing must be enabled to get the effects.
+
+    #include <sys/prctl.h>
+
+    int prctl(int option, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned long arg5);
+
+option:
+    ``PR_PREFERRED_NID``
+
+arg2:
+    Command for operation, must be one of:
+
+    - ``PR_PREFERRED_NID_GET`` -- get the forced preferred node ID for ``pid``.
+    - ``PR_PREFERRED_NID_SET`` -- set the forced preferred node ID for ``pid``.
+
+    Returns ERANGE for an illegal command.
+
+arg3:
+    ``pid`` of the task for which the operation applies. ``0`` implies current.
+
+    Returns ESRCH if ``pid`` is not found.
+
+arg4:
+    ``node_id`` for PR_PREFERRED_NID_SET. Between ``-1`` and ``num_possible_nodes()``.
+    ``-1`` indicates no preference.
+
+    Returns EINVAL for an illegal command.
+
+arg5:
+    userspace pointer to an integer for returning the Node ID from
+    ``PR_PREFERRED_NID_GET``. Should be 0 for all other commands.
+
+Must have the ptrace access mode: `PTRACE_MODE_READ_REALCREDS` to get/set
+the preferred node ID to a process otherwise returns EPERM.
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 373046c82b35..8054fd37acdc 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2261,6 +2261,15 @@ static inline void sched_core_fork(struct task_struct *p) { }
 static inline int sched_core_idle_cpu(int cpu) { return idle_cpu(cpu); }
 #endif
 
+#ifdef CONFIG_NUMA_BALANCING
+/* Change a task's numa_preferred_nid */
+int prctl_chg_pref_nid(unsigned long cmd, int nid, pid_t pid,
+		       unsigned long uaddr);
+#else
+static inline int prctl_chg_pref_nid(unsigned long cmd, int nid, pid_t pid,
+				     unsigned long uaddr) { return -ERANGE; }
+#endif
+
 extern void sched_set_stop_task(int cpu, struct task_struct *stop);
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..e8a47777aeb2 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,12 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+/*
+ * Set or get a task's numa_preferred_nid
+ */
+#define PR_PREFERRED_NID		78
+# define PR_PREFERRED_NID_GET		0
+# define PR_PREFERRED_NID_SET		1
+# define PR_PREFERRED_NID_CMD_MAX	2
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79d3d0840fb2..7afff9fa3922 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -49,6 +49,7 @@
 #include <linux/ratelimit.h>
 #include <linux/task_work.h>
 #include <linux/rbtree_augmented.h>
+#include <linux/prctl.h>
 
 #include <asm/switch_to.h>
 
@@ -3670,6 +3671,69 @@ static void update_scan_period(struct task_struct *p, int new_cpu)
 	p->numa_scan_period = task_scan_start(p);
 }
 
+/*
+ * Enable setting task->numa_preferred_nid directly
+ */
+int prctl_chg_pref_nid(unsigned long cmd, pid_t pid, int nid,
+		       unsigned long uaddr)
+{
+	struct task_struct *task;
+	struct rq_flags rf;
+	struct rq *rq;
+	int err = 0;
+
+	if (cmd >= PR_PREFERRED_NID_CMD_MAX)
+		return -ERANGE;
+
+	rcu_read_lock();
+	if (pid == 0) {
+		task = current;
+	} else {
+		task = find_task_by_vpid((pid_t)pid);
+		if (!task) {
+			rcu_read_unlock();
+			return -ESRCH;
+		}
+	}
+	get_task_struct(task);
+	rcu_read_unlock();
+
+	/*
+	 * Check if this process has the right to modify the specified
+	 * process. Use the regular "ptrace_may_access()" checks.
+	 */
+	if (!ptrace_may_access(task, PTRACE_MODE_READ_REALCREDS)) {
+		err = -EPERM;
+		goto out;
+	}
+
+	switch (cmd) {
+	case PR_PREFERRED_NID_GET:
+		if (uaddr & 0x3) {
+			err = -EINVAL;
+			goto out;
+		}
+		err = put_user(task->numa_preferred_nid_force,
+			       (int __user *)uaddr);
+		break;
+
+	case PR_PREFERRED_NID_SET:
+		if (!(-1 <= nid && nid < num_possible_nodes())) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		rq = task_rq_lock(task, &rf);
+		task->numa_preferred_nid_force = nid;
+		task_rq_unlock(rq, task, &rf);
+		sched_setnuma(task, nid);
+		break;
+	}
+
+out:
+	put_task_struct(task);
+	return err;
+}
 #else
 static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 {
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..20629a3267b1 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2746,6 +2746,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_SCHED_CORE:
 		error = sched_core_share_pid(arg2, arg3, arg4, arg5);
 		break;
+#endif
+#ifdef CONFIG_NUMA_BALANCING
+	case PR_PREFERRED_NID:
+		error = prctl_chg_pref_nid(arg2, arg3, arg4, arg5);
+		break;
 #endif
 	case PR_SET_MDWE:
 		error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index 35791791a879..937160e3a77a 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -328,4 +328,10 @@ struct prctl_mm_map {
 # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_MASK		0x1f
 
+/* Set or get a task's numa_preferred_nid
+ */
+#define PR_PREFERRED_NID		78
+# define PR_PREFERRED_NID_GET		0
+# define PR_PREFERRED_NID_SET		1
+# define PR_PREFERRED_NID_CMD_MAX	2
 #endif /* _LINUX_PRCTL_H */
-- 
2.43.5

