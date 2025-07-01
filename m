Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600013B58C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330320; cv=none; b=qzEysD1+0hPvTzUJfRGAn0HqDUpy8uYXFsjqba4Y3JUVOGaq4OUro2G6hItuxEEWfIRvJLM/XAdXjOd/WF0xXXNnDb4URgfGGpQz1kNFMcMePm4fFua/pufhVK53vuspRWBWISy6qMhRLipXEP5388muVVxFnoXVMQocfQ+cXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330320; c=relaxed/simple;
	bh=JmIFNVOCR4f+zxjdByCuOfbZcElgnNMfOwmqmNcdgQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=offsW6kKBZ2zlppdzGQnBENUJXsCS2XaFQL2dTnsnGxbXfQrUayNyEK7Xfw1Jt0v78JtXquNqo7yxLXH2y7TZLkDe7OILsIVbvHKi/17ksUwwhoJwR/K30QSaKTnkN1vegAhTC1EDzs0M55XyradA+N4U/SqtHpvXZmN7PgLPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PJ7ylUsd; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PJ7ylUsd"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIBu7S008757;
	Tue, 1 Jul 2025 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=W9q+f
	pNkcPhzhcIY94lwtSqZPlyU3ObG42XmnMIrhc0=; b=PJ7ylUsdHILznrnRVmghk
	FRPApsv11oY7534g/MmSFY4/0AJpvrWKvl9+JApj2bq/qSwqevjgdx+ZuWOmSv/8
	mYDPmfFXFFg4wnH6RyAlUfdG9KzAs4H82krzdhk0qA3Imxdt5Vh59ZhdrLy1JQu+
	9lCoVFNAG3gttObO0aZyoDjynOQ5zxQ4BC+quZGyhalljNw/7GngmYp3vtMa8Jhz
	SMxmwwANNrJy8g1AASP/4nkn0yeLYIzMTUlFe18W+DpOEMAAOCCkwT1S1XL+abxP
	pY/n+71v/b1OaheKxaeTF7XgLK72S40At+9yuIh8mjrOS1rxsLTdtGi0hw/NkPjf
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766bmwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNc009139;
	Tue, 1 Jul 2025 00:38:09 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:09 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 6/7] Add API to query supported rseq cs flags
Date: Tue,  1 Jul 2025 00:37:48 +0000
Message-ID: <20250701003749.50525-7-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250701003749.50525-1-prakash.sangappa@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010002
X-Proofpoint-GUID: TuX6X3_ckw4cp1GUgJvC7Ie3lZTZCK5C
X-Proofpoint-ORIG-GUID: TuX6X3_ckw4cp1GUgJvC7Ie3lZTZCK5C
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68632df1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=7d_E57ReAAAA:8 a=yPCof4ZbAAAA:8 a=Y-svIdjkOGLC8tcnJfAA:9 a=jhqOcbufqs7Y1TYCrUUU:22 cc=ntf
 awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX4dDkAYxRRaq6 4/va2HPEy/QmhX9UNsnxaRC5grAhtSeaSd8cKi6UAMkmzMFkum4sThg0nZdk3fMT4uiU8n3w8jw Hy0DdGH5VF3Fxj6u5cL41NvXK9LxO5VAKY/XJcGI4160yKyQSvsVkV4bxQb3ufNcGvgww169Wwy
 Bmdx+Oo6n7Nb4mGGaZdLuIeMuhl7N/10Kd25MIYhWyqYG88jlBWRYhVlIe0QwV1LaUp9pHZm8Nc CGAEJVn8NTGX3++VkYqAEPe/Mt958YgWg7+0NoxoMrb3YTKSy/8iqTgJHVNsgkeoB4yEeIQKMbM t+q8/9iDCVk46SUHYot4twiYwllSJpBD9NIk7Whta1KOOIUvmCifay5Hnn7LxA/1cM+DH40744l
 y72bc5T7rmItyA9RBWFy0iX1/LXW/aLQMsvVhTl0oLeiHEjWK/R5CkBxlf2FJh+bpP1j3f1A

For the API, add a new flag to sys_rseq 'flags' argument called
RSEQ_FLAG_QUERY_CS_FLAGS.

When this flag is passed it returns a bit mask of all the supported
rseq cs flags in the user provided rseq struct's 'flags' member.

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/uapi/linux/rseq.h |  1 +
 kernel/rseq.c             | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index 015534f064af..44baea9dd10a 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -20,6 +20,7 @@ enum rseq_cpu_id_state {
 
 enum rseq_flags {
 	RSEQ_FLAG_UNREGISTER = (1 << 0),
+	RSEQ_FLAG_QUERY_CS_FLAGS = (1 << 1),
 };
 
 enum rseq_cs_flags_bit {
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 99aa263c3a07..7710a209433b 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -575,6 +575,21 @@ SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len,
 		return 0;
 	}
 
+	/*
+	 * Return supported rseq_cs flags.
+	 */
+	if (flags & RSEQ_FLAG_QUERY_CS_FLAGS) {
+		u32 rseq_csflags = RSEQ_CS_FLAG_DELAY_RESCHED |
+				   RSEQ_CS_FLAG_RESCHEDULED;
+		if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
+			return -EINVAL;
+		if (!rseq)
+			return -EINVAL;
+		if (copy_to_user(&rseq->flags, &rseq_csflags, sizeof(u32)))
+			return -EFAULT;
+		return 0;
+	}
+
 	if (unlikely(flags))
 		return -EINVAL;
 
-- 
2.43.5

