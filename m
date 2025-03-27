Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AED2F36
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035055; cv=none; b=URsZBhBYg4bDi5KNX/rOpb6xyetRIgpLELz+Wsq8GATI1qAvt71/WM2nHd50Jsvs5MD/lcMCZIDf+peSWYN6CXbcUd2Rvk5KuXk1UrohJx6lSoN2fHKU4nds6BenKypcJy6+PVdBV8MTC1apnQfpZEYox/zKpyybFYSfsB7YXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035055; c=relaxed/simple;
	bh=IzHSEmd7S9fD67nh85jYveW/tK7fAailSrpNPVzEJhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYSGA1OrFalwnk0SCFzC/jsYVTl/FB9QKz3LQIPfH5eTvmMiE+neg0kuiKflHi8GbTbBraCw9Pk9BU4cG0HwYNDIAbsT61xDyORWtbb3zNypGPFG+DgxKy2V1DvLjBES4HskYWSPKf6rjq3gRYLIyF1SOuXe897FuvTLLfzWqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QBiepHa9; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QBiepHa9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QK0elJ014324;
	Thu, 27 Mar 2025 00:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=CVyNx
	r0bt0K2eZ05OM2w2Ki82TKLtr4rkpKoWELND90=; b=QBiepHa9uanJdOF/4ytlO
	4hGsqTTzuqi/Ou1bd0YDq2YxrdKHvtIYzj9MvuGgJFel8j4yDNjozIUUWvmOGZfh
	HeEqTVbleO1k6R0MQ8SBBw89NMymdVuv8Jv7ebJhdK6uGEhwfUZI2ZX4w9Mew8XN
	AzEf0bm7gwAHiNgAi5604jX/eNvm4dS0nIsmO7xuxVAKVc5Rz9w2+kIOdSzFVrnA
	T1VmggGNnYt6vf9FtxZKspXnUpMVG+jtjnwGYxmi5hmU5cJNg9rjxxOcXi5tQuSO
	TjsnUglFV1xIOu1skMisSzJ+FrEFkZ85YXcpKysfz82bTVWpyz8v33YRxC6D+Oyz
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn5mb2su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 00:23:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52QMDTGl016011;
	Thu, 27 Mar 2025 00:23:53 GMT
Received: from clb-2-bm-ad2.osdevelopmeniad.oraclevcn.com (clb-2-bm-ad2.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jj9465pr-3;
	Thu, 27 Mar 2025 00:23:53 +0000
From: Libo Chen <libo.chen@oracle.com>
To: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
Subject: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the skipping of numa balancing due to cpuset memory pinning
Date: Wed, 26 Mar 2025 17:23:52 -0700
Message-ID: <20250327002352.203332-3-libo.chen@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250327002352.203332-1-libo.chen@oracle.com>
References: <20250327002352.203332-1-libo.chen@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270001
X-Proofpoint-GUID: RRE9nYTgaYdYEKeQdTlj1YMDapZfUrq_
X-Proofpoint-ORIG-GUID: RRE9nYTgaYdYEKeQdTlj1YMDapZfUrq_

Unlike sched_skip_vma_numa tracepoint which tracks skipped VMAs, this
tracks the task subjected to cpuset.mems pinning and prints out its
allowed memory node mask.
---
 include/trace/events/sched.h | 31 +++++++++++++++++++++++++++++++
 kernel/sched/fair.c          |  4 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index bfd97cce40a1a..133d9a671734a 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -745,6 +745,37 @@ TRACE_EVENT(sched_skip_vma_numa,
 		  __entry->vm_end,
 		  __print_symbolic(__entry->reason, NUMAB_SKIP_REASON))
 );
+
+TRACE_EVENT(sched_skip_cpuset_numa,
+
+	TP_PROTO(struct task_struct *tsk, nodemask_t *mem_allowed_ptr),
+
+	TP_ARGS(tsk, mem_allowed_ptr),
+
+	TP_STRUCT__entry(
+		__array( char,		comm,		TASK_COMM_LEN		)
+		__field( pid_t,		pid					)
+		__field( pid_t,		tgid					)
+		__field( pid_t,		ngid					)
+		__array( unsigned long, mem_allowed, BITS_TO_LONGS(MAX_NUMNODES))
+	),
+
+	TP_fast_assign(
+		memcpy(__entry->comm, tsk->comm, TASK_COMM_LEN);
+		__entry->pid		 = task_pid_nr(tsk);
+		__entry->tgid		 = task_tgid_nr(tsk);
+		__entry->ngid		 = task_numa_group_id(tsk);
+		memcpy(__entry->mem_allowed, mem_allowed_ptr->bits,
+		       sizeof(__entry->mem_allowed));
+	),
+
+	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",
+		  __entry->comm,
+		  __entry->pid,
+		  __entry->tgid,
+		  __entry->ngid,
+		  __entry->mem_allowed[0])
+);
 #endif /* CONFIG_NUMA_BALANCING */
 
 /*
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6f405e00c9c7e..a98842a96eda0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3333,8 +3333,10 @@ static void task_numa_work(struct callback_head *work)
 	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
 	 * no page can be migrated.
 	 */
-	if (nodes_weight(cpuset_current_mems_allowed) == 1)
+	if (nodes_weight(cpuset_current_mems_allowed) == 1) {
+		trace_sched_skip_cpuset_numa(current, &cpuset_current_mems_allowed);
 		return;
+	}
 
 	if (!mm->numa_next_scan) {
 		mm->numa_next_scan = now +
-- 
2.43.5

