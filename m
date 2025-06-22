Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802D1FE477
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619802; cv=none; b=kfpvOoxIN7ti4CBE5bGWeprDe1NIdNc5EYR81/5k87G9Nxf63HbxBgDSnecMRuAE2iZUtU3wo19SMUnxaqZaY+sNN3Vn499sMYOlT1XMxhUYFfgkhHRNeu9jZ0gYjyphl6aMqa4LwPYG5NWwqVDC/U45udCllRNGYUBm6bCPUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619802; c=relaxed/simple;
	bh=NchBfe88z1lx0va8Shm1gNDdirzCmReVpbOm6bT5Osw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQLJehvWSQKoITHTEKzKoH+ytEkA/XtkRbo4Y42SPao9UhVtfEJL+eXlNYVjZNo6pzdVjVD443TtPOU5PK9MjiIilX+AV7YKYRKVz/uveuI5c2xgr4FBBemIoF+WYdQSJpkkbhDFmoBlJWkshG6nwo3kiostFsCbBG0JlER7dLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DLIKtvRx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DLIKtvRx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MI1BuG000387;
	Sun, 22 Jun 2025 19:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=cGpUo
	gdu++EZtaNPoaCWK9uLsZ6hb/Vxg+JmYJ5vFIU=; b=DLIKtvRxdNuwyKOLy0T1t
	dWaGHOttFNYDeMqAt3E6n2UbfU/7BOyNaA+EXOkgelL7YF/iGvLuoEn9NK9cC9jd
	bUg6HjDnnGg/o9GkDfGSKVE5fVQdZLKpnaYLt+osPFRSWRjltOPIsCYgZpmty3U1
	Kw6jas8oZU1hqJ6Qsacnbfo4WNNGOJ3K+wJSnfoSanwq2ra/W62MVsNuSemoXtbd
	G3h9v6H8Kp2912joMJLlFr+E/TKYHBsPc4OVTdBnWttx34IfEZbjHXWquLrwnOoV
	zQ2QdXjz0DQqcMJ4uFfal4ceLLlan5OScC0WP5MtjwQ5E81dw7ww4V8tFHhJzbAZ
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumg89j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MIX0AJ038973;
	Sun, 22 Jun 2025 19:16:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr2mp2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:27 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MJGQSd024048;
	Sun, 22 Jun 2025 19:16:26 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehr2mp2j-3;
	Sun, 22 Jun 2025 19:16:26 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Dhaval Giani" <dhaval@gianis.ca>, "Jonathan Corbet" <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, chyser@yahoo.com
Subject: [PATCH 2/2 v3] sched/numa: prctl to set/override task's numa_preferred_nid
Date: Sun, 22 Jun 2025 15:15:36 -0400
Message-ID: <20250622191622.3296825-3-chris.hyser@oracle.com>
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
X-Proofpoint-ORIG-GUID: A0SzGxvu4uCM6TIMmSLQiwlH_GRLO_6r
X-Proofpoint-GUID: A0SzGxvu4uCM6TIMmSLQiwlH_GRLO_6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDEyMyBTYWx0ZWRfX/qvt2dODjBY/ Csn5jkH2UkPSGn+QUIRh9x0Y/GpTUW5Vm2uc0ZlNBdpVQmn/zC25jXxiwLYjOEafmaWHw4E7kq/ ylwoA9NT5DsloUkfK6JpJPT8inhyEkxmxnrVgoqNpk0Oy9tiA3ibhxoOzbz9+PMXIEJWcNyuKSl
 PmeT35DTRef9Wb/3gu3pz9CSiMMz+seLbyNKnR2xQwGsfzcslDZIqXDmeMp59E42z2ep5a6eZvO fjz0ODvUkHxxzEm6mM7I/29dreS1Jh9CoOUb3VSgAx9x059vex++RmBQRlzWyQiNFndcPJxpYra aZvti3WbsLRI8b3hmmmkCT7G9smKZefdvu3XlbMZUO32+z2ACGpR6MyGKMolq8W2t7KHQIGIGDt
 m4XCohmsOVRtLLNuk/sz82Q+9lkBlRSbE5hflgYiB6OYkqdK+EBmtcdOdG5IzrRpI8Jn4oMm
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=6858568b b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=i5Q0TSjjeIhRW2zlJQgA:9 cc=ntf awl=host:13206

Adds a simple prctl() interface to enable setting or reading a task's
numa_preferred_nid. Once set this value will override any value set
by auto NUMA balancing.

Signed-off-by: Chris Hyser <chris.hyser@oracle.com>
---
 .../scheduler/sched-preferred-node.rst        | 67 +++++++++++++++++++
 include/linux/sched.h                         |  9 +++
 include/uapi/linux/prctl.h                    |  8 +++
 kernel/sched/fair.c                           | 65 ++++++++++++++++++
 kernel/sys.c                                  |  5 ++
 tools/include/uapi/linux/prctl.h              |  6 ++
 6 files changed, 160 insertions(+)
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
index bd5a307fed1e..f9f317114b32 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2202,6 +2202,15 @@ static inline void sched_core_fork(struct task_struct *p) { }
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
index 43dec6eed559..020f64938d70 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -371,4 +371,12 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
 
+/*
+ * Set or get a task's numa_preferred_nid
+ */
+#define PR_PREFERRED_NID		79
+# define PR_PREFERRED_NID_GET		0
+# define PR_PREFERRED_NID_SET		1
+# define PR_PREFERRED_NID_CMD_MAX	2
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b5c4a2507021..5c2345ca6497 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -49,6 +49,7 @@
 #include <linux/ratelimit.h>
 #include <linux/task_work.h>
 #include <linux/rbtree_augmented.h>
+#include <linux/prctl.h>
 
 #include <asm/switch_to.h>
 
@@ -3660,6 +3661,70 @@ static void update_scan_period(struct task_struct *p, int new_cpu)
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
+
 #else /* !CONFIG_NUMA_BALANCING: */
 
 static void task_tick_numa(struct rq *rq, struct task_struct *curr)
diff --git a/kernel/sys.c b/kernel/sys.c
index adc0de0aa364..0bb0df4ac70f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2747,6 +2747,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
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
index 43dec6eed559..789d06e5cb2b 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -371,4 +371,10 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
 
+/* Set or get a task's numa_preferred_nid
+ */
+#define PR_PREFERRED_NID		79
+# define PR_PREFERRED_NID_GET		0
+# define PR_PREFERRED_NID_SET		1
+# define PR_PREFERRED_NID_CMD_MAX	2
 #endif /* _LINUX_PRCTL_H */
-- 
2.43.5

