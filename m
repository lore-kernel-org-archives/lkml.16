Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548DFA55
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035053; cv=none; b=if4fVOjw69uEo99mElqPSA+uFmJr1ZbrCBdOAIRpeePRVGtbiayU3RYKHBGxAvSWCpmYqEIjJjZUI0XCbjnkP/0S7zOe5dXm9XcgJ83LS1RMnzOBv6B3phXXakipJSLIKu/TiYZVO2GmaR/BKPYfOkaWv8My3RntyTddQ5v9zPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035053; c=relaxed/simple;
	bh=hBuiaaAx+f/L53Q11MOG6jdETYZX61xauWm5FUxuyNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkxVQV3qmw28Po8nZ5H0l6uQtw7PNMeqvvp22vN1PpQqL6KWsxIW3EV93GMioP2L8r35PAjhma7EBkEUjWlRt63Q5hhsV2Q6TyKWShRqQQk1E35DaTNDM84lv0JwWWG2vv7mIJedP2erl3Bmm4J7j+I4pos9vdekpneqLFD75X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BFbcutSa; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BFbcutSa"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QK0ZXq005118;
	Thu, 27 Mar 2025 00:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=4ySad
	hY0Db63ZVl7XxfS6wGZg2aPzOj50UsYHKE/zQk=; b=BFbcutSaK5KyVhn0Iuw74
	6fTiGaotzaK/ePf/ONr8QNepIEI415xQoqGCMo7KBVhjewCVzQwjxc5jhBh33qxD
	yEU+eMDN+5e1pZRZ0Ixr49DFdBYYPKBuLWoGJPKcEPGxz5B/aKB3Mfl/EMuC8ILA
	36FIz6RCBIPMX+f9NNqgMhXS32shyIerq6s8rIMyixRPt56TJdT/dPU40GtSq/k2
	+UyirFS3+uPy+c72WIMrOk2PjzGWMUy1NPY1yfLlvmOVc7T0KYkfqmMzuHwHez6b
	1tM29mvbixil01Gcz4ibRvgUgwT+gO0n8Ylrx6pPv4dCX82Qs+dINagaAL7BJPrD
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hnrsk1q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 00:23:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52QMDTGk016011;
	Thu, 27 Mar 2025 00:23:53 GMT
Received: from clb-2-bm-ad2.osdevelopmeniad.oraclevcn.com (clb-2-bm-ad2.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jj9465pr-2;
	Thu, 27 Mar 2025 00:23:53 +0000
From: Libo Chen <libo.chen@oracle.com>
To: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
Subject: [PATCH v2 1/2] sched/numa: skip VMA scanning on memory pinned to one NUMA node via cpuset.mems
Date: Wed, 26 Mar 2025 17:23:51 -0700
Message-ID: <20250327002352.203332-2-libo.chen@oracle.com>
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
X-Proofpoint-GUID: S9FAdRiuyzbzDqXzqmAhbGqov1U13U7g
X-Proofpoint-ORIG-GUID: S9FAdRiuyzbzDqXzqmAhbGqov1U13U7g

When the memory of the current task is pinned to one NUMA node by cgroup,
there is no point in continuing the rest of VMA scanning and hinting page
faults as they will just be overhead. With this change, there will be no
more unnecessary PTE updates or page faults in this scenario.

We have seen up to a 6x improvement on a typical java workload running on
VMs with memory and CPU pinned to one NUMA node via cpuset in a two-socket
AARCH64 system. With the same pinning, on a 18-cores-per-socket Intel
platform, we have seen 20% improvment in a microbench that creates a
30-vCPU selftest KVM guest with 4GB memory, where each vCPU reads 4KB
pages in a fixed number of loops.

Signed-off-by: Libo Chen <libo.chen@oracle.com>
---
 kernel/sched/fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e5807..6f405e00c9c7e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3329,6 +3329,13 @@ static void task_numa_work(struct callback_head *work)
 	if (p->flags & PF_EXITING)
 		return;
 
+	/*
+	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
+	 * no page can be migrated.
+	 */
+	if (nodes_weight(cpuset_current_mems_allowed) == 1)
+		return;
+
 	if (!mm->numa_next_scan) {
 		mm->numa_next_scan = now +
 			msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
-- 
2.43.5

