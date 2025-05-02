Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92151E7C1C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746217060; cv=none; b=nzfep4LI44n2BeLcly1W37dLjb3h/3+G/Rr5r3TcHc6iNp8fKL6ox9oVXb30U8yEam+IO8PcBPOHJyVPVqb7xgHBL2bKWQjCLKPBtVwjbpZolkZMzJY7BzHVSXbEpQskYxecAjLkpMdaocIBE+jpt4sa35CrjVCOeDog8ptVXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746217060; c=relaxed/simple;
	bh=vMBVLbf5OID//fcYxXvDY9+dqT177CKPjbn751pJe1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9lPH4qbdu+37O6vQ4/XMdgsyMCXMmqRGexLODNFySG2eM/BAjo+SvOXvLA4/BbP+tYZwxKW+YpAmMdVw0tL6eyP+f4jBcMQt0l+yzYFIDuWWRhcP3XgTJjszlPjqcu6tJjhIiurZqCxq7wVxWduovKhCUIqFPwOmRiYM1vMT+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fjowZqFK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fjowZqFK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542IttOx012818;
	Fri, 2 May 2025 19:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PxphJ
	9zXrLTvXU4WJxb7ONiV6POUcra+FT7lmudrcs8=; b=fjowZqFKTngInJu4iFLrj
	sxCVp6rwLMQX3CIXoLEzBtaw42ArQkw+rAAE5MthBQ8UEva+AApma1Ge0k17WhIC
	ctYC7fQnkxrSYxz0R/lRbHCLDMCtXrrfzfTeCCVCvH0Dio6tJemwu+Pna96Gm3a8
	R9takCcIy3cO3YyUjBRnF+XqXrPUUu7hZGbQWcVHw1a4iVClT/rUnGGBHAG2F9Uv
	Zr0camRNtVoUqhZ6GZRjbMqvUb1c+UqopZGL2+buuoqphUJgfM1DJLTL2+0/u6tf
	Dgl+xDqYui0xZ+IhgMoyajAdLPcD7PvuRXYiW0dxpsA0YjuquCKCVr6t/iDpc8vn
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucnxhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542HbqAJ023907;
	Fri, 2 May 2025 19:01:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxmc1a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:06 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 542J12rJ022528;
	Fri, 2 May 2025 19:01:05 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 468nxmc184-3;
	Fri, 02 May 2025 19:01:05 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Mel Gorman" <mgorman@suse.de>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 2/2] sched/numa: prctl to set/override task's numa_preferred_nid
Date: Fri,  2 May 2025 14:59:42 -0400
Message-ID: <20250502190059.4121320-3-chris.hyser@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=68151672 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=q7DLWhjdFf-lwwGHQe0A:9 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: UPFOs1ih9IgPr7_l6mKllTCQ9_xyY8kw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1MiBTYWx0ZWRfXxXKRRey0KU0B MzTmltcOzhlY58Xx34ur/OOxEvC9qGbZKBeg9q1FQWwYEXHSh5l2EGzSb9vZ5QfgUXlVUtNYecE LeYcLz4aW6J1Pmk6rvd2ig3DTnXH5ShBYtuPPXKUfczNBVoB+jiXR8/vZ5nzwV1LhBcOnCLWJu8
 GEy/ez3dGc5ociJTL+nlfUB9ZLEAxGmUROw0STai0++TqPHMAUrzK2H7HXXNNGV31CnNIqgOCl8 WuOgA/S08uBi9Al+BaoQBIn7FsqI29zzyX6QM9WdKjbFKZBUm+R6RsMvq6dtDL1JCT0upr1l3lM g3sO7k5EvWOdITp81Wb8sSCGk5r489UHG4LIfCu24YCKxsDh1KyTz2O1wdQZf29XATG74lY+F/+
 9yZlx/yAGn3tjXJ10HjiEjs/La9IJzDoKdlHNz/5gYPeJOk2MvH6kEnHIvq/l90KluHSdBzX
X-Proofpoint-GUID: UPFOs1ih9IgPr7_l6mKllTCQ9_xyY8kw

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
index 26781452c636..81f613f2b037 100644
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

