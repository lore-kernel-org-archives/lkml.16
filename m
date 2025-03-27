Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DE2576
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035054; cv=none; b=I6RQRuNHyLYL0tvmoTyLicyIYrXnQhLNT4vk9xhFQ8+zwBnqlPpJClo6EugNp1UPNfR7w4AMGqWC8iiW4u7tQdgIhPO7BN32kakZ4+3pvWETqUYD71zhRRlwbyqr/MEjrzqBqd6XRKhEhy4UpYmRjHDbq5EzOEVY4mIqyilIsbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035054; c=relaxed/simple;
	bh=5wafyIN48zJ4F4r7LP1sidlLxsmu0xaWh8EwA4NGr6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYBH2U3JrnbxqZO7MIVKx8Jl7EqjWsDOB/VgGg1zS2mN09KohrnZxVDKwmlIMUZyfkGT1QDSbYf22qKC+4tXKg9QGJOggrJwhLk//bJu9Ghv31WCtICaxVnCzY7Z9VNRzZrreaC1qk61JM+G6BAVZtSympbW2LhCWo2YOkmwH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bi4wlPxh; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bi4wlPxh"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QK0UIa024616;
	Thu, 27 Mar 2025 00:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=w6qCVgdk5TdFH+HvwXZjDm65omEih
	uaEMZMZo2bKcC0=; b=Bi4wlPxhxYzWZ3KuFM7vi4bvEcGJL9m9wLd/5vLCAeSJZ
	rzko2haXAvLTAyBH3CK/L+FhKsBmf8WPYtYGzOI94aGC24FLB2sAqfazo6cTN3xp
	r1zVHJf1FaW3xQv4swicr+1aWCznyWvmX4aqwM/pebIS29wwraPXBBX42gCyO4qI
	E8JhECtWyqCQN1VE+8EknN4yHYrK6aCz1PwIS1dr2+HpMpmmIbFb0bCmYtKb+8YX
	npnuJJm/vewW58mMeJ1VeyFP+fz2vcHSvo5eAjQ/Os71U0w3+251B1LeAKnyLBZI
	MH/lo3Tcd98VjcgOPICuBfFyMFP5DmBsRyUVe7/lA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45mqft8ka5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 00:23:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52QMDTGj016011;
	Thu, 27 Mar 2025 00:23:52 GMT
Received: from clb-2-bm-ad2.osdevelopmeniad.oraclevcn.com (clb-2-bm-ad2.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jj9465pr-1;
	Thu, 27 Mar 2025 00:23:52 +0000
From: Libo Chen <libo.chen@oracle.com>
To: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
Subject: [PATCH v2 0/2] sched/numa: skip VMA scanning on memory pinned
Date: Wed, 26 Mar 2025 17:23:50 -0700
Message-ID: <20250327002352.203332-1-libo.chen@oracle.com>
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
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=758 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270001
X-Proofpoint-GUID: bwx0NLRix8ZQm_iXcRIc0REHGNTgj-6W
X-Proofpoint-ORIG-GUID: bwx0NLRix8ZQm_iXcRIc0REHGNTgj-6W

v1->v2:
1. add perf improvment numbers in commit log. Yet to find perf diff on
will-it-scale, so not included here. Plan to run more workloads.
2. add tracepoint.
3. To peterz's comment, this will make it impossible to attract tasks to
those memory just like other VMA skippings. This is the current
implementation, I think we can improve that in the future, but at the
moment it's probabaly better to keep it consistent.


Libo Chen (2):
  sched/numa: skip VMA scanning on memory pinned to one NUMA node via
    cpuset.mems
  sched/numa: Add tracepoint that tracks the skipping of numa balancing
    due to cpuset memory pinning

 include/trace/events/sched.h | 31 +++++++++++++++++++++++++++++++
 kernel/sched/fair.c          |  9 +++++++++
 2 files changed, 40 insertions(+)

-- 
2.43.5

