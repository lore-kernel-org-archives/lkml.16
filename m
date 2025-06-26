Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90A2E427B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943383; cv=none; b=A6dtBPAjuCK3LloY4lLimFj5lJYWKpLXkV72RehRQ2N5RyOuFAohVQxFVL0QTEJmni18Z/MIp+N1+pEXAvm15h9TiOKbnyLwyrNaUM5K+u/F46zluWP/GShCpGGbTnIpSH6wuRB/r5H9d7vdWqOFfrTllUUsfUTgbIrdHi93PjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943383; c=relaxed/simple;
	bh=WwkYMB2zZ9yX2Tkk8lFoELVwvL+EOjMVlpZO+CYoShk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IK/85Tbq7O2OYnqhME5W4+s1MHWGxRt4cl7JZtl3hX5RiSps5kcTH/HGI9p3ZxnMvSRt8mUvy0lYRAjl1BrMgyU5id7cOtEfPSrNE4tLIW/1UFuh8xy5rsI3qjRsS9KLSO040+HFjTpsizwVleW4rTN+LH1Y+oUk0g1juwHGI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LC2zYPaS; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LC2zYPaS"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCaWlZ027580;
	Thu, 26 Jun 2025 13:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=sALiUtyxcN1wQ6o0j5MGblPljhcbJ
	5JqrksgOESEDdQ=; b=LC2zYPaSNf8z5AiEEiZShPR8K6QCvFIjGMnPFU61yPNLS
	uoWOYAudy5fQUV3jv7Z2bFb3SprGSXu0ZC4DCnQvD9zx7ypcshTBrAGUyRyzdT+4
	UUXqIj4/enJihRD/dFH05+93ShkPxeAbh5iR7ng26EDCUs+g//RwffX4xDEXqg0A
	EnYfLxTTYLpP1Li9/zz7vXaABs7uPTo5BKblDFg/VJr7kVJ/N9KtVYDAO90Aip7u
	6xiPhHVGzzNqxga73xQvZIo57iitgEaCEQGkplZBS1flHtQToQuSH9oYJ/TCshGY
	W+QDF7qyPj6Yy7CVaP9hwxJcLo4tz75S30y4pX/SQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumrrcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 13:09:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QBePCk034324;
	Thu, 26 Jun 2025 13:09:21 GMT
Received: from aruramak-dev.osdevelopmeniad.oraclevcn.com (aruramak-dev.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.155])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehktfjua-1;
	Thu, 26 Jun 2025 13:09:21 +0000
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com
Subject: [PATCH] sched: Change nr_uninterruptible type to unsigned long
Date: Thu, 26 Jun 2025 13:09:20 +0000
Message-ID: <20250626130920.4019152-1-aruna.ramakrishna@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260110
X-Proofpoint-ORIG-GUID: jt5Q9_r0VfzdH_qC-CF7FBkjG-Zz51SS
X-Proofpoint-GUID: jt5Q9_r0VfzdH_qC-CF7FBkjG-Zz51SS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExMSBTYWx0ZWRfX+2pYL63MTaFA neRdc90/WAs+lzTp54pMLrLXcE0CEhcqzVirT64zoEM9nYDrT79PRRWf33CA1KDX4vI7To+RPF6 sRYLj5pPtLpj8fz2wxDuLxi21rJqo+zlz4YCzZ33PL+ZOeK4u2gICg+i5XluFpCiTce/gBt0jaN
 WJThrPOI37P39P2IXEjqM4P0UVifjyPX83w/Qh8KoDSsX6TyoVO968Pwop3JsfnzxVwj2nA8Sfg o7qo7O+2r4CIGQKD0ZL/eBgZZSw8ZiMsxn5xI1Bhvj0lwcyYSG1+QNvWbXxUw07myAcxSRXsrR5 NZcbuEY9staps9vdKIkeC43H7Rus9hIgWyE41Y3xbWym98BKKenFO8oExJnpmJQ0rcD02b/Mf/U
 Ursw9aSlC+8EjYmrYXAbGZg65xwrTI9i3yGZEaeqTYBDQcfxnsoGthssfXaZ1+VDrivWBitf
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685d4682 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=3hMAoP2lnyBJ8C0jIBMA:9 cc=ntf awl=host:13216

The commit e6fe3f422be1 ("sched: Make multiple runqueue task counters
32-bit") changed nr_uninterruptible to an unsigned int. But the
nr_uninterruptible values for each of the CPU runqueues can grow to
large numbers, sometimes exceeding INT_MAX. This is valid, if, over
time, a large number of tasks are migrated off of one CPU after going
into an uninterruptible state. Only the sum of all nr_interruptible
values across all CPUs yields the correct result, as explained in a
comment in kernel/sched/loadavg.c.

Change the type of nr_uninterruptible back to unsigned long to prevent
overflows, and thus the miscalculation of load average.

Fixes: e6fe3f422be1 ("sched: Make multiple runqueue task counters 32-bit")

Signed-off-by: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
---
 kernel/sched/loadavg.c | 2 +-
 kernel/sched/sched.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/loadavg.c b/kernel/sched/loadavg.c
index c48900b856a2..52ca8e268cfc 100644
--- a/kernel/sched/loadavg.c
+++ b/kernel/sched/loadavg.c
@@ -80,7 +80,7 @@ long calc_load_fold_active(struct rq *this_rq, long adjust)
 	long nr_active, delta = 0;
 
 	nr_active = this_rq->nr_running - adjust;
-	nr_active += (int)this_rq->nr_uninterruptible;
+	nr_active += (long)this_rq->nr_uninterruptible;
 
 	if (nr_active != this_rq->calc_load_active) {
 		delta = nr_active - this_rq->calc_load_active;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..83e3aa917142 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1149,7 +1149,7 @@ struct rq {
 	 * one CPU and if it got migrated afterwards it may decrease
 	 * it on another CPU. Always updated under the runqueue lock:
 	 */
-	unsigned int		nr_uninterruptible;
+	unsigned long 		nr_uninterruptible;
 
 	union {
 		struct task_struct __rcu *donor; /* Scheduler context */

base-commit: 86731a2a651e58953fc949573895f2fa6d456841
prerequisite-patch-id: dd6db7012c5094dec89e689ba56fd3551d2b4a40
-- 
2.43.5

